function xf=fit_lcr(s_meas,varargin)

    msg_err="passed s_meas is not a one-port sparam";
    
    if ~isa(s_meas,'sparameters')
        
        error(msg_err);
        
    end
    
    if ~s_meas.NumPorts==1
        
        error(msg_err);
        
    end
    
    z0=s_meas.Impedance;
    
    z_meas=squeeze(zparameters(s_meas).Parameters(1,1,:));
    
    freq=s_meas.Frequencies;
    
    df=mean(diff(freq));
    
    [ymax,imax,wmax]=findpeaks(abs(1./z_meas),...
        'SortStr','descend','MinPeakProminence',0.1);
    
    [imax,pmax]=min(imax);
    ymax=ymax(pmax);
    wmax=wmax(pmax);
    
    wc0=2*pi*freq(imax);
    
    qe=wc0/wmax/df/2/pi/2;
    
    l0=qe*z0/wc0;
    
    c0=1/wc0^2/l0;
    
    r0=1/ymax;
   
    freq=s_meas.Frequencies;
    
    z_meas=squeeze(zparameters(s_meas).Parameters(1,1,:));
    
    p.x0=[l0 c0 r0];
     
    p.objective=@(x) error_function(x);
    
    p.solver='fmincon';
    
    p.lb=[1e-9 1e-14 1e-1];
    
    p.ub=[1e-6 1e-11 1e2];
    
    p.options=optimoptions("fmincon","Display","iter");

    xf=fmincon(p);
    
    if ~isempty(varargin)
    
        f=figure(1);
        
        plot(freq,abs(z_meas));
        
        hold on
        
        plot(freq,arrayfun(@(x)abs(lcr_resp(xf(1),xf(2),xf(3),x)),freq));
        
    end
    
    function z=lcr_resp(l,c,r,f)
        
        w=1i*2*pi*f;
        
        z=w*l+1/w/c+r;
        
    end

    function [fc,qi,qe]=lcr_to_fq(l,c,r)
       
        wc=1/sqrt(l*c);
        
        qi=wc*l/r;
        
        qe=w*l/z0;
        
    end

    function err=error_function(x)
       
        l=x(1);
        
        c=x(2);
        
        r=x(3);
        
        err=0;
        
        model=arrayfun(@(x) lcr_resp(l,c,r,x),freq);
        
        for i=1:length(freq)
            
            err_mag=(abs(z_meas(i))-abs(model(i)))^2;
            err_phase=abs(angle(z_meas(i))-angle(model(i)));
            
            err=err+err_mag+err_phase;
            
        end
        
    end

end
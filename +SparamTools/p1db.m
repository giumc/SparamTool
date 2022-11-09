function [p,q]=p1db(x,y,varargin)

    
    if ~(length(x)==length(y))

        error ("X Y must be same length");

    end
    
    linlength=1/5;
    
    X_span=max(x)-min(x);
    
    i_to_keep=x<(min(x)+X_span*linlength);
    
    lin_X_span=x(i_to_keep);
    
    lin_Y_span=y(i_to_keep);
    
    model_fit=fit(lin_X_span,lin_Y_span,'poly1');
    
    Y_proj=model_fit.p1*x+model_fit.p2;
    
    err=abs(Y_proj-y);
    
    nonlinX=[];
    nonlinY=[];
    
    k=0;
    
    for i=1:length(err)
        
        if err(i)>1
            
            k=k+1;
            
            nonlinX(k)=x(i);
            nonlinY(k)=y(i);
            
        end
        
    end

    if ~isempty(varargin)
        
        f=figure;
        ax=axes;
        plot(ax,x,y,'DisplayName','Input Data','Color','k');
        hold on
        
        plot(ax,x,Y_proj,'DisplayName','Linearized','Color','b');
        
        if ~isempty(nonlinX)
            
            xline(nonlinX(1),'LineStyle','--','Color','r');
        
        end
        
    end
    
    if isempty(nonlinX)
        
        error (" no nonlinearity detected");
        
    else
        
        p=nonlinX(1);
        q=nonlinY(1);
        
    end
end
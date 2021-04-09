function [f,X]=calculate_TF_from_impulse(t,x)

    if ~(length(t)==length(x))
        
        error("unequal length");
        
    end
    
    Ts=mean(diff(t));
    
    Fs=1/Ts;
    
    N_samples=length(t);

    dF=1/N_samples/Ts;

    X = 1/Fs*fft(x);
    
    f = 0:dF:Fs-dF;
    
    if mod(length(X),2)==1
        
        i_max=(length(X)+1)/2;
        
    else
        
        i_max=length(X)/2;
        
    end
    
     f=f(1:i_max);
        
     X=X(1:i_max);
     
     threshold=max(abs(X))/1e4;
     
     X(abs(X)<=threshold)=0;
   
end

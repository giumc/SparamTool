function sparam_new=sparam_interp(sparam_old,f_new)

    [fit,error]=rationalfit(sparam_old,'TendsToZero',false);
    
    if error>-40

        warning("Fitted Sparameters has relative error >-40dB");
        
    end
    
    resp=fit.freqresp(f_new);
    
    sparam_new=sparameters(resp,f_new,sparam_old.Impedance);

end

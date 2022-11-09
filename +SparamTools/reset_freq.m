function sparam_new=reset_freq(sparam_old,fmin,fmax)

    old_freq=sparam_old.Frequencies;
    
    j=0;
    
    for i=1:length(old_freq)
        
        if old_freq(i)>=fmin && old_freq(i)<=fmax
            
            j=j+1;
            
            new_freq(j)=old_freq(i);
            
            spar(:,:,j)=sparam_old.Parameters(:,:,i);
            
        end
        
    end
    
    sparam_new=sparameters(spar,new_freq,sparam_old.Impedance);
    
end
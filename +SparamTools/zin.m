function z=zin(sparam,port)
    
    z0=sparam.Impedance;
    
    if sparam.NumPorts==1
        
        s11=sparam.rfparam(1,1,:);
        
        z=z0.*(1+s11)./(1-s11);
        
        return
        
    else
        
        if sparam.NumPorts==2
            
            [z11,z12,z21,z22,~]=...
                SparamTools.get_s2p(zparameters(sparam));
            
            if port==1
                
                z=z11-(z12.*z21)./(z22+z0);
                
            else
                
                if port==2
                    
                    z=z22-(z12.*z21)./(z11+z0);
                    
                else
                    
                    error("port has to be 1 or 2");
                    
                end
                
            end

            return
            
        else
            
            error("Zin can be calculated for 1 or 2 ports ");
            
        end
        
    end
    
end
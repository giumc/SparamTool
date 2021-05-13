classdef AsymmetricalSparameters < sparameters 
   
    properties
        
        Impedance_1 double;
        
        Impedance_2 double;
        
        mod_param ;

    end
    
    
    
    methods 

        function obj=AsymmetricalSparameters(data,f,z1,z2)
            
            obj@sparameters(data,f);
            
            obj.Impedance_1=z1;
            obj.Impedance_2=z2;
            
            obj.mod_param=obj.shiftimpedance;

        end
        
        
           
    end
    
    methods (Access=protected)

        function sparam_data_out=shiftimpedance(obj)

            zparam_in=zparameters(obj);
    
            Zref_1=obj.Impedance_1;
            Zref_2=obj.Impedance_2;
            
            F=inv(diag(2*sqrt([Zref_1,Zref_2])));

            Zref=diag([Zref_1,Zref_2]);

            f=zparam_in.Frequencies;
    
            sparam_data_out=ones(2,2,length(f));
            
            for i=1:length(f)

               zm=zparam_in.Parameters(:,:,i);

               sparam_data_out(:,:,i)=F*(zm-Zref)*inv(zm+Zref)*inv(F);

            end
        
        end
        
    end
    
end
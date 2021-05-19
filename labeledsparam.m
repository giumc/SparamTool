classdef labeledsparam < sparameters
    
    properties
        
        name string;
        
    end
    
    methods 
        
        function obj=labeledsparam(name,varargin)
            
            if isempty(varargin)
                
                vars={name};
                
            else

                vars=varargin;
                
            end
            
            obj@sparameters(vars{:});
            obj.name=name;
            
        end
        
    end
    
end
            
        
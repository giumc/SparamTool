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
    
    methods

        function x=get_params(obj,i,j)
            
            x=obj.Parameters(i,j,:);
            
            x=squeeze(x);
            
        end
        
        function x=get_freqs(obj)
            
            x=squeeze(obj.Frequencies);
            
        end
        
        p=draw_plot(obj,ax,n,m,format,varargin);
        
    end
    
end
            
        
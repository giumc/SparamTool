function plot_all_sp_in_folder(p,varargin)
    
    sp=SparamTools.get_all_sp_in_folder(p);
    
    if ~isempty(varargin)
        
        if length(varargin)==2
            
            i=varargin{1};
            j=varargin{2};

        else
            
            error("pass i,j here");
            
        end
        
    else
        
        i=1;
        j=1;
        
    end
        
    f=figure;
    
    ax=axes;
    
    ax.YAxis.Label.String=sprintf("S_{%d%d} [dB]",i,j);
    
    for i=1:length(sp)
        
        p(i)=line(ax,...
            SparamToools.dbmag(sp(i).Parameters(i,j,:)),...
            GraphicTools.scale(sp(i).Frequencies),...
            'DisplayName',...
            string(i));
        
        ax.NextPlot='add';
        
    end
    
end
    
    
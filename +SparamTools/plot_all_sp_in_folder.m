function plot_all_sp_in_folder(p,varargin)
    
    sp=SparamTools.get_all_sp_in_folder(p);
    
    GraphicTools.defaultgraph;
    
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

    f=gcf;
    
    delete(f.Children);
    
    ax=gca;
    
    ax.YAxis.Label.String=sprintf("S_{%d%d} [dB]",i,j);
    
    for k=1:length(sp)
        
        sp(k).name=replace(sp(k).name,(".s"|".S")+digitsPattern(1)+("p"|"P"),'');
        
    end
   
    colors=GraphicTools.brewermap.brewermap(length(sp),'BrBG');
    
    names_converted=arrayfun(@(x)str2num(x),[sp.name]);
    
    if ~any(isnan(names_converted))
        
        [~,k]=sort(names_converted);
        
        sp=sp(k);
        
        
    end
      
    [~,label]=GraphicTools.scale(sp(1).get_freqs);
        
    ax.XLabel.String=['Frequency [',label,'Hz]'];
        
   
    for k=1:length(sp)
        
        line(ax,...
            GraphicTools.scale(sp(k).get_freqs),...
            SparamTools.dbmag(sp(k).get_params(i,j)),...
            'DisplayName',...
            sp(k).name,...
            'Color',colors(k,:),...
            'LineWidth',3);
        
        ax.NextPlot='add';
        
    end
    
    l=legend('Visible',true);
    
end
    
    
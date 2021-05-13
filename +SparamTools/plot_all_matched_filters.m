function plot_all_matched_filters(p)

    sp=SparamTools.get_all_sp_in_folder(p);
    
    for i=1:length(sp)
        
        mod_sp(i)=SparamTools.match_filter(sp(i));
        
    end
    
    close all
    
    fig=figure;
    
    ax=axes;
    
    SparamTools.defaultgraph;
    
    [~,f_label]=GraphicTools.scale(sp(1).Frequencies);
    
    xlabel(sprintf('Frequency, [%s Hz]',f_label));
    
    ylabel('S_{21} [dB]');
    
    colors=inferno(length(mod_sp)+2);
    
    for i=1:length(mod_sp)
        
        line(ax,...
            GraphicTools.scale(sp(i).Frequencies),...
            SparamTools.dbmag(squeeze(mod_sp(i).mod_param(2,1,:))),...
            'DisplayName',...
            string(i),'Color',colors(i,:));
    
            l=legend(ax);
            l.Visible='on';

        pause
        ax.NextPlot='replace';
        
    end
    
end
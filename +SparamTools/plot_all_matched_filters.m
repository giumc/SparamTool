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
    
    t=GraphicTools.add_fig_title();
    
    for i=1:length(mod_sp)
        
        SparamTools.plot_snp(mod_sp(i).mod_param);
        
        t.String=sprintf("%s : %.2f Ohm , %.2f Ohm",...
            strrep(mod_sp(i).name,".s2p",""),...
            mod_sp(i).Impedance_1,...
            mod_sp(i).Impedance_2);
            
        pause
        hold off
       
    end
    
end
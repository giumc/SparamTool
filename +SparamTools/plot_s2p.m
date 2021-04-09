function plot_s2p(a,b,c,d,f,varargin)

    % function plot_s2p(s11,s12,s21,s22,f,varargin)
    % 
    % plots dbplot of s11 
    % and normalized zin from (1+s11)/(1-s11);
    %
    % varargin: pass 'linplot' option to plot log F axis (default)
    %                'logplot' option to plot lin F axis
    %                
    % pass also plot options such as 'Color','k';

    pos_phase=false;
    
    if ~isempty(varargin)
        
        if check_if_string_is_present(varargin,'logplot')

            xaxislabel='Frequency [Hz]';

        else
            
            [~,lab]=GraphicTools.scale(f);
            xaxislabel=strcat('Frequency [',lab,'Hz]');

        end
        
        pos_phase=check_if_string_is_present(varargin,'phaseplot');
        
        if pos_phase
            
            pos_phase=true;
            
            varargin(pos_phase)=[];
            
        end
           
    else
        
        [~,lab]=GraphicTools.scale(f);
            xaxislabel=strcat('Frequency [',lab,'Hz]');
            
    end

    ax1=subplot(2,2,1);
    p1=GraphicTools.plot_choice(ax1,f,20*log10(abs(a)),varargin{:});
    ylim([-30 max([0 max(20*log10(abs(a)))])])
    xlim auto;
    xlabel(xaxislabel);
    ylabel('|S_{11}| [dB]');
    
    
    if pos_phase
        
        yyaxis(ax1,'right');
        ax1.YAxis(2).Color=rgb('Green');
        
        GraphicTools.plot_choice(ax1,f,180/pi*angle(a),'Color',rgb('Green'));
        ylabel('|S_{11}| [\circ]');
        yyaxis(ax1,'left');
        ax1.YAxis(1).Color=p1.Color;
        
    end
    
   
    
    ax2=subplot(2,2,2);
    
    p2=GraphicTools.plot_choice(ax2,f,20*log10(abs(b)),varargin{:});
    ylim auto;
    xlim auto;
    xlabel(xaxislabel);
    ylabel('|S_{12}| [dB]');
    
    if pos_phase
        
        yyaxis(ax2,'right');

        ax2.YAxis(2).Color=rgb('Green');
        GraphicTools.plot_choice(ax2,f,180/pi*angle(a),'Color',rgb('Green'));
        ylabel('|S_{12}| [\circ]');
        
        yyaxis(ax2,'left');
        ax2.YAxis(1).Color=p2.Color;
        
    end

    ax3=subplot(2,2,3);
    p3=GraphicTools.plot_choice(ax3,f,20*log10(abs(c)),varargin{:});
    ylim auto
    xlim auto
    ylabel('|S_{21}| [dB]');
    xlabel(xaxislabel);
    
    if pos_phase
        
        yyaxis(ax3,'right');

        ax3.YAxis(2).Color=rgb('Green');
        
        GraphicTools.plot_choice(ax3,f,180/pi*angle(a),'Color',rgb('Green'));
        ylabel('|S_{21}| [\circ]');
        yyaxis(ax3,'left');
        ax3.YAxis(1).Color=p3.Color;
    end
    
    
    ax4=subplot(2,2,4);
    p4=GraphicTools.plot_choice(ax4,f,20*log10(abs(d)),varargin{:});
    xlabel(xaxislabel);
    ylabel('|S_{22}| [dB]');
    ylim([-30 max([0 max(20*log10(abs(d)))]) ])
    xlim auto
    
    if pos_phase
        
        yyaxis(ax4,'right');

        ax4.YAxis(2).Color=rgb('Green');
        
        GraphicTools.plot_choice(ax4,f,180/pi*angle(a),'Color',rgb('Green'));
        ylabel('|S_{22}| [\circ]');
        yyaxis(ax4,'left');
        ax4.YAxis(1).Color=p4.Color;
    end
    
    
    
end

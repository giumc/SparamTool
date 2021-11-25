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
    
    subplot_db(ax1,...
        f,...
        SparamTools.dbmag(a),...
        '|S_{11}|');
     
    ax2=subplot(2,2,2);
    
    subplot_db(ax2,...
        f,...
        SparamTools.dbmag(b),...
        '|S_{12}|');
    
    ax3=subplot(2,2,3);
    
    subplot_db(ax3,...
    f,...
    SparamTools.dbmag(c),...
    '|S_{21}|');
   
    ax4=subplot(2,2,4);
    subplot_db(ax4,...
    f,...
    SparamTools.dbmag(d),...
    '|S_{22}|');
 
    function p=subplot_db(ax,x,y,label)
        
        p=GraphicTools.plot_choice(ax,x,y,varargin{:});
        
        sc=SparamTools.get_db_scale(y);
        
        ax.YTick=sc;
        
        ax.YLim=[min(sc) max(sc)];     
        
        xlabel(xaxislabel);
        
        ax.YAxis.Label.String=strcat(label,' [dB]');
        
        if pos_phase
        
            yyaxis(ax,'right');
            
            ax.YAxis(2).Color=rgb('Green');
        
            GraphicTools.plot_choice(ax,x,180/pi*angle(y),'Color',rgb('Green'));
            
            ax.YAxis(2).Label.String=strcat(label,' [\circle]');
            
            yyaxis(ax,'left');
            
            ax.YAxis(1).Color=p.Color;
    
        end
        
    end
    
end

function plot_s1p(a,f,varargin)
        
    % function plot_s1p(s11,f,varargin)
    % 
    % plots dbplot of s11 
    % and normalized zin from (1+s11)/(1-s11);
    %
    % varargin: pass 'logplot' option to plot log F axis
    % or else it will be a linear plot
    %
    % pass also plot options such as 'Color','k';
    
    ax1=subplot(2,2,1);
    
    if ~isempty(varargin)

        var=varargin{:};
        
        if check_if_string_is_present(varargin,'logplot')

            xaxislabel='Frequency [Hz]';

        else

            [~,lab]=GraphicTools.scale(f);
            
            xaxislabel=strcat('Frequency [',lab,'Hz]');

        end
        
        pos_phase=check_if_string_is_present(varargin,'phaseplot');
        
        if pos_phase
            
            var(pos_phase)=[];
            
        end
        
        pos_impedance=check_if_string_is_present(varargin,'reference');
        
        if pos_impedance
            
            z0= var{pos_impedance+1};
            
            var([pos_impedance,pos_impedance+1])=[];
            
        else
            
            z0=1;
            
        end
        
    else
            var={};
        
            [~,lab]=GraphicTools.scale(f);
            
            xaxislabel=strcat('Frequency [',lab,'Hz]');
    
    end

    GraphicTools.plot_choice(ax1,f,SparamTools.dbmag(a),var{:});
    ylim([-30 0]);

    
    xlabel(xaxislabel);
    ylabel('|S_{11}| [dB]');

    ax2=subplot(2,2,3);
    GraphicTools.plot_choice(ax2,f,180/pi*angle(a),var{:});
    ylim([-180 180])
    xlabel(xaxislabel);
    ylabel('|S_{11}| [\circ]');

    ax3=subplot(2,2,2);
    GraphicTools.plot_choice(ax3,f,20*log10(z0*abs((1+a)./(1-a))),var{:});
    ylim auto
    
    if ~(z0==1)
        
        ylabel('|Z_{11}| [dB]');
    
    else
    
        ylabel('|Z_{11}|_{norm} [dB]');
        
    end
    xlabel(xaxislabel);

    ax4=subplot(2,2,4);
    GraphicTools.plot_choice(ax4,f,180/pi*angle(z0*(1+a)./(1-a)),var{:});
    xlabel(xaxislabel);
    if ~(z0==1)
        
        ylabel('|Z_{11}| [\circ]');
    
    else
    
        ylabel('|Z_{11}|_{norm} [\circ]');
        
    end

    ylim([-180 180]);
    
end

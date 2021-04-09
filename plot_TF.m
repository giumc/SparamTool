%   ax=plot_tf(tf,freq,varargin)
%   plots dbmag and phase of TF vs freq
%   if 'fig'+figure is pass as an option, 
%   figure is used 
%   
%   if 'logfreq' is passed, 
%   X axes contains log freq (otherwise is linear in GHz)
%   
%   if 'label'+label is passed
%   label is used for ylabel 
%
%   if 'axes'+ax is passed
%   if ax is a 2x1 vector it is used to overlap plots
%
%   if 'guioptions'+opts is passed
%   they are passed to plot(... ,... , opts{:});
%

function ax=plot_TF(TF,f,varargin)
    
    fig=[];
    
    ax1=[];
    
    ax2=[];
    
    xax='lin'; 
    
    lab='';
    
    guiopts=[];

    if ~isempty(varargin)
    
        pos_fig=check_if_string_is_present(varargin,'fig');
        
        if ~(pos_fig==0)
            
            fig=varargin{pos_fig+1};
            
            fig=figure(fig);
            
            if ~isa(fig,'matlab.ui.Figure')
                
                error

            end
            
        else

            fig=gcf;
            
        end
        
        if check_if_string_is_present(varargin,'logfreq')
            
            xax='log';
            
        else
            
            xax='lin';
            
        end
        
        pos_label=check_if_string_is_present(varargin,'label');
        
        if ~(pos_label==0)
            
            lab=varargin{pos_label+1};
            
        else
            
            lab ='';
            
        end
        
        pos_axes=check_if_string_is_present(varargin,'axes');
        
        if ~(pos_axes==0)
           
            ax=varargin{pos_axes+1};
            
            if ~length(ax)==2
                
                error
                
            else
                
                ax1=ax(1);
                ax1.NextPlot='add';
                ax2=ax(2);
                ax2.NextPlot='add';
                
            end
            
        end
        
        pos_guiopts=check_if_string_is_present(varargin,'guioptions');
        
        if ~(pos_guiopts==0)
           
            guiopts={varargin{pos_guiopts+1:end}};
            
        else
            
            guiopts={'Color','k'};
            
        end
        
    end
    
    if isempty(fig)&& ~isempty(ax1) && isempty(ax2)
        
        fig=gcf;
        
        delete(fig.Children);
        
    end
    
%     set(gcf,fig);
    
    if isempty(ax1)||isempty(ax2)
        
        ax1=subplot(2,1,1);
        
        ax2=subplot(2,1,2);
        
    end
    
    if isempty(guiopts)
        
        guiopts={'Color','k'};
        
    end
        
    if strcmp(xax,'lin')
        
        plot(ax1,f/1e9,20*log10(abs(TF)),guiopts{:});
        
        xlabel(ax1,'Frequency [GHz]');
        
    else
        
        if strcmp(xax,'log')
        
            semilogx(ax1,f,20*log10(abs(TF)),guiopts{:});
            
            xlabel(ax1,'Frequency');
            
        end
        
    end
        
%     ylim([-30 0]);
    
    ylabel(ax1,strcat(lab,' [dB]'));

    if strcmp(xax,'lin')
        
        plot(ax2,f/1e9,180/pi*angle(TF),guiopts{:});
        xlabel(ax2,'Frequency [GHz]');
        
    else
        
        if strcmp(xax,'log')

            semilogx(ax2,f,180/pi*angle(TF),guiopts{:});
            xlabel(ax2,'Frequency');

        end

    end  
    
    ylabel(ax2,strcat(lab,' [\circ]'));

    ax=[ax1 ax2];
    
end

function [t,x,varargout]=calculate_impulse_from_TF(freq,TF,varargin)

% [t,x]=calculate_IFFT_from_TF(freq,TF,[exp_pad])
%
% IFFT for single-side spectrum transfer functions
%
% takes measurement in frequency domain :
%   freq is frequency axis array
%   TF is complex-valued transfer function array
%   
% returns impulse response :
%   t is time axis array
%   x is impulse response

    if iscolumn(freq)
        
        freq=freq.';
        
    end
    
    if iscolumn(TF)
        
        TF=TF.';
        
    end
    
    if length(size(TF))>2
        
        TF=squeeze(TF);
        
    end
    
    if ~(length(TF)==length(freq))
        
        error("Unequal lengths in array");
    
    end
    
    Delta_F=mean(diff(freq));
    
    if isempty(freq(freq==0))
        
        LOWfreq=min(freq)-Delta_F:-Delta_F:0;
        
        if ~(LOWfreq(1)==0)
            
            warndlg("Warning: spectrum doesn't contain DC term")
            
        end
        
        LOWpad=TF(1).*ones(1,length(LOWfreq));
        
        TF=[LOWpad TF];
        
    end
    
    TF=TF(end:-1:1);
    
    TF=conj([TF conj(TF(end-1:-1:2))]);
    
%     TF=padarray(TF,[0 20000]);
    
    x=ifft(ifftshift(TF),'symmetric');
    
    N_samples=length(x);
    
    Fs=Delta_F*N_samples;
    
    x=x.*Fs;
    
    t=(0:length(x)-1)/Fs;
    
    if nargout>2
        
        varargout{1}=TF;
        
    end
    
end

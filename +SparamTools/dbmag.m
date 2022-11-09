function y=dbmag(x)

if ~ismatrix(x)
    
    y=20*log10(squeeze(abs(x)));
    
else
    
    y=20*log10(abs(x));

end

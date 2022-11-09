function s=convert_to_sparam(freq,s11,s12,s21,s22)
%function s=convert_to_sparam(freq,s11,s12,s21,s22)

    s=zeros(2,2,length(freq));
    
    for i=1:length(freq)
        
        s(1,1,i)=s11(i);
        s(1,2,i)=s12(i);
        s(2,1,i)=s21(i);
        s(2,2,i)=s22(i);
        
    end
    
    s=sparameters(s,freq);
    
end
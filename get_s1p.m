function [s11,f]=get_s1p(spar)

    f=spar.Frequencies;

    s11=squeeze(spar.Parameters(1,1,:));
    
end

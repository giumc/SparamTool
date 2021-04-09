function [s11,s12,s21,s22,f]=get_s2p(spar)

    f=spar.Frequencies;

    s11=squeeze(spar.Parameters(1,1,:));
    s12=squeeze(spar.Parameters(1,2,:));
    s21=squeeze(spar.Parameters(2,1,:));
    s22=squeeze(spar.Parameters(2,2,:));

end

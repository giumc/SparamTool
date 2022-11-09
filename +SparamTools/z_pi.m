function [za,zb,zc]=z_pi(sparam)

    y=SparamTools.get_snp(yparameters(sparam));
    
    yb=-y.s12;
    ya=y.s11+y.s12;
    yc=y.s22+y.s12;
    
    za=1./ya;
    zb=1./yb;
    zc=1./yc;
    
end
    
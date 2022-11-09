function out_param=get_snp(sparam)

    if (ischar(sparam)||isstring(sparam))

        sparam=sparameters(sparam);
        
    end

    switch sparam.NumPorts

        case 1

            [s11,f]=SparamTools.get_s1p(sparam);
            out_param.s11=s11;
            out_param.f=f;

        case 2

            [s11,s12,s21,s22,f]=SparamTools.get_s2p(sparam);

            out_param.s11=s11;
            out_param.s12=s12;
            out_param.s21=s21;
            out_param.s22=s22;
            out_param.f=f;

        otherwise

            error("get_snp(sparam) not yet implemented for N>2 ports");

    end
    
end
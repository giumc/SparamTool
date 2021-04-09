function s1p=convert_s2p_to_s1p(s2p)
    
    if ~(s2p.NumPorts==2)
        
        error("sparam input data needs to be a s2p");
        
    end
    
    y2p=yparameters(s2p);

    y_series=squeeze(-y2p.Parameters(2,1,:));

    z_series=1./y_series;

    z0=s2p.Impedance;

    s1p=sparameters((z_series-z0)./(z_series+z0),s2p.Frequencies,z0);

end
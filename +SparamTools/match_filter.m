function new_sp=match_filter(sp)

    if ~isa(sp,'sparameters')
        
        error("pass sparameters to this function");
        
    end
    
    if ~sp.NumPorts==2
        
        error("can convert only 2 port sparam");
        
    end
    
    
    s21=sp.Parameters(2,1,:);
    
    s21db=SparamTools.dbmag(s21);
    
    [~,imax]=max(s21db);

    m=s2abcd(sp.Parameters);
    
    m_max=m(:,:,imax);
    
    a=m_max(1,1);
    b=m_max(1,2);
    c=m_max(2,1);
    d=m_max(2,2);
    
    zi1=real(sqrt(a*b)/sqrt(c*d));
    
    zi2=real(sqrt(d*b)/sqrt(c*a));
    
    if isa(sp,'labeledsparam')
        
        
        new_sp=SparamTools.AsymmetricalSparameters(sp.name,sp.Parameters,sp.Frequencies,zi1,zi1);
    
    else
        
        new_sp=SparamTools.AsymmetricalSparameters("none",sp.Parameters,sp.Frequencies,zi1,zi1);
        
    end
    
end
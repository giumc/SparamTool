function ticks=get_db_scale(s)

    s_max=max(s);
    s_min=min(s);
    
    min_scale=floor(s_min/10)*10;
    
    max_scale=ceil(s_max/10)*10;
    
    range=max_scale-min_scale;
    
    
    
    if range>=40
        
        step=10;
        
    else
        
        if range>=20
            
            step=5;
            
        else
            
            step=2.5;
            
        end
        
    end
    
        ticks=min_scale:step:max_scale;
       
end
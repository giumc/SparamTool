function t= transform_to_table(s)

    t=table();
    
    switch s.NumPorts
        
        case 1
            
            t=table(s.Frequencies,...
                    squeeze(s.Parameters(1,1,:)));
            t.Properties.VariableNames=["freq","s11"];
            
        case 2
            

            t=table(s.Frequencies,...
                    squeeze(s.Parameters(1,1,:)),...
                    squeeze(s.Parameters(1,2,:)),...
                    squeeze(s.Parameters(2,1,:)),...
                    squeeze(s.Parameters(2,2,:)));
            t.Properties.VariableNames=[...
            "freq","s11","s12","s21","s22"];
        
    end
    
    
end
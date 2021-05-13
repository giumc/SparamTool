function sp=get_all_sp_in_folder(p)
    
   homefolder=cd;
    
    cd(p)
    
    files=dir(p);
   
    filter= @(x) ~endsWith(x,'.s'+digitsPattern(1)+'p','IgnoreCase',true);
    
    files(arrayfun( @(x) filter(files(x).name) ,1:length(files)))=[];
    
    for i=1:length(files)
        
        sp(i)=sparameters(files(i).name);
        
    end
    
    cd(homefolder)
    
end
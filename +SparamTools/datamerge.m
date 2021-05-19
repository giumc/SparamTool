function datamerge(basepath,varargin)
    
    if ~isempty(varargin)
        
        if isstring(varargin{1}) || ischar(varargin{1})
            
            tag=varargin{1};
            
        else
            
            tag='';
        
        end
        
    else
        
        tag='';
        
    end
    
    subfiles=dir(fullfile(basepath, '**\*.*'));
    subfiles=subfiles(~[subfiles.isdir]);
    
    if ~(strcmp(tag,''))
        
        subfiles=subfiles([contains({subfiles.name},tag)]);
        
    end

    for i=1:length(subfiles)

        modname=strcat(strrep(strrep(subfiles(i).folder,basepath,""),'\','_'),"_",subfiles(i).name);
        copyfile(strcat(subfiles(i).folder,filesep,subfiles(i).name),...
                strcat(basepath,filesep,modname));
        
    end
    
end
function plot_snp(sparam,varargin)
    
    % function plot_snp(sparam,varargin)
    % 
    % plots dbplot of sparams
    % sparams can be matlab sparameter object
    % or path to touchstone snp file
    % 
    %
    % varargin: pass 'logplot' option to plot log F axis
    % or else it will be a linear plot
    %           pass 'phaseplot' to plot phase on right axis
    %
    % pass also plot options such as 'Color','k';
    
    error_msg="plot_snp(sparam) needs sparameters object or path to sparameter";

    SparamTools.defaultgraph;

    if (ischar(sparam)||isstring(sparam))

        sparam=sparameters(sparam);

        if ~isa(sparam,'sparameters')

            error(error_msg);

        end

    end
        
    if ~isa(sparam,'sparameters')
        
        error(error_msg);
        
    end

    sparam_data=SparamTools.get_snp(sparam);

    switch sparam.NumPorts

        case 1

            SparamTools.plot_s1p(sparam_data.s11,sparam_data.f,...
            {varargin{:},'reference',sparam.Impedance});

        case 2

            SparamTools.plot_s2p(sparam_data.s11,sparam_data.s12,...
                sparam_data.s21,sparam_data.s22,sparam_data.f,varargin{:});

        otherwise

            error("plot_snp(sparam) not implemented for N>2 ports");

    end

end

function [za,zb,zc]=z_tee(sparam)
%function [za,zb,zc]=get_tee(sparam)
% za is series impedance port1
% zc is series impedance port2
% zb is shunt impedance 

   z=SparamTools.get_snp(zparameters(sparam));
    
   za=z.s11-z.s12;
   
   zb=z.s12;
   
   zc=z.s22-z.s21;
   
end
%% Setup
clc;clear all; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% system's drivers: ex_WNT, Retinoic Acid
ex_BMP2 =1;

ex_WNT = 0;
RA  = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Perturbations
MESP1 = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Node Sequence in the model
% [ex_WNT; ex_BMP2; BMP2; WNT; DKK1; FGF8; FOXC12; ISL1; MESP1; NKX25; 
% TBX1; TBX5; GATA46; NOTCH; RA; NR2F2; HAND2; IRX4; MYL2; HEY2; MYL7];
 

%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Simulations

steady_FHF_aCM = [0;1;1;0;0;0;0;0;0;1;0;1;1;1;1;1;1;0;0;0;1];
n_FHF_aCM = 0;
steady_FHF_vCM = [0;1;1;0;0;0;0;0;0;1;0;1;1;1;0;0;1;1;1;1;0];
n_FHF_vCM = 0;
steady_SHF_aCM = [1;1;0;1;0;1;1;1;0;1;1;0;1;1;1;1;1;0;0;0;1];
n_SHF_aCM = 0;
steady_SHF_vCM = [1;1;0;1;0;1;1;1;0;1;1;0;1;1;0;0;1;1;1;1;0];
n_SHF_vCM = 0;
steady_null_1  = [0;1;1;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0];
n_null_1 = 0;
steady_null_2  = [0;1;1;0;0;0;0;0;0;0;0;0;0;1;1;1;0;0;0;0;1];
n_null_2 = 0;

%% number of simulations

n_s = 10000;


%% execution of the simulations

for n = 1:1:n_s
   % Randomized Initial condition of the variables (except inputs and drivers)
   BMP2=randi([0 1]); WNT=randi([0 1]); DKK1=randi([0 1]); FGF8=randi([0 1]); FOXC12=randi([0 1]); ISL1=randi([0 1]); NKX25=randi([0 1]); TBX1=randi([0 1]); TBX5=randi([0 1]); GATA46 = randi([0 1]); NR2F2 = randi([0 1]); HAND2 = randi([0 1]); IRX4 = randi([0 1]); MYL2 = randi([0 1]); HEY2 = randi([0 1]); MYL7 = randi([0 1]); NOTCH   = randi([0 1]);

   %initial condition for the 21 variables
   vector = [ex_WNT; ex_BMP2; BMP2; WNT; DKK1; FGF8; FOXC12; ISL1; MESP1; NKX25; TBX1; TBX5; GATA46; NOTCH; RA; NR2F2; HAND2; IRX4; MYL2; HEY2; MYL7];
   while true
       i = randi([1 21]);
       vector(i)=next_state_MESP1_knockout(vector,i);
       if vector == steady_FHF_aCM
           n_FHF_aCM = n_FHF_aCM + 1;
           break;
       end
       if vector == steady_FHF_vCM
           n_FHF_vCM = n_FHF_vCM +1;
           break;
       end
       if vector == steady_SHF_aCM
           n_SHF_aCM = n_SHF_aCM + 1;
           break;
       end
       if vector == steady_SHF_vCM
           n_SHF_vCM = n_SHF_vCM + 1;
           break;
       end
       if vector == steady_null_1
           n_null_1 = n_null_1 +1;
           break;
       end
       if vector == steady_null_2
           n_null_2 = n_null_2 +1;
           break;
       end

   end

end
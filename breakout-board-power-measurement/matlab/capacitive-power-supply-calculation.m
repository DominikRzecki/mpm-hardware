clear all;
close all;

u_eff = 230;
f = 50; %Grid freq
i = 0.6 %Required current. ~650mA to power everything if using only the capacitive psu

x = u_eff/i     %Calculating required reactance.

C = 1/(2*pi*f*x)        %Calculating cap
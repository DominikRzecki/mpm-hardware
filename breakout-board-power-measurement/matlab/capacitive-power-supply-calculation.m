clear all;
close all;

u_eff = 230;
f = 50; %Grid freq
p_req = 2.31
ux = 10
i = p_req/ux

x = u_eff/i     %Calculating required reactance.

C = 1/(2*pi*f*x)        %Calculating cap
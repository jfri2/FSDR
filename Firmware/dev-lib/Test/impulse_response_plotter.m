% Plots the impulse response of a filter
% Written by Daniel Leon-Salas - ECET 339 Digital Signal Processing
% Purdue Polytechnic

[n1, n2, n3] = size(h.Data);

h_vector = reshape(h.Data, 1, n1*n2*n3);
n = [0:1:n1*n2*n3-1];

figure; 
stem(n, h_vector);
grid on;
hx = xlabel('n');
hy = ylabel('h[n]');
title('Impulse Response');
set(hx, 'FontSize', 14);
set(hy, 'FontSize', 14);
axis([-1 length(n) 1.1*min(h_vector) 1.1*max(h_vector)]);
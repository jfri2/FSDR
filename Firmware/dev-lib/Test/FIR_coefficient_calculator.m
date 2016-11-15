% Bandpass filter design for Lab 3
% John Fritz
% ECET 439 - Advanced Digital Signal Processing
% Purdue University
clear all;
fs = 8000; % sampling frequency
f1 = 800; % lower stopband cutoff freq.
f2 = 1000; % lower passband cutoff freq.
f3 = 2000; % upper passband cutoff freq.
f4 = 2200; % upper stopband cutoff freq.
f = [0 f1/(fs/2) f2/(fs/2) f3/(fs/2) f4/(fs/2) 1]; % edge frequencies
mags = [0.0 0.0 1.0 1.0 0.0 0.0]; % ideal magnitudes
p_ripple_dB = 1; % passband ripple in dB
s_atten_dB = 40; % stopband attenuation in dB
p_s_ratio = (10^(p_ripple_dB/20)-1) / (10^(-s_atten_dB/20));
Wp = 1; % passband weight factor
Ws = p_s_ratio; % stopband weight factor
W = [Ws Wp Ws];

N = 60; % number of coefficients

B = firpm(N-1, f, mags, W); % execute the Remez algorithm
A = [1];
freqz(B, A, 1000, fs); % plot the frequency response
fid = fopen('W:\ECET439\Labs\Lab03\lab3_coefficients.h', 'wt');
fprintf(fid, '#define B_LEN %d\n\n', N);
fprintf(fid, 'DATA b[B_LEN] = {');
n = (2^8)-1; % Qm.n format
for i=1:N-1
 fprintf(fid, '%d, ', round(B(i)*n));
 if(mod(i,10)==0)
 fprintf(fid, ' \n');
 end
end
fprintf(fid, '%d};\n', round(B(N)*n));
fclose(fid);
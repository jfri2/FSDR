% Estimates and plots the frequency response of a filter
% Written by Daniel Leon-Salas - ECET 339 Digital Signal Processing
% Purdue Polytechnic

fs = 8000;
Ts = 1/fs;

[nx1,nx2,nx3] = size(x.Data);
[ny1,ny2,ny3] = size(y.Data);

x_vector = reshape(x.Data,nx1*nx2*nx3, 1);
y_vector = reshape(y.Data,ny1*ny2*ny3, 1);

if length(x_vector) < length(y_vector)
   y_vector = y_vector(1: length(x_vector)); 
elseif length(y_vector) < length(x_vector)   
   x_vector = x_vector(1: length(y_vector)); 
end

%--------------------------------------------------------------------------
% Transfer function estimation
%--------------------------------------------------------------------------
[Txy,f] = tfestimate(x_vector, y_vector, [], [], [], fs);

%--------------------------------------------------------------------------
% Plot transfer function
%--------------------------------------------------------------------------
figure; 
subplot(2,1,1)
plot(f, (abs(Txy)));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(2,1,2)
plot(f,(angle(Txy)*180/pi));
xlabel('Frequency (Hz)');
ylabel('Phase (deg)');
grid on;

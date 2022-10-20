%params
Fs = 2^10;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 2;             % Length of signal
t = 0:T:L-T;          % Time vector

S = 0.9*sin(2*pi*15*t);
  

S2 = sin(2*pi*50*t);




S3 = S + S2;

hold on
% plot(t(1:200), S(1:200));
% plot(t(1:200), S2(1:200));
% plot(t(1:200), S3(1:200));
% legend('S1','S2','S3');

% X = S3 + 2*randn(size(t));
% plot(t(1:200), S3(1:200));
% plot(t(1:200), X(1:200));
% 
% title('Signal Corrupted with Zero-Mean Random Noise');
% xlabel('t (milliseconds)');
% ylabel('X(t)');

% Calculate the Power spectrum (power per freq)
% To do this first compute the Fast Fourier Transform FFT of the noisy
% signal
n = length(t);
Y = fft(X, n); % Compute the fast Fourier transform

%Compute the two-sided spectrum P2. Then compute the
%single-sided spectrum P1 based on P2 and the even-valued signal length L.
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1. 
%The amplitudes are not exactly at 0.7 and 1, as expected, because of the added noise. 
%On average, longer signals produce better frequency approximations.

f = Fs*(0:(L/2))/L;
plot(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")




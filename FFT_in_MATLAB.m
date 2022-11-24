close all;
clc;

Fs = 128;               % Sampling frequency for the signal                  
T = 1/Fs;               % Sampling period for the signal      
L = 128;                % Length of the signal
t = (0:L-1)*T;          % Time vector 

%X = 3*sin(2*pi*4*t) + sin(2*pi*7*t);      %Input_1 Signal to be verified
X = 8*sin(2*pi*3*t) + 3*sin(2*pi*9*t);   %Input_2 Signal to be verified
Y = fft(X);                               %Verifying the Python Outputs using fft command

P2 = abs(Y/L);                 %Normalising the obtained value
P1 = P2(1:L/2+1);              
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

subplot(1,2,1)                   %Plotting Input Signal
plot(1000*t(1:100),X(1:100))
title('Imput Signal')
xlabel('t (milliseconds)')
ylabel('X(t)')

subplot(1,2,2)                   %Plotting Output Signal
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')  
xlabel('f (Hz)')
ylabel('|P1(f)|')

%%%%Task 1

%filtering 1

% n= -3:5;
% x = [0 0 -1 2 4 6 4 0 0];
% % We will learn about the filter function later
% y = filter(1/3*[1 1 1],1,x);
% stem(n,y,'filled')

% n = 0:8;
% x = [2 4 6 4 2 0 0 0 0];
% h = [3 -1 2 1];
% y = filter(h,1,x);
% 
% subplot(2,2,1);
% stem(n,x,'filled');
% 
% subplot(2,2,2);
% stem(h,'filled');
% 
% subplot(2,2,3);
% stem(y,'filled');

% additional example
% n = 0:7;
% x = [0 1 2 3 0 0 0 0];
% h = [1 1 2 3];
% y = filter(h,1,x);
% y


%filtering 2

% n = -5:50;
% x = [zeros(1,5), rand(1,41)-1/2, zeros(1,10)];
% y3 = filter(ones(1,3)/3,1,x);
% y7 = filter(ones(1,7)/7,1,x);
% 
% subplot(2,2,1);
% stem(n,x,'filled');
% 
% subplot(2,2,2);
% stem(y3,'filled');
% 
% subplot(2,2,3);
% stem(y7,'filled');
% you can use subplot and stem to display the output

%%%%Task 2 convolution
% x = [2 1 2 1];
% y = [1 2 3];
% clin = conv(x,y);
% xpad = [ x zeros(1,6-length(x))];
% ypad = [ y zeros(1,6-length(y))];
% ccirc = ifft(fft(xpad.*fft(ypad)));
% subplot(2,2,1);
% stem(clin, 'filled');
% ylim([0 11]);
% title('Convolution of x and y');
% subplot(2,2,2);
% stem(ccirc, 'filled');
% ylim([0 11]);
% title('Convolution of xpad and ypad');
% %Pad the vectors to length 12 and obtain the convolution using the inverse 
% %DFT of the product of the DFTs. Retain only the first 4+3-1 elements to 
% %produce an equivalent result.
% N = length(x) + length(y) -1;
% xpad = [ x zeros(1,12-length(x))];
% ypad = [ y zeros(1,12-length(y))];
% ccirc = ifft(fft(xpad.*fft(ypad)));
% ccirc2 = ccirc(1:N);
% % use subplot and stem to display the output
% subplot(2,2,3);
% stem(ccirc2, 'filled');

%%%%Task 3 autocorrelation

% a = 0.95;
% N = 28;
% n = 0:N-1;
% lags = -(N-1):(N-1);
% x = a.^n;
% c = xcorr(x);
% %Analytically the c is estimated as 
% Fs = 10;
% nn = -(N-1):1/Fs:(N-1);
% dd = (1-a.^(2*(N-abs(nn))))/(1-a^2).*a.^abs(nn);
% stem(lags,c);
% hold on
% plot(nn,dd)
% xlabel('Lag');
% legend('xcorr', 'Analytic');
% hold off

%%%Task 4 Correlation two exponential sequences

N = 28;
n = 0:N-1;
a = 0.84;
b = 0.92;
xa = a.^n;
xb = b.^n;

r = xcorr(xa, xb);
stem(-(N-1):(N-1), r)
%Analytically the r is estimated as 
Fs = 10;
nn = -(N-1):1/Fs:(N-1);
cn = (1-(a*b).^(2*(N-abs(nn)))/(1-a*b)).* (a.^nn.*(nn>0) + (nn==0) + b.^-(nn).*(nn<0));
hold on
plot(nn,cn)
xlabel('Lag')
legend('xcorr',  'Analytic')

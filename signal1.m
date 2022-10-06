%5, 8, 11, 100, 1000 Hz
%sample duration 1 second
%sin(2*pi*10*t)

hz = [5, 8, 11, 100, 1000];
for i = 1 : length(hz)
    fs = hz(i);
    dt = 1/fs;

    t=0:dt:1;
    x = sin((2*pi*10*t));
    plot(t, x), hold on
end
grid
legend('5', '8', '11', '100', '1000')
xlabel('Time is seconds')
ylabel('Amplitude')
title('sin(2*pi*10*t)')
ylim([-1.4, 1.4])

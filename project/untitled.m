amp=1;
fs=20500; % sampling frequency
duration=2;
freq=1000;
values=0:1/fs:duration;
a=amp*sin(2*pi*freq*values);    

[y, Fs] = audioread(a)
player = audioplayer(y, Fs);
play(player);
pause(0.05);
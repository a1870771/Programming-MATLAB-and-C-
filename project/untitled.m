%sampRate= 44100;
%read = audioread("test.mp3");
%p = audioplayer(read,sampRate);
%num = [1, zeros(1,4800),0.9];
%den = [1];
%x = filter(num,den,read);
%p1=audioplayer(x,sampRate)

[y, Fs] = audioread("test.mp3", [441000, 600000]);
highpass_filter = highpass(y,150,Fs);
sound(highpass_filter, Fs);


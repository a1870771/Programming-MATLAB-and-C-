clear;
clc;

%%%%%%%%%%%%%%%%%%%%   Create ui components   %%%%%%%%%%%%%%%%%%%%
fig = uifigure('position', [300 300 1280 720], 'WindowKeyPressFcn', @keyboard);
bg = uihtml(fig, 'HTMLSource','background.html', 'position',[0 0 1280 720]);

%%%%%%%%%%%%%%%%%%%%    Sample Triggers   %%%%%%%%%%%%%%%%%%%%
function kick()
    [y, Fs] = audioread('kick.wav');
    player = audioplayer(y, Fs);
    play(player);
    pause(0.05);
end

function hh()
    [y, Fs] = audioread('hh.wav');
    player = audioplayer(y, Fs);
    play(player);
    pause(0.05);
end

function snare()
    [y, Fs] = audioread('snare.wav');
    player = audioplayer(y, Fs);
    play(player);
    pause(0.05);
end

%%%%%%%%%%%%%%%%%%%%    Keyboard Listeners    %%%%%%%%%%%%%%%%%%%%
function keyboard(fig,event)
    switch event.Character
        case 'a'
            kick();
            seq();
        case 't'
            hh();
        case 'd'
             snare();
        case 'f'
            snare();
    end
end

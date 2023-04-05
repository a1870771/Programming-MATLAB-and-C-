clear;
clc;

%%%%%%%%%%%%%%%%%%%%   Create ui components   %%%%%%%%%%%%%%%%%%%%
fig = uifigure('position', [300 300 1280 720], 'WindowKeyPressFcn', @keyboard, 'Resize','off');
bg = uihtml(fig, 'HTMLSource','background.html','position',[0 0 1280 720]);
bg.HTMLEventReceivedFcn = @autoFocusFigure;
%%%%%%%%%%%%%%%%%%%%    Sample Triggers   %%%%%%%%%%%%%%%%%%%%
function kick()
    [w, Fs] = audioread('kick.wav');
    player = audioplayer(w, Fs);
    play(player);
    pause(0.5);
end

function hh()
    [x, Fs] = audioread('hh.wav');
    player = audioplayer(x, Fs);
    play(player);
    pause(0.5);
end

function snare()
    [y, Fs] = audioread('snare.wav');
    player = audioplayer(y, Fs);
    play(player);
    pause(0.5);
end

function cowbell()
    [z, Fs] = audioread('cowbell.wav');
    player = audioplayer(z, Fs);
    play(player);
    pause(0.5);
end

%%%%%%%%%%%%%%%%%%%%    Keyboard Listeners    %%%%%%%%%%%%%%%%%%%%
function keyboard(fig,event)
    switch event.Character
        case 'a'
            kick();
        case 't'
            hh();
        case 'd'
             snare();
        case 'f'
            snare();
        case 'y'
            cowbell();
    end
end

function autoFocusFigure(src,event)
name = event.HTMLEventName;
if strcmp(name,'bgClicked')
    focus(fig);
end
end

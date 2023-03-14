clear;
clc;
%%%%%%%%%%%%%%%%%%%%   Create ui components   %%%%%%%%%%%%%%%%%%%%
fig = uifigure('KeyPressFcn', @keyboard);

playBtn = uibutton(fig, ...
    'Text', 'Play', ...
    'Position', [50,105, 70, 35], ...
    'BackgroundColor', 'w', ...
    'ButtonPushedFcn', @play);
stopBtn = uibutton(fig, ...
    'Text', 'Stop', ...
    'Position', [50, 70, 70, 35], ...
    'BackgroundColor', 'w', ...
    'ButtonPushedFcn', @stop);

%mode = uibuttongroup(fig, ... 
%    'Position', [10 330 90 79], ...
%    'SelectionChangedFcn',@modeSelection);


%keyBtn = uitogglebutton(mode, ...
%    'Text', 'Keyboard', ...
%    'position', [10 50 70 22]);
%keyBtn.Value=1;
%mouseBtn = uitogglebutton(mode, ...
%    'Text', 'Mouse', ...
%    'Position',[10 28 70 22]);
%mouseBtn.Value=0;
%seqBtn = uitogglebutton(mode, ...
%    'Text', 'Sequencer', ...
%    'Position',[10 6 70 22]);
%seqBtn.Value=0;

kickBtn = uibutton(fig, 'push', ...
    'Text', 'Kick (A)', ...
    'Position', [120, 70, 70, 70], ...
    'Backgroundcolor', 'w', ...
    'ButtonPushedFcn', @kickTrig);
kickBtn.Enable='on';
snareBtn = uibutton(fig, 'push', ...
    'Text','Snare (D)', ...
    'Position', [190, 70, 70, 70], ...
    'Backgroundcolor', 'w', ...
    'ButtonPushedFcn', @snareTrig);
snareBtn.Enable='on';
hhBtn = uibutton(fig, 'push', ...
    'Text', 'Hihat (T)', ...
    'Position', [260, 70, 70, 70], ...
    'Backgroundcolor', 'w', ...
    'ButtonPushedFcn', @hhTrig);
hhBtn.Enable='on';



function play(~,~)
seqGrid = zeros(16,3);
    for i = 1:16
            if seqGrid(i,1) == 1
                kick();
            end
            if seqGrid(i,2) == 1
                snare();
            end
            if seqGrid(i,3) == 1
                hh();
            end
            pause(1);
            disp("Playing");
    end
end
%%%%%%%%%%%%%%%%%%%%    Sample Triggers   %%%%%%%%%%%%%%%%%%%%
function kick()
    [y, Fs] = audioread('kick.wav');
    player = audioplayer(y, Fs);
    play(player);
    pause(0.5);
end

function hh()
    [y, Fs] = audioread('hh.wav');
    player = audioplayer(y, Fs);
    play(player);
    pause(0.5);
end

function snare()
    [y, Fs] = audioread('snare.wav');
    player = audioplayer(y, Fs);
    play(player);
    pause(0.5);
end

%%%%%%%%%%%%%%%%%%%%    Button Callbacks    %%%%%%%%%%%%%%%%%%%%
function kickTrig(~,~)
    kick();
end

function snareTrig(~,~)
    snare();
end
function hhTrig(~,~)
    hh();
end


%%%%%%%%%%%%%%%%%%%%    Keyboard Listeners    %%%%%%%%%%%%%%%%%%%%
function keyboard(~,event)
    switch event.Character
        case 'a'
            kick();
        case 't'
            hh();
        case 'd'
             snare();
        case 'f'
            snare();
    end
end


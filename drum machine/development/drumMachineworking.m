clear;
clc;

%%%%%%%%%%%%%%%%%%%%   Create ui components   %%%%%%%%%%%%%%%%%%%%
fig = uifigure('position', [300 300 1280 720], 'WindowKeyPressFcn', @keyboard);
bg = uihtml(fig, 'HTMLSource','background.html', 'position',[0 0 1280 720]);

kickBtn = uibutton(fig, 'push', ...
    'Text', 'Kick (A)', ...
    'Position', [120, 225, 70, 70], ...
    'Backgroundcolor', 'w', ...
    'ButtonPushedFcn', @kickTrig);
snareBtn = uibutton(fig, 'push', ...
    'Text','Snare (D)', ...
    'Position', [220, 225, 70, 70], ...
    'Backgroundcolor', 'w', ...
    'ButtonPushedFcn', @snareTrig);
hhBtn = uibutton(fig, 'push', ...
    'Text', 'Hihat (T)', ...
    'Position', [319, 225, 70, 70], ...
    'Backgroundcolor', 'w', ...
    'ButtonPushedFcn', @hhTrig);

axes1 = axes(fig, "Position",[10 10 100 100])
axes2 = axes(fig, "Position",[20 20 100 100])
masterSlider = knobslider(axes1,0.5,'callback', @masterVol)

for y = 1:3
    for x = 1:16
    seqToggle(y,x) = uicontrol(fig, ...
        'String', ' ', ...
        'Position',[-10+(30*x) 400-(30*y) 27 27], ...
        'BackgroundColor', 'w', ...
        'Callback', ['seqToggleClb(y,x);' ]);
    end
end

%%%%%%%%%%%%%%%%%%%%     Sequencer     %%%%%%%%%%%%%%%%%%%%
function seq()
    seqGrid = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0;
               0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0;
               0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1];
    for i = 1:16
        if seqGrid(1,i) == 1
            kickTrig();
        end
        if seqGrid(2,i) == 1
            snareTrig();
        end
        if seqGrid(3,i) == 1
            hhTrig();
        end
        pause(0.125);
        disp(i);
    end
end

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

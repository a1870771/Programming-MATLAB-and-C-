clc; clear;

%%%%%%%%%%%%%%%%%%%%    CREATE UI COMPONENTS    %%%%%%%%%%%%%%%%%%%%
fig = figure('name', 'Tetris', ...      %game window
    'menubar','none', ...
    'position',[150 150 600 700], ...
    'numbertitle', 'off', ...
    'KeyPressFcn', @keyboard);
ax1 = axes(fig, ...                     %game board
    'units', 'pix', ...
    'Position',[30 40 360 630], ...
    'Box','on', ...
    'xtick',[],'ytick',[], ...
    'xlim',[-1 11], ...
    'YLim',[-1 20]);
global x
global y
global xPos
global yPos
            xPos= 3;
            yPos= 19;
x = [0 0.1 0;0.1 0.9 0.1;0.1 0.9 0.9;0.9 0.1 0.9;1 0.1 1;0 0.1 1;0 0.1 0];
y = [0 0.1 0;0.1 0.1 0.1;0.9 0.9 0.1;0.9 0.9 0.9;1 0.1 1;1 0.1 0;0 0.1 0]; 
grey = repmat([.9 .65 .4],[1,1,3]);

for i = [-1 10]         %render lhs and rhs borders
    col = x + i;
    for j = -1:19
        row = y + j;
        patch(col,row,grey)
    end
end

for i = 0:9            %renders floor
    patch(x+i,y-1,grey)
end


function getPos()
    currPos=[xPos yPos];
end

function render()
    getPos()
    patch(x+currPos(1), y+currpos(2), grey)
end


function keyboard(~,event)
    switch event.Key
        case 'rightarrow'

            render()
        case 'leftarrow'

    end
end


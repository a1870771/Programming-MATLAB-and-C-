clc; clear all;

global fig x y grey xp yp c currentPiece dim t r;


%%%%%%%%%%%%%%%%%%%%    CREATE GAME PIECES      %%%%%%%%%%%%%%%%%%%%
tetronimos{1} = [0 0 1 0; 
                 0 0 1 0;
                 0 0 1 0;
                 0 0 1 0];
tetronimos{2} = [0 0 1 0; 
                 0 1 1 0;
                 0 1 0 0;
                 0 0 0 0];
tetronimos{3} = [0 1 0 0; 
                 0 1 1 0;
                 0 0 1 0;
                 0 0 0 0];
tetronimos{4} = [0 0 0 0; 
                 0 1 1 0;
                 0 1 1 0;
                 0 0 0 0];
tetronimos{5} = [0 0 1 0; 
                 0 1 1 0;
                 0 0 1 0;
                 0 0 0 0];
tetronimos{6} = [0 0 0 0; 
                 0 1 1 0;
                 0 0 1 0;
                 0 0 1 0];
tetronimos{7} = [0 0 0 0; 
                 0 1 1 0;
                 0 1 0 0;
                 0 1 0 0];

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

%tile template geometry
x = [0 0.1 0;0.1 0.9 0.1;0.1 0.9 0.9;0.9 0.1 0.9;1 0.1 1;0 0.1 1;0 0.1 0];
y = [0 0.1 0;0.1 0.1 0.1;0.9 0.9 0.1;0.9 0.9 0.9;1 0.1 1;1 0.1 0;0 0.1 0]; 
grey = repmat([.9 .65 .4],[1,1,3]);

for i = [-1 10]                         %borders   
    col = x + i;
    for j = -1:19
        row = y + j;
        patch(col,row,grey)
    end
end
for i = 0:9            
    patch(x+i,y-1,grey)
end


%%%%%%%%%%%%%%%%%%%%    INITIAL CONDITIONS      %%%%%%%%%%%%%%%%%%%%
xp = 3;
yp = 20;
c = [];
r = 0;

currentPiece = tetronimos{ceil(7*rand)};

dim = size(currentPiece);

for i = 1:dim(1)
    for j = 1:dim(2)
        if currentPiece(i,j) == 1
            c = [c patch(x+xp+i, y+yp-j, grey)];
        end
    end
end

%%%%%%%%%%%%%%%%%%%%      GAMEPLAY      %%%%%%%%%%%%%%%%%%%%

t = timer('Period', 1, ...
          'TasksToExecute', 3, ...
          'ExecutionMode','fixedRate', ...
          'TimerFcn', @fallDown);

start(t);
                
function fallDown(src,event)
    global yp;
    yp = yp - 1;
    render();
end
function render()                   %creates tetronimo each time its moved or rotated
    global xp yp x y grey c dim currentPiece;
    delete(c);
    for i = 1:dim(1)
        for j = 1:dim(2)
            if currentPiece(i,j) == 1
                c = [c patch(x+dim(2)+xp-i, y-dim(1)+yp+j, grey)];
            end
        end
    end
end

function keyboard(src, event)       %keyboard listeners for horizontal movement and rotation
    global xp r currentPiece;
    switch event.Key
        case 'rightarrow'
            xp=xp+1;
            render();
        case 'leftarrow'
            xp=xp-1;
            render()
        case 'c'
            r = r + 1;
            currentPiece = rot90(currentPiece);
            render();
        case 'd' 
            r = r - 1;
            currentPiece = rot90(currentPiece, -1);
            render();
    end
end


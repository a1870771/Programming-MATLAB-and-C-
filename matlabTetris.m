clc; clear all;

global fig x y grey xp yp c currentPiece t map;


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
    'xlim',[1 13], ...
    'YLim',[1 22]);
map = zeros(21,12); %matrix representation of game state

%%%%%%%%%%%%%%%%%%%% TILE GEOMETRICAL TEMPLATE %%%%%%%%%%%%%%%%%%%%
x = [0 0.1 0;0.1 0.9 0.1;0.1 0.9 0.9;0.9 0.1 0.9;1 0.1 1;0 0.1 1;0 0.1 0];
y = [0 0.1 0;0.1 0.1 0.1;0.9 0.9 0.1;0.9 0.9 0.9;1 0.1 1;1 0.1 0;0 0.1 0]; 
grey = repmat([.9 .65 .4],[1,1,3]);

%%%%%%%%%%%%%%%%%%%%        BORDERS         %%%%%%%%%%%%%%%%%%%%
for i = [1 12]  
    col = x + i;
    for j = 1:21
        row = y + j;
        patch(col,row,grey);
        map(j,i)=1;
    end
end
for i = 2:11            
    patch(x+i,y+1,grey);
    map(i,1)=1;
end

disp(map);
%%%%%%%%%%%%%%%%%%%%    INITIAL CONDITIONS      %%%%%%%%%%%%%%%%%%%%
xp = 5;
yp = 22;
c = [];

currentPiece = tetronimos{ceil(7*rand)};

for i = 1:4
    for j = 1:4
        if currentPiece(i,j) == 1
            c = [c patch(x+xp+i, y+yp-j, grey)];
            map(yp+j, xp+i) = 1;
            disp(map);
        end
    end
end

%%%%%%%%%%%%%%%%%%%%      GAMEPLAY      %%%%%%%%%%%%%%%%%%%%

t = timer('Period', 1, ...
          'TasksToExecute', 100, ...
          'ExecutionMode','fixedRate', ...
          'TimerFcn', @fallDown);

start(t);
                
function fallDown(src,event)
    global yp t;
    if yp > 4
        yp = yp - 1;
        render();
    else
        stop(t);
    end
end

function render()                   %creates tetronimo each time its moved or rotated
    global xp yp x y grey c currentPiece map;
    delete(c);
    for i = 1:4
        for j = 1:4
            if currentPiece(i,j) == 1
                c = [c patch(x+4+xp-i, y-4+yp+j, grey)];
            end
        end
    end
end

function keyboard(src, event)       %keyboard listeners for horizontal movement and rotation
    global xp yp currentPiece;
    switch event.Key
        case 'rightarrow'
            xp=xp+1;
            render();
        case 'leftarrow'
            xp=xp-1;
            render()
        case 'uparrow'
            currentPiece = rot90(currentPiece);
            render();
        case 'downarrow' 
            yp = yp-1;
            render();
    end
end


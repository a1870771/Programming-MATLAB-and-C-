global posX posY currentPiece playingField gameOver

%%%%%%%%%%%%%%%%%%%%    INITIALISE ASSETS      %%%%%%%%%%%%%%%%%%%%

tetronimos{1} = [0 0 1 0; 0 0 1 0; 0 0 1 0; 0 0 1 0];
tetronimos{2} = [0 0 1 0; 0 1 1 0; 0 1 0 0; 0 0 0 0];
tetronimos{3} = [0 1 0 0; 0 1 1 0; 0 0 1 0; 0 0 0 0];
tetronimos{4} = [0 0 0 0; 0 1 1 0; 0 1 1 0; 0 0 0 0];
tetronimos{5} = [0 0 1 0; 0 1 1 0; 0 0 1 0; 0 0 0 0];
tetronimos{6} = [0 0 0 0; 0 1 1 0; 0 0 1 0; 0 0 1 0];
tetronimos{7} = [0 0 0 0; 0 1 1 0; 0 1 0 0; 0 1 0 0];

fieldHeight = 21;
fieldWidth = 12;

playingField = zeros(fieldHeight, fieldWidth);


%%%%%%%%%%%%%%%%%%%% TILE GEOMETRICAL TEMPLATE %%%%%%%%%%%%%%%%%%%%
x = [0 0.1 0;0.1 0.9 0.1;0.1 0.9 0.9;0.9 0.1 0.9;1 0.1 1;0 0.1 1;0 0.1 0];
y = [0 0.1 0;0.1 0.1 0.1;0.9 0.9 0.1;0.9 0.9 0.9;1 0.1 1;1 0.1 0;0 0.1 0]; 
grey = repmat([.9 .65 .4],[1,1,3]);

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
    
for i = 1:fieldWidth                  %create borders
    for j = 1:fieldHeight
        if i == 1 || i == fieldWidth || j == fieldHeight
            playingField(j,i) = 9;
        end
    end
end
disp(playingField);

gameOver = false;

% Init conditions
posX = 5;
posY = 1;
currentPiece = tetronimos{ceil(7*rand)};
playingField = render(playingField, currentPiece, posY, posX);
c=[];

while ~gameOver
    pause(0.5);
    % timing
    % logic
    % input (ui callback)
    % render
    delete(c);
    for i = 1:fieldWidth
        for j = fieldHeight:-1:1
            if playingField(j,i) ~= 0
                c = [c patch(x+i,y+fieldHeight-(j-1), grey)];
            end
        end
    end
end

function playingField = render(playingField, currentPiece, posY, posX)
    for xp = 1:4
        for yp = 1:4
            if currentPiece(yp, xp) ~= 0
                playingField(posY + yp, posX + xp) = 1
            end
        end
    end
end

function doItFit = collisionDetect(playingField, currentPiece, posX, posY)
for px = 1:4
    for py = 1:4
        pieceIndex = currentPiece(py, px);
        fieldIndex = playingField(posY + py - 1, posX + px);
        if pieceIndex ~= 0 && fieldIndex ~= 0
            doItFit = false;
            return;
        end
    end
end
doItFit = true;
end

function keyboard(~, event)
    global posX posY currentPiece playingField gameOver;
    switch event.Key
        case 'rightarrow'
            if collisionDetect(playingField, currentPiece,posX - 1,posY) == true
                for xp = 1:4
                    for yp = 1:4
                        if currentPiece(yp, xp) ~= 0
                            playingField(posY + yp, posX + xp) = 0;
                        end
                    end
                end
                posX=posX+1;
                playingField = render(playingField, currentPiece,posY,posX);
            end
        case 'leftarrow'
            if collisionDetect(playingField, currentPiece, posX - 1,posY) == true
                for xp = 1:4
                    for yp = 1:4
                        if currentPiece(yp, xp) ~= 0
                            playingField(posY + yp, posX + xp) = 0;
                        end
                    end
                end
                posX=posX-1;
                playingField = render(playingField, currentPiece,posY,posX);
            end
        case 'uparrow'
            if collisionDetect(rot90(currentPiece),posX,posY) == true
                currentPiece = rot90(currentPiece);
                playingField = render(playingField, currentPiece,posY,posX);
            end
        case 'q'
            gameOver = true;
    end
end
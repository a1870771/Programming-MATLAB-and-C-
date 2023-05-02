% contained in this file is the first successful attempt at integrating the
% gui and game engine. the only differences between this script and the
% final product are aesthetic - the colours change in the final version,
% and a sidebar with instructions is added.

clc;

%%%%%%%%%%%%%%%%%%%%    INITIALISE ASSETS   %%%%%%%%%%%%%%%%%%%%
global currentGrid c
currentGrid = zeros(40,40);
nextGrid = zeros(40,40);
c = [];

%%%%%%%%%%%%%%%%%%%%    INITIALISE UI COMPONENTS    %%%%%%%%%%%%%%%%%%%%
fig = figure('name', 'The Game of Life', ...  
    'menubar','none', ...
    'position',[250 150 800 800], ...
    'numbertitle', 'off', ...
    'KeyPressFcn',@play);
ax = axes(fig, ...
    'units', 'pix', ...
    'Position',[0 0 800 800], ...
    'xlim',[0 40], 'YLim',[0 40], ...
    'XTick',[1:40], 'YTick', [1:40], ...
    'XGrid','on', 'YGrid','on', ...
    'TickLength', [0,0.1], ...
    'NextPLot','add', ...
    'ButtonDownFcn',@setInit);

%%%%%%%%%%%%%%%%%%%%     INITIAL CONDITIONS      %%%%%%%%%%%%%%%%%%%%
function setInit(ax, ~)
global currentGrid c
P = get(ax, 'CurrentPoint');  
X = P(1,1) - mod(P(1,1), 1);
Y = P(1,2) - mod(P(1,2),1);
currentGrid(Y,X) = 1;
c = [c patch([X,X+1,X+1,X], ...
      [Y,Y,Y+1,Y+1], ...
      'black');];
end

%%%%%%%%%%%%%%%%%%%%         GAME LOOP       %%%%%%%%%%%%%%%%%%%%
function play(~,event)
global gameOver
gameOver = false;
switch event.Key
    case 'q'
        gameOver = true;
end
global currentGrid;
while ~gameOver
    pause(1);
    %compute next grid
    nextGrid = getNextGrid(currentGrid);
    currentGrid = nextGrid;
    render(currentGrid);
end
end

%%%%%%%%%%%%%%%%%%%%        GAME ENGINE         %%%%%%%%%%%%%%%%%%%%
function render(currentGrid)
global c;
delete(c);
c = [];
for i = 1:40
    for j = 1:40
        if currentGrid(i,j) == 1
            c = [c patch([j,j+1,j+1,j],[i,i,i+1,i+1],'black')];
        end
    end
end
end

function nextGrid = getNextGrid(currentGrid)
nextGrid = zeros(40,40);
for i = 1:40
    for j = 1:40
        count = getLiveNeighbours(currentGrid, i, j);

        if currentGrid(i,j) == 1
            if count > 3 || count < 2
                nextGrid(i,j) = 0; % over/under population
            else
                nextGrid(i,j) = 1; % survival
            end
        end
        if currentGrid(i,j) == 0
            if count == 3
                nextGrid(i,j) = 1; % reproduction
            end
        end
    end
end
end

function neighbourCount = getLiveNeighbours(currentGrid, i,j)
neighbourCount = 0;
if i > 1
    if currentGrid(i-1,j) == 1 %check upper
        neighbourCount = neighbourCount + 1;
    end
end
if i < 40
    if currentGrid(i+1,j) == 1 %check upper
        neighbourCount = neighbourCount + 1;
    end
end
if j > 1
    if currentGrid(i,j-1) == 1 %check left
        neighbourCount = neighbourCount + 1;
    end
end
if j < 40
    if currentGrid(i,j+1) == 1 %check right
        neighbourCount = neighbourCount + 1;
    end
end
if i > 1 && j > 1
    if currentGrid(i-1,j-1) == 1 % check top left
        neighbourCount = neighbourCount + 1;
    end
end
if i > 1 && j < 40
    if currentGrid(i-1,j+1) == 1 % check top right
        neighbourCount = neighbourCount + 1;
    end
end
if i < 40 && j > 1
    if currentGrid(i+1,j-1) == 1
        neighbourCount = neighbourCount + 1;
    end
end
if i < 40 && j < 40
    if currentGrid(i+1,j+1) == 1
        neighbourCount = neighbourCount + 1;
    end
end
end
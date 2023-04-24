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
      'red');];
end

%%%%%%%%%%%%%%%%%%%%         GAME LOOP       %%%%%%%%%%%%%%%%%%%%
function play(~,~)
global currentGrid;
iteration = 0;
gameOver = false;
while ~gameOver
    iteration = iteration + 1;
    pause(1);
    %compute next grid
    nextGrid = getNextGrid(currentGrid);
    currentGrid = nextGrid;
    render(currentGrid);
    if iteration > 20
        gameOver = true;
    end
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
            c = [c patch([j,j+1,j+1,j],[i,i,i+1,i+1],'red')];
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
                nextGrid(i,j) = 0
            end
        end



        if count > 3
            nextGrid(i,j) = 0;    % overpopulation
        elseif count < 2
            nextGrid(i,j) = 0;    % underpopulation
        elseif count == 3 && currentGrid(i,j) == 0
            nextGrid(i,j) = 1;    % reproduction
        else
            nextGrid(i,j) = 1;    % survival
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
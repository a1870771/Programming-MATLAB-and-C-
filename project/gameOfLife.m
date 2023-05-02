clc;

%%%%%%%%%%%%%%%%%%%%    INITIALISE ASSETS   %%%%%%%%%%%%%%%%%%%%
global currentGrid c
currentGrid = zeros(40,40);
nextGrid = zeros(40,40);
c = [];

%%%%%%%%%%%%%%%%%%%%    INITIALISE UI COMPONENTS    %%%%%%%%%%%%%%%%%%%%
fig = figure('name', 'The Game of Life', ... 
    'menubar','none', ...
    'position',[250 150 1100 800], ...
    'numbertitle', 'off', ...
    'KeyPressFcn',@play);
ax = axes(fig, ...  %this is the visual version of the game board
    'units', 'pix', ...
    'Position',[0 0 800 800], ...
    'xlim',[0 40], 'YLim',[0 40], ...
    'XTick',[1:40], 'YTick', [1:40], ...
    'XGrid','on', 'YGrid','on', ...
    'TickLength', [0,0.1], ...
    'Color',[0 0 0.45], ...
    'NextPLot','add', ...
    'ButtonDownFcn',@setInit);

%The following annotations are the contents of the sidebar
annotation('textbox',[0.8 .76 .3 .2], ...
    'String','How to play:','EdgeColor','none', 'FontSize',14)
annotation('textbox',[0.75 .7 .24 .2], ...
    'String',['Click on a cell with the mouse to give it life. ' ...
    'When you are ready, press the spacebar to play. ' ...
    'When you wish to exit, press q.'],'EdgeColor','none', 'FontSize',12)
annotation('textbox',[0.8 .44 .3 .2], ...
    'String','The Rules:','EdgeColor','none', 'FontSize',14)
annotation('textbox',[0.75 .40 .24 .2], ...
    'String',['Each iteration, any living cell with fewer than 2 ' ...
    'living neighbours dies of underpopulation. Any living cell ' ...
    'with more than 3 living neighbours dies of overpopulation. ' ...
    'Any dead cell with exactly 3 living neighbours comes to life ' ...
    'as if by reproduction, and any living cell with 2 or 3 living ' ...
    'neighbours lives on to the next iteration.'], ...
    'EdgeColor','none', 'FontSize',12)

%%%%%%%%%%%%%%%%%%%%     INITIAL CONDITIONS      %%%%%%%%%%%%%%%%%%%%
function setInit(ax, ~)
% this function is called whenever the user clicks on the grid, and 
% colours in whichever square was clicked red.
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
function play(~,event)
% this is the main game loop, triggered by a key press. it starts by
% initialising the gameOver boolean as false (to be set to true upon the
% press of 'q'), then enters a while loop contigent on this condition.
% after a short pause, the getNextGrid function is called, followed by
% assigning that next grid to the currentGrid variable, which is then
% rendered onto the gui grid.
    global gameOver currentGrid
    gameOver = false;
    switch event.Key
        case 'q'
            gameOver = true;
    end
    while ~gameOver
        pause(0.6);
        %compute next grid
        nextGrid = getNextGrid(currentGrid);
        currentGrid = nextGrid;
        render(currentGrid);
    end
end

%%%%%%%%%%%%%%%%%%%%        GAME ENGINE         %%%%%%%%%%%%%%%%%%%%
% this function is caled when it's time to render a new game board. it
% scans each cell in the grid matrix with nested for loops, and wherever it
% finds a '1', it patches the gui grid red at the same coordinate.
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
% this is the heart of the game, and stores the rules by which it operates.
% it defines the state of each cell in the grid for the next iteration by
% calling a function to count how many neighbours it has, then, depending
% on it's current state, uses the game rules to compute its next state.
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
% is called once per iteration for every cell in the grid, scans all 8
% neighbouring cells for life and keeps track of the neighbours in an
% iterative variable neighbourCount, which is the return value.
    neighbourCount = 0;
    if i > 1 && currentGrid(i-1,j) == 1 %check upper
        neighbourCount = neighbourCount + 1;
    end
    if i < 40 && currentGrid(i+1,j) == 1 %check lower
        neighbourCount = neighbourCount + 1;
    end
    if j > 1 && currentGrid(i,j-1) == 1 %check left
        neighbourCount = neighbourCount + 1;
    end
    if j < 40 && currentGrid(i,j+1) == 1 %check right
        neighbourCount = neighbourCount + 1;
    end
    if i > 1 && j > 1 && currentGrid(i-1,j-1) == 1 % check top left
        neighbourCount = neighbourCount + 1;
    end
    if i > 1 && j < 40 && currentGrid(i-1,j+1) == 1 % check top right
        neighbourCount = neighbourCount + 1;
    end
    if i < 40 && j > 1 && currentGrid(i+1,j-1) == 1 % check bottom left
        neighbourCount = neighbourCount + 1;
    end
    if i < 40 && j < 40 && currentGrid(i+1,j+1) == 1 % check bottom left
        neighbourCount = neighbourCount + 1;
    end
end
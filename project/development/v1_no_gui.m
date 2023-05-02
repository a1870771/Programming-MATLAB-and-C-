% This is the first version of the game of life, which fuctions without a 
% gui, instead storing the current board in a binary matrix currentGrid, 
% and updating this matrix with each iteration. Setting the initial
% conditions is done through editing the code (lines 11-16), however
% had I not planned to move on to a gui, i would have implemented
% functionality by which the user can input their own coordinates to bring
% to life.

clc;

%%%%%%%%%%%%%%%%%%%%    INITIALISE ASSETS   %%%%%%%%%%%%%%%%%%%%
global currentGrid c iteration
currentGrid = zeros(40,40);
currentGrid(25,25) = 1;
currentGrid(26,25) = 1;
currentGrid(27,25) = 1;
currentGrid(27,26) = 1;
currentGrid(26,24) = 1;
nextGrid = zeros(40,40);
c = [];
iteration = 0;

%%%%%%%%%%%%%%%%%%%%         GAME LOOP       %%%%%%%%%%%%%%%%%%%%
function play(~,event)
global gameOver currentGrid iteration
gameOver = false;
iteration = iteration + 1;
while ~gameOver
    pause(1);
    %compute next grid
    nextGrid = getNextGrid(currentGrid);
    currentGrid = nextGrid;
    disp(currentGrid);
    if iteration > 10
        gameOver = true;
    end
end
end

%%%%%%%%%%%%%%%%%%%%        GAME ENGINE         %%%%%%%%%%%%%%%%%%%%
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
clear;
clc;

%%%%%%%%%%%%%%%%%%%%   Create ui components   %%%%%%%%%%%%%%%%%%%%
fig = uifigure('position', [300 300 1280 720], 'WindowKeyPressFcn', @keyboard);
bg = uihtml(fig, 'HTMLSource','background.html', 'position',[0 0 1280 720]);
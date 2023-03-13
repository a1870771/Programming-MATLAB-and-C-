clc; clear;

imageData=[];
imSize=100;
numRows=imSize;
numCols=imSize;

for row=[1:numRows]
    imageRow=[];
    for col=[1:numCols]
        pixelVal=uint8((row+col)/(imSize*2) * 255);
        imageRow=[imageRow pixelVal];
    end
    imageData=[imageData; imageRow];
end

imageData = [rot90(imageData, 2), rot90(imageData); rot90(imageData, -1), imageData]

imshow(imageData);

imwrite(imageData,'test5.png');

newImageData=imread('test5.png');

whos newImageData;
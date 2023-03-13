clc; clear;

imageData=[];
imSize=100;
numRows=imSize;
numCols=imSize;

for row=[numRows:-1:1]
    imageRow=[];
    for col=[1:numCols]
        pixelVal=uint8(row/(imSize) * 255);
        imageRow=[imageRow pixelVal];
    end
    imageData=[imageData; imageRow];
end

imshow(imageData);

imwrite(imageData,'test2.png');

newImageData=imread('test2.png');

whos newImageData;
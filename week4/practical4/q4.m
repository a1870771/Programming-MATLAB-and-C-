clc; clear;

imageData=[];
imSize=100;
numRows=imSize;
numCols=imSize;

for col=[1:numCols]
    imageRow=[];
    for row=[numRows:-1:1]
        pixelVal=uint8(row/(imSize) * 255);
        imageRow=[imageRow pixelVal];
    end
    imageData=[imageData; imageRow];
end

imshow(imageData);

imwrite(imageData,'test4.png');

newImageData=imread('test4.png');

whos newImageData;
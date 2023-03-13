clc; clear;

imageData=[];
imSize=100;
numRows=imSize;
numCols=imSize;

for col=[1:numCols]
    imageRow=[];
    for row=[1:numRows]
        pixelVal=uint8(row/(imSize) * 255);
        imageRow=[imageRow pixelVal];
    end
    imageData=[imageData; imageRow];
end

imshow(imageData);

imwrite(imageData,'test3.png');

newImageData=imread('test3.png');

whos newImageData;
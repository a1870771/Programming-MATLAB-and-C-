clc; clear;

imageData=[];
imSize=100;
numRows=imSize;
numCols=imSize;

for row=[1:numRows]
    imageRow=[];
    for col=[1:numCols]
        pixelVal=uint8(row/(imSize) * 255);
        imageRow=[imageRow pixelVal];
    end
    imageData=[imageData; imageRow];
end

imshow(imageData);

imwrite(imageData,'test1.png');

newImageData=imread('test1.png');

whos newImageData;
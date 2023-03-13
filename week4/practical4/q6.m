clc; clear;

imageData=imread('Kand.png');
[numRows, numCols]=size(imageData);
newImage=[];

for row=[1:numRows]
    imageRow=[];
    for col=[1:numCols]
        pixelVal=imageData(row, col);
        imageRow=[pixelVal imageRow];
    end
    newImage=[imageRow; newImage];
end

imshow(newImage);

imwrite(newImage,'test6.png');

newImageData=imread('test6.png');
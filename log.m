close all

I=imread('im2.jpg');
I=rgb2gray(I);
%%imshow(I)

threshold=0.3;
BW = edge(I,'log',threshold);

imshow(BW);

close all

I=imread('im2.jpg');
I=rgb2gray(I);
%%imshow(I)

threshold=0.01;
BW = edge(I,'Canny',threshold,3);

imshow(BW);

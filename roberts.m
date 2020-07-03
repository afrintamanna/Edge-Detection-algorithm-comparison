close all

I=imread('im1.jpg');
I=rgb2gray(I);
%%imshow(I)

threshold=0.1;
BW = edge(I,'roberts',threshold);

imshow(BW);

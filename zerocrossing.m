close all

I=imread('im2.jpg');
I=rgb2gray(I);
%%imshow(I)

threshold=0.02;
BW = edge(I,'zerocross',threshold);

imshow(BW);

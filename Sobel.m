close all

I=imread('im1.jpg');
I=rgb2gray(I);
%%imshow(I)


BW = edge(I,'Sobel',threshold);

imshow(BW)








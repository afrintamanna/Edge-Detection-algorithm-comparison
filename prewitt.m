close all

I=imread('im1.jpg');
I=rgb2gray(I);
%%imshow(I)

threshold=0.3;
BW = edge(I,'prewitt',threshold);

imshow(BW)

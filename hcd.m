im= imresize(imread('im1.jpg'), [512 512]);
im=im(:,:,1);

corners = detectHarrisFeatures(im);
imshow(im); hold on;
plot(corners.selectStrongest(1550));

sigma=1;
radius=1;
order=(2*radius+1);
thresold=1500;

%derivative of image
[dx,dy]=meshgrid(-1:1, -1:1);

Ix=conv2(double(im),dx,'same');
Iy=conv2(double(im),dy,'same');

%gaussian filter
dim=max(1,fix(6*sigma));
m=dim;
n=dim;

[h1,h2]=meshgrid(-(m-1)/2: (m-1)/2, -(n-1)/2: (n-1)/2);
hg=exp(-(h1.^2+h2.^2)/(2*sigma^2));
[a,b]=size(hg);
sum=0;

for i=1:a
    for j=1:b
        sum=sum+hg(i,j);
    end
end

g=hg./sum;


%calculate entries for M matrix
Ix2=conv2(double(Ix.^2),g,'same');
Iy2=conv2(double(Iy.^2),g,'same');
Ixy=conv2(double(Ix.*Iy),g,'same');


%harris measure
R=(Ix2.*Iy2 - Ixy.^2) ./ (Ix2+Iy2+eps);


%find local maxima
mx=ordfilt2(R, order, ones(order));

harris_points=(R==mx) & (R>thresold);

[rows,cols]=find(harris_points);

figure,imshow(im),hold on,
plot(cols,rows,'r*');
% Author: Kenneth H.L. Ho
% Copyright 2019 RIKEN BDR
% License: GPL v3 https://www.gnu.org/licenses/gpl-3.0.txt 
%% Basic Image Processing 
% %% Download C.elegnas embryo (Kyoda et al., 2013), Image id=1, Z=30, t=0, from SSBD database
%% Reading an image from file

url_image = "http://ssbd.qbic.riken.jp/image/webgateway/render_image/1/30/0"
k_img1 = imread(url_image)
%%
imwrite(k_img1, 'k_image.tif', 'tif')
%%
imfinfo('k_image.tif')
%%
imshow('k_image.tif')
%%
k_img1
%%
size(k_img1)
%% 

figure;
image(k_img1)
daspect([1,1,1])


%%
whos k_img1
%%
% Finding the minumum intensity on Red channel (or whichever as they are of
% the same value)
minvalue = min(min(k_img1(:,:,1)));
disp(minvalue)
%%
% Find the row and column of the image with the minimum intensity value.
[row, col] = find(k_img1(:,:,1)==minvalue);
disp([row, col])
%%
k_img1(400:410,430:450,1)
%%
maxvalue = max(max(k_img1(:,:,1)))
disp(maxvalue)
%%
[row, col] = find(k_img1(:,:,1)==maxvalue);
disp([row, col])
%%
k_img1(180:440,185:455,1)
% converting rgb to indexed image
k_img2=rgb2gray(k_img1);

% image scaled colour function; using default colour map
imagesc(k_img2)
daspect([1,1,1])

%%
% using autumn colourmap
colormap("autumn");
imagesc(k_img2);
daspect([1,1,1])
%%
% Thresholding
% display all the pixels that are larger than intensity 64
bw = k_img1 > 64;
%%
imshow(bw(:,:,1))
%%
% thresholding at 128
bw = k_img1 > 128;
%%
imshow(bw(:,:,1))
%%
bw2 = k_img2 > 64
daspect([1,1,1])
imagesc(bw2)
daspect([1,1,1])

%%
colormap(bone)
daspect([1,1,1])
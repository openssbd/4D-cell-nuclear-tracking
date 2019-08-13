% Author: Kenneth H.L. Ho
% Copyright 2019 RIKEN BDR
% License: GPL v3 https://www.gnu.org/licenses/gpl-3.0.txt 
%% Accessing images directly from SSBD database into MATLAB

% Access SSBD and retrieve image id = 340, Z = 30, t = 0
img = ssbd.image(34073, 0, 0); 
%%
image(img)
daspect([1,1,1]);
%%
img2 = ssbd.image(34074, 0, 0);
imagesc(img2)
daspect([1,1,1])
%%
img21 = rgb2gray(img2);
%%
img3 = rgb2gray(ssbd.image(34075, 0, 0));
imagesc(img3);
daspect([1,1,1]);

%%
% Bashar images in SSBD starting with image_id = 34073.
% it has 28 stacks.
% Reading in Bashar slices and convert them into a 4D image stack.
img_id = 34073;
img = [];
imgt =[];
for t = 1:5
    for i = 1:28
        img{i} = rgb2gray(ssbd.image(img_id, 0, 0));
        whos img;
        img_id=img_id+1;
    end
        imgt{t} = cat(3, img{:});
end
%%
imgzt = cat(4, imgt{:});
    
%%
whos imgzt
%%
% display the image z = 14 and t = 3
imagesc(imgzt(:,:,14,3));
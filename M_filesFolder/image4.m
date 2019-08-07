% Author: Kenneth H.L. Ho
% Copyright 2019 RIKEN BDR
% License: GPL v3 https://www.gnu.org/licenses/gpl-3.0.txt 
%%
% Access IDR and retrieve image id = 2858397, Z = 10, t = 30
img = idr.image(2858397, 10, 30)
imagesc(img)
daspect([1,1,1])
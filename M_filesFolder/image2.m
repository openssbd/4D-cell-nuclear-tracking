% Author: Kenneth H.L. Ho
% Copyright 2019 RIKEN BDR
% License: GPL v3 https://www.gnu.org/licenses/gpl-3.0.txt 
%% 
%% Access image directly from SSBD database into MATLAB

% Access SSBD and retrieve image id = 1, Z = 30, t = 0
k_img = ssbd.image(1, 30, 0); 
imshow(k_img)
%%
% Accessing quantitative data from the SSBD database
% here we access the data with bdml_ID = 4ed09fa3-7650-45a9-ac55-426980aa7d0a
% ssbd.bd5coords(bdml_id, time, offset, limit)
% 
coords = ssbd.bd5coords("4ed09fa3-7650-45a9-ac55-426980aa7d0a", 0, 0, 20)
disp(coords.meta)
disp(coords.objects)
%%
coords.objects.x
%%
coords.objects.y
%%
coords.objects(2)
%%
coords.objects(2).x
%%
size(coords.objects)
%%
scale = ssbd.bd5scaleunit("4ed09fa3-7650-45a9-ac55-426980aa7d0a")
%%
scale.meta
%%
scale.objects
%%
scale.objects.xScale
%% Analysis - plotting proliferation curve of _C. elegans_ by counting the number of nucleus
% 
bdmlid = '800faa21-c28c-4b72-bd12-d41f2eed02e8';
limit = 1;
tp = 0;
offset = 0;
limit = 1;
no_of_nucleus = [];
timept = [];
resultdata = ssbd.bd5coords(bdmlid, tp, offset, limit)
disp(["tp=" tp]);
nn = resultdata.meta.total_count;
while nn > 0
    no_of_nucleus = [no_of_nucleus nn];
    timept = [timept tp];
    tp=tp+1;
    try
        resultdata = ssbd.bd5coords(bdmlid, tp, offset, limit);
        disp(["tp=" tp "nn=" nn]);
        nn = resultdata.meta.total_count;
    catch
        disp("finished")
        nn = -1;
    end
end
%%
% disp(timept)
%%
figure;
hold on
plot(timept, no_of_nucleus);
hold off;
xlabel('Time point')
ylabel('Num of nucleus')
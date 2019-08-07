% Author: Kenneth H.L. Ho
% Copyright 2019 RIKEN BDR
% License: GPL v3 https://www.gnu.org/licenses/gpl-3.0.txt 
%% Create a Class function to interface with SSBD

classdef idr
    methods(Static)
        %% Create a simple interface to interact with SSBD-OMERO API
        function rgb = image(id, z, t)
            fprintf("id: %d, z: %d, t: %d \n", id, z, t);
            api ='https://idr.openmicroscopy.org/webgateway/render_image';
            url = sprintf("%s/%d/%d/%d/", api, id, z, t);
            disp(url);
            rgb = webread(url);
            %imshow(rgb);
            %rgb = url;
        end
    end
end
% Author: Kenneth H.L. Ho
% Copyright 2019 RIKEN BDR
% License: GPL v3 https://www.gnu.org/licenses/gpl-3.0.txt 
%% Create a Class function to interface with SSBD

classdef ssbd
    methods(Static)
        %% Create a simple interface to interact with SSBD-OMERO API
        function rgb = image(id, z, t)
            fprintf("id: %d, z: %d, t: %d \n", id, z, t);
            api ='http://ssbd.qbic.riken.jp/image/webgateway/render_image';
            url = sprintf("%s/%d/%d/%d", api, id, z, t);
            disp(url);
            rgb = webread(url);
            %imshow(rgb);
            %rgb = url;
        end
        function coords = bd5coords(bdmlid, timept, offset, limit)
            urlbase = 'http://ssbd.qbic.riken.jp/SSBD/api/v3';
            apifunc = 'bd5coords';
            fmt = '?format=json';
            fprintf("bdmlid=%s, timept=%d, offset=%d, limit=%d\n", bdmlid, timept, offset, limit);
            if ~offset
                offset = 0;
            end
            if ~limit
                limit = 20;
            end
            url = sprintf("%s/%s/%s&bdmlID=%s&ts=%d&offset=%d&limit=%d\n", urlbase, apifunc, fmt, bdmlid, timept, offset, limit);
            disp(url);
            coords = webread(url);
        end
        function scale = bd5scaleunit(bdmlid)
            urlbase = 'http://ssbd.qbic.riken.jp/SSBD/api/v3';
            apifunc = 'bd5scaleunit';
            fmt = '?format=json';
            fprintf("bdmlid=%s\n", bdmlid);
            offset = 0;
            limit = 1;
            url = sprintf("%s/%s/%s&bdmlID=%s&offset=%d&limit=%d\n", urlbase, apifunc, fmt, bdmlid, offset, limit);
            disp(url);
            scale = webread(url);
        end 
    end
end
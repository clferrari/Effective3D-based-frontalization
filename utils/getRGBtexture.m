% Created by Iacopo Masi <masi>@dsi.unifi.it
% Copyright MICC - Media Integration and Communication Center
% and USC Computer Vision Lab.
%
% [colors] = getRGBtexture(coordTex,tex)
%
% The function gets the actual RGB value for each vertex on the mesh
%
% Input
% 
% coordTex: the coordinate in the texture image size
% tex: the texture image
%
% Output
%
% colors: the matrix #points x 3 where 3 is equal to the RGB value in [0..1]

function [colors] = getRGBtexture(coordTex,tex)

R = tex(:,:,1);
G = tex(:,:,2);
B = tex(:,:,3);

Xtex = coordTex(:,1);
Ytex = coordTex(:,2);

%% Clipping

Xtex = max(Xtex,repmat(1,[size(Xtex),1]));
Ytex = max(Ytex,repmat(1,[size(Ytex),1]));

Xtex = min(Xtex,repmat(size(tex,2),[size(Xtex),1]));
Ytex = min(Ytex,repmat(size(tex,1),[size(Ytex),1]));

%% Getting texture colors
I = sub2ind(size(tex), Ytex, Xtex);
colors = [R(I) G(I) B(I)];

%% Color normalization
colors = double(colors)./255.0;


return
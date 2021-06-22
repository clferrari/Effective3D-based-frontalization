function [ visLand, idxVland, Nvis, landModelVis,landImageVis] = ...
    getVisLand( vertex, landImage, visIdx, idxLandmarks3D )
%GETVISLAND Summary of this function goes here
%   Detailed explanation goes here

[visLand, ~, idxVland] = intersect(visIdx,idxLandmarks3D);
Nvis = setxor(1:size(landImage,1),idxVland);

landModelVis = vertex(visLand,:);
landImageVis = landImage(idxVland,:);

end


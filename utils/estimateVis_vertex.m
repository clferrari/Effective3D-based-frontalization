function [ visIdx] = estimateVis_vertex(vertex,R,C_dist,r)
%ESTIMATEVIS_VERTEX estimates visible 3d points given the rotation

viewPoint_front = [0 0 C_dist];
%rotate viewpoint relying on estimated pose
viewPoint = rotatePointCloud(viewPoint_front,R,[],0)';
% select visible vertices indices
visIdx = HPR(vertex,viewPoint,r);


end


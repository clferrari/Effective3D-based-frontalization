function [Aa, Sa, Ra, ta,defShape,alpha,err,err_avg,visIdx] = opt_3DMM_fast(Weights,Components_res,Components,...
    landmarks3D,idxLandmarks3D,landImage,avgFace,lambda,rounds,r,C_dist)
%% Baseline pose estimation - model deformation - pose refinment
visIdx = [];
[Aa, Sa, Ra, ta] = estimatePose(landmarks3D,landImage);
proj = getProjectedVertex(landmarks3D,Sa,Ra,ta)';
err_avg = mean(sqrt(sum((landImage - proj).^2,2)));

%% deform shape
[alpha]  = alphaEstimation_fast(landImage,proj,Components_res,idxLandmarks3D,Sa,Ra,ta,Weights,lambda);
defShape = deform_3D_shape_fast(avgFace',Components,alpha);
defShape = defShape';
defLand = defShape(idxLandmarks3D,:);
proj = getProjectedVertex(defLand,Sa,Ra,ta)';
for i = 1:rounds
    [Aa, Sa, Ra, ta] = estimatePose(defLand,landImage);
    proj = getProjectedVertex(defLand,Sa,Ra,ta)';
    [alpha]  = alphaEstimation_fast(landImage,proj,Components_res,idxLandmarks3D,Sa,Ra,ta,Weights,lambda);
    defShape = deform_3D_shape_fast(defShape',Components,alpha);
    defShape = defShape';
    defLand = defShape(idxLandmarks3D,:);
end

%% final pose estimation
[Aa, Sa, Ra, ta] = estimatePose(defLand,landImage);
proj = getProjectedVertex(landmarks3D,Sa,Ra,ta)';
err = mean(sqrt(sum((landImage - proj).^2,2)));

%% get visible landmarks-------
if ~isempty(C_dist)
    [visIdx] = estimateVis_vertex(defShape,Ra,C_dist,r);
    [ visLand, idxVland, Nvis, ~,~] = ...
        getVisLand( defShape, landImage, visIdx, idxLandmarks3D );
end
%----------------------------------------------------




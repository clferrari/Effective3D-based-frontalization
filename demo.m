% debug
%---------------
debug = true;
%-------------
%% Add paths
addpath(genpath('utils/'));
%% Load stuff
disp('Loading data...')
load('data/img_test.mat');
load('data/avgModel_bh_1779_NE.mat')
load('data/Components_DL_1779.mat')
Components_res = reshape_components(Components);
% Remove boundary landmarks. It is not strictly necessary. Can be removed
% if 3D landamrks are used that are faithful to the boundary of the face.
landmarks3D(1:17,:) = [];
idxLandmarks3D(1:17) = [];
%% Params
% Optimization steps. If increased, reduce the lambpda_opt regularizer
rounds = 5;
% Regularization parameter. For higher-resolution images, lower this value.
% It might require a bit of tuning...
lambda_opt = 0.001;
% Parameters for the HPR operator
r = 4;
C_dist = 700;
% Frontalized image resolution
renderingStep = 0.5;

if debug
    plot_landmarks(img, landImage,'r.',1);
    pause
    close
end

%% Fit 3DMM to image
disp('Fitting 3DMM to image...')
[A, S, R, t,defShape,alpha,~,~,visIdx] = opt_3DMM_fast(Weights,Components_res,Components,...
    landmarks3D,idxLandmarks3D,landImage,avgModel,lambda_opt,rounds,r,C_dist);
%% Build Frontalized image
disp('Building frontalized image...')
proj_shape = getProjectedVertex(defShape,S,R,t)';
[frontalView, mod3d, colors] = renderFaceLossLess_2(defShape,proj_shape,img,S,R,t,renderingStep,visIdx);
defShape = defShape';
projModelOnRend = getLandmarkPosition(defShape,defShape',renderingStep);
if debug
   plot_landmarks(frontalView, projModelOnRend(idxLandmarks3D,:),'r.',0); 
   pause
   close
end
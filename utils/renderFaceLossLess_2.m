% Created by Claudio Ferrari <claudio.ferrari>@unifi.it
% Copyright MICC - Media Integration and Communication Center
%
% [frontalView, mod3d] = renderFaceLossLess(defShape,proj_shape,img)
%
% renderFaceLossLess renders a frontal view  
% by sampling each pixel inside the projected 3D model bounding box. The 
% projected 3D model is used as prior to infer a
% coarse 3D position for each pixel. The resulting 3D model is also built

% INPUT
% defShape: the deformed 3D shape (nVertices X 3)
% proj_shape: the projected 3D model onto the image plane (nVertices X 2)
% img; the image containing the face image
% S,R,t the 3D rotation, scale and 2D translation on the image
% renderingStep: the rendering step 

% OUTPUT
% frontalView: the rendered frontal view
% mod3d: the presumed full resolution 3D model

function [frontalView, mod3d, colors] = renderFaceLossLess_2(defShape,proj_shape,img,S,R,t,renderingStep,visIdx)
%%  Build a uniform grid pixel-by-pixel inside the projected 3d model bounding box
grid_step = 1;
max_sh = max(proj_shape);
min_sh = min(proj_shape);
Xsampling = min_sh(1,1):grid_step:max_sh(1,1);
Ysampling = max_sh(1,2):-grid_step:min_sh(1,2);
Xsampling = round(Xsampling);
Ysampling = round(Ysampling);
[x_grid,y_grid] = meshgrid(Xsampling,Ysampling);
%%  Estimate pixels 3D position by computing the interpolant using the 3D model as prior.
% Pixels outside the projected model convex hull are not considered so as
% to extract an accurate profile

Fx = scatteredInterpolant(proj_shape(visIdx,1),proj_shape(visIdx,2),defShape(visIdx,1),'linear','none');
Fy = scatteredInterpolant(proj_shape(visIdx,1),proj_shape(visIdx,2),defShape(visIdx,2),'linear','none');
Fz = scatteredInterpolant(proj_shape(visIdx,1),proj_shape(visIdx,2),defShape(visIdx,3),'linear','none');

%% interpolate 3D values
img_x_3d = Fx(x_grid,y_grid);
img_y_3d = Fy(x_grid,y_grid);
img_z_3d = Fz(x_grid,y_grid);
%% build the full resolution 3D model
x = img_x_3d(:);
y = img_y_3d(:);
z = img_z_3d(:);
mod3d = [x y z];
mask3d = isnan(mod3d(:,1));
mod3d(mask3d,:) = [];
%% render the frontal view by sampling the RGB values 
projMod3d = getProjectedVertex(mod3d,S,R,t)';
colors = getRGBtexture(round(projMod3d),img);
colors = transpVertex(colors);

frontalView = build_image(mod3d',defShape',colors,renderingStep);

end


function img = build_image(P_f,P,colors,step)
%% Create grid
min_x = min( P(1,:) );
max_x = max( P(1,:) );
min_y = min( P(2,:) );
max_y = max( P(2,:) );
Xsampling = min_x:step:max_x;
Ysampling = max_y:-step:min_y;

%% XY Support
[x,y] = meshgrid(Xsampling,Ysampling);

%% Create interpolation functions
Fr = scatteredInterpolant( P_f(1,:)', P_f(2,:)', colors(1,:)','natural','none' );
Fg = scatteredInterpolant( P_f(1,:)', P_f(2,:)', colors(2,:)','natural','none' );
Fb = scatteredInterpolant( P_f(1,:)', P_f(2,:)', colors(3,:)','natural','none' );

%% Interpolating
texR = Fr(x,y);
texG = Fg(x,y);
texB = Fb(x,y);

%% remove NaN elements
mask = isnan( texR );
texR(mask) = 0;
texG(mask) = 0;
texB(mask) = 0;

%% building image
img(:,:,1) = texR;
img(:,:,2) = texG;
img(:,:,3) = texB;
img = img.*255;
img = uint8(img);

return
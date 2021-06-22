function landmarks = getLandmarkPosition(V,landModel,step)

%% So the new mesh has nx*ny vertex.
min_x = min( V(1,:) );
max_x = max( V(1,:) );
min_y = min( V(2,:) );
max_y = max( V(2,:) );
Xsampling = min_x:step:max_x;
Ysampling = max_y:-step:min_y;

%% create a grid in x and y
% x = linspace(min(V(:,1)),max(V(:,1)),nx);
% y = linspace(min(V(:,2)),max(V(:,2)),ny);
landmarks = [];
for l=1:size(landModel,1)
   land = landModel(l,:);
   xquery = land(1);
   yquery = land(2);
   [null, idxX] = min(abs(xquery - Xsampling));
   [null, idxY] = min(abs(yquery - Ysampling));
   landmarks = [landmarks;idxX idxY;];
end
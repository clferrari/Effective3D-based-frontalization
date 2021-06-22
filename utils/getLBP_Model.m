function [ featLBP, uncomputed ] = getLBP_Model(im,projModel,patchSize)
warning off
uncomputed = [];
projModel = transpVertex2(projModel,1,2);
featLBP = [];
patchSizeD = patchSize*2 + 1;
for i = 1:size(projModel,2)
    tgtPoint = ceil(projModel(:,i));
    % avoids side patches
    if (tgtPoint(1,1) <= patchSize || tgtPoint(2,1) <= patchSize ||...
            tgtPoint(1,1) >= size(im,2) - patchSize || tgtPoint(2,1) >= size(im,1) - patchSize)
        patch = zeros(patchSizeD,patchSizeD,3,'uint8'); % set patches which are too near to image bound to 0.
        uncomputed = [uncomputed; i];
        % get the LBP on a patch computed over the vertex location
        feat = extractFeature(patch,patchSizeD);
        featLBP = [featLBP; feat];
    else
        patch = im(tgtPoint(2,1)-patchSize:tgtPoint(2,1)+patchSize,...
            tgtPoint(1,1)-patchSize:tgtPoint(1,1)+patchSize,:);
        feat = extractFeature(patch,patchSizeD);
        featLBP = [featLBP; feat];
    end
end
end


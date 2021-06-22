function eachfeat = computeStackLBP(img,cellSize)
eachfeat=[];
histCellLpb = vl_lbp(single(rgb2gray(uint8(img))),cellSize);
%histCellLpb = vl_lbp(single(img),cellSize);
for xx=1:size(histCellLpb,2)
   for yy=1:size(histCellLpb,1)
      lbp = histCellLpb(yy,xx,:);
      eachfeat=[eachfeat; lbp(:); ];
   end
end
return
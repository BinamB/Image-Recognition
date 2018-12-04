function [outImage ] = removeBorders( inImage )
%Detects and removes borders from images
%   Detailed explanation goes here
outImage = inImage(1:end-18, :, :);
% image = rgb2gray(inImage);
% rowSum = sum(image,1);
% colSum = sum(image,2);
% figure, bar(rowSum);
% figure, bar(colSum);
% 
% rowStd = std(colSum);
% colStd = std(rowSum);
% factor = 1;
% top = 1;
% bottom = size(inImage,1);
% left = 1;
% right = size(inImage,2);
% 
% for rows = 2:numel(colSum)
%     if abs(colSum(rows)-colSum(rows-1)) > factor*rowStd
%         top = rows;
%         break;
%     end
% end
% 
% for rows = numel(colSum):-1:2
%     if abs(colSum(rows)-colSum(rows-1)) > factor*rowStd
%         bottom = rows;
%         break;
%     end
% end
% 
% for cols = 2:numel(rowSum)
%     if abs(rowSum(cols)-rowSum(cols-1)) > factor*colStd
%         left = cols;
%         break;
%     end
% end
% 
% for cols = numel(rowSum):-1:2
%     if abs(rowSum(cols)-rowSum(cols-1)) > factor*colStd
%         right = cols;
%         break;
%     end
% end
% outImage = inImage(top:bottom, left:right,:);
end


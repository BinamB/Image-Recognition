function tinyIM = tinyImage(image, side)
    if nargin==1
        side = 16;
    end
    im2 = imresize(image, [side side]);
    tinyIM = im2(:);
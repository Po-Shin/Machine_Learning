function [segments] = extractinstances(imageArray,width)
segments = []
im = imageArray;
label = im_meanshift(imageArray,40);
for segment = 1:max(max(label))
    rgb = double(imageArray).*(label==segment);
    r = mean2(rgb(:,:,1));
    g = mean2(rgb(:,:,2));
    b = mean2(rgb(:,:,3));
    segments = [segments;r,g,b];
end
end


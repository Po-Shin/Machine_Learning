function [labels, bags] = extractinstances2(image_cells,width,class)
labels = {}
bags = {}

for i = 1: length(image_cells)
    instances = [];
    im = image_cells{1,i};
    label = im_meanshift(im,40);
    for segment = 1:max(max(label))
        rgb = double(im).*(label==segment);
        r = mean2(rgb(:,:,1));
        g = mean2(rgb(:,:,2));
        b = mean2(rgb(:,:,3));
        instances = [instances;r,g,b];
    end
    bags = [bags,instances];
    labels = [labels,class];
end


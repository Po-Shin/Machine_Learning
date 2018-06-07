addpath('/Users/poshin/Documents/prdatasets')
addpath('/Users/poshin/Documents/coursedata')
addpath('/Users/poshin/Documents/prtools')
addpath('./additionalcode')
addpath('./sival_apple_banana')
addpath('./sival_medal_tea')
%% load apple images
apple_folder = '/Users/poshin/Documents/MATLAB/Machine Learning/Assignment6/sival_apple_banana/apple'

if ~isdir(apple_folder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', apple_folder);
  uiwait(warndlg(errorMessage));
  return;
end
apple_images = fullfile(apple_folder, '*.jpg');
jpegFiles_app = dir(apple_images);

%% load banana images
banana_folder = '/Users/poshin/Documents/MATLAB/Machine Learning/Assignment6/sival_apple_banana/banana'

if ~isdir(banana_folder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', banana_folder);
  uiwait(warndlg(errorMessage));
  return;
end
banana_images = fullfile(banana_folder, '*.jpg');
jpegFiles_ban = dir(banana_images);

%% read images
app_images = {};
banana_images = {};
for k = 1:length(apple_images)
  baseFileName = jpegFiles_app(k).name;
  fullFileName = fullfile(apple_folder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  app_images = [app_images, imageArray];
%   imshow(imageArray);  % Display image.
%   drawnow; % Force display to update immediately.
end

for k = 1:length(banana_images)
  baseFileName = jpegFiles_ban(k).name;
  fullFileName = fullfile(apple_folder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  banana_images = [banana_images, imageArray];
%   imshow(imageArray);  % Display image.
%   drawnow; % Force display to update immediately.
end

%% run extractinstances.m
for k = 1:length(app_images
    baseFileName = jpegFiles_app(k).name;
    fullFileName = fullfile(apple_folder, baseFileName);
    imageArray = imread(fullFileName);
    segments = extractinstances(imageArray,40);
    disp(segments)
end

%%


%% test
figure;
for k = 1:6
  baseFileName = jpegFiles_app(k).name;
  fullFileName = fullfile(apple_folder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  label = im_meanshift(imageArray,50);
  subplot(3,2,k)
  imshow(label,[min(label(:)) max(label(:))]);  % Display image.
  drawnow; % Force display to update immediately.
end


%% test
segments = []

baseFileName = jpegFiles_app(2).name;
fullFileName = fullfile(apple_folder, baseFileName);
imageArray = imread(fullFileName);
label = im_meanshift(imageArray,40);
for segment = 1:max(max(label))
    rgb = double(imageArray).*(label==segment);
    r = mean2(rgb(:,:,1));
    g = mean2(rgb(:,:,2));
    b = mean2(rgb(:,:,3));
    segments = [segments;r,g,b,segment];
end


%%
% % figure(1);
% subplot(3,2,1)
% image(lab_30)
% title('30')
figure(1);
subplot(3,2,1)
imshow(lab_40,[min(lab_40(:)) max(lab_40(:))]);
title('40')

subplot(3,2,2)
imshow(lab_45,[min(lab_45(:)) max(lab_45(:))]);
title('45')

subplot(3,2,3)
imshow(lab_50,[min(lab_50(:)) max(lab_50(:))]);
title('50')

subplot(3,2,4)
imshow(lab_64,[min(lab_64(:)) max(lab_64(:))]);
title('64')

subplot(3,2,5)
imshow(lab_128,[min(lab_128(:)) max(lab_128(:))]);
title('128')

subplot(3,2,6)
imshow(lab_256,[min(lab_256(:)) max(lab_256(:))]);
title('256')

figure(99);
imshow(imageArray);
%   imshow(imageArray);  % Display image.

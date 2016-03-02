%% QUESTION 1
% Detect IMproperly Filled Bottles
%% Formatting Image For Use
% The image is converted to binary using thresholding and then opening and closing is applied.

clc;
clear;
close all;

im = imread('bottles.tif');
figure; imshow(im);
im_b = im2bw(im,0.8);

SE = strel('disk',2);
im_b = imopen(im_b,SE);
im_b = imclose(im_b,SE);

%% Detecting Improperly filled Bottle
% A bounding box is obtained for each of the coneected component. 
% A threshold value = 65 is which which indicated the max height of a bounding box for a properly filled bottle.
% Based on the threshold the improperly filled bottle is detected.

STATS = regionprops(im_b,'BoundingBox');
var = {STATS.BoundingBox};
[L,NUM] = bwlabel(im_b);
l= 1;
for i = 1:NUM
    vart(i,:) = var{i};
    h(i,1) = vart(i,3);
    if h(i,1)>65
        mark(1,l) = i; 
        l = l+1;
    end
    
end

%% Printing the Result
% A bounding box is drawn around the empty part of the improperly filled
% bottles

figure;imshow(im);

for i = 1:size(mark,2)
    ro = mark(1,i);
    rectangle('Position',vart(ro,:),'EdgeColor','y');
    hold on
end
hold off
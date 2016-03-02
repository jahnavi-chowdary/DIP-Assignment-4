%% QUESTION 4
% Ripple transformation

%% 

clear;
clc;
close all;

im = imread('taj.jpg');
im = rgb2gray(im);
figure;imshow(im);
title('Original Image');

[h w] = size(im);
im_new = zeros(h,w);

for i = 1:h
    for j = 1:w
        i1 = floor(i - (10 * (sin((2*pi*j) ./ 100))));
        j1 = floor(j - (10 * (sin((2*pi*i) ./ 100))));
        if (i1 >= 1 && i1<h && j1 >= 1 && j1<w)
            im_new(i,j) = im(i1,j1);
        end
    end
end

figure;imshow(im_new,[]);
title('Ripple Transformed Image');
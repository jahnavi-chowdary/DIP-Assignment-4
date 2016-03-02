%% QUESTION 3
% Denoising using Wavelet Based Denoising Algorithm

%% Addition of Gaussian Noise
% Gaussian noise of Variance = 0.001 is added to the original image.

clc;
clear all;
close all;

im = imread('cameraman.tif');
im = im2double(im);
figure, imshow(im); 
title('Original Image');

im_noise = imnoise(im,'gaussian',0,0.001);
figure, imshow(im_noise); 
title('Noisy Image');

%% Wavelet Transform
% We take the wavelet transform inorder to obtain the subbands

[LL,LH,HL,HH]=dwt2(im_noise,'haar'); 
figure, subplot(2,2,1);imshow(LL,[]);title('LL band of image');
subplot(2,2,2);imshow(LH,[]);title('LH band of image');
subplot(2,2,3);imshow(HL,[]);title('HL band of image');
subplot(2,2,4);imshow(HH,[]);title('HH band of image');

%% Thresholding
% For each high frequency subband (i.e the LH,HL,HH subbands), we apply a threshold 
% and then use the Soft Thresholding Method to the noisy coefficients to 
% get the noise free wavelet coefficients. 

thres1 = 1.5;
thres2 = 1.5;
thres3 = 1.5;

soft_HH = wthresh(HH,'s',thres1);
soft_LH = wthresh(LH,'s',thres2);
soft_HL = wthresh(HL,'s',thres3);

%% Obtaining the Denoised Image
% We finally take the inverse wavelet transform in order to obtain the denoised image

final = idwt2(LL,soft_LH,soft_HL,soft_HH,'db3');
figure, imshow(im_noise); 
title('Noisy Image');

figure, imshow(final); 
title('Denoised Image');
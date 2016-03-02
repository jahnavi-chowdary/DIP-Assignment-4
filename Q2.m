%% QUESTION 2 - Main Code
% Detect the Asanas

%% Initialization
% The values of the asanas are stored in a variable in order.

clc;
clear;
close all;

answ = {'Ustrasana' 'Veerbhadrasan' 'Vrikhsasana' 'Trikonasana'}';

dirlist = dir('C:\Users\Jahnavi Chowdary\Desktop\IIIT\3rd Year\DIP\Assignments\ass4\assignment4\yogasan\*.jpg');

%% Computing Scores for each Input Image
% For each image, its score is the sum of its chain code.

for k = 1:4
    
    k;
    fname = dirlist(k).name;
    [path,name,ext] = fileparts(fname);
    images.(name) = imread(fullfile('C:\Users\Jahnavi Chowdary\Desktop\IIIT\3rd Year\DIP\Assignments\ass4\assignment4\yogasan', fname));
    im = images.(name);
    
    sco(1,k) = score(im);
   
end

%% Testing
% The images are read in a random order, and are classified based on their
% calculated scores.

l = [1 2 3 4];
randorder = randperm(4);
rand_l = l(randorder);

for i = 1:4
    
    k = rand_l(i);
    fname = dirlist(k).name;
    [path,name,ext] = fileparts(fname);
    images.(name) = imread(fullfile('C:\Users\Jahnavi Chowdary\Desktop\IIIT\3rd Year\DIP\Assignments\ass4\assignment4\yogasan', fname));
    im = images.(name);
    
    sco_test(1,i) = score(im);
    num = find(sco == sco_test(1,i));
    
    tit = answ{num};
    figure;imshow(im);
    title(tit);
   
end


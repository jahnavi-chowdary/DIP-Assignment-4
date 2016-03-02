%% QUESTION 2 - Function
% This function computes the score of a given image

%%

function [score] = score(im)
    im = im2bw(im);
    im = imresize(im,[300,300]);
    %figure; imshow(im);
    size(im);
    im1 = edge(im,'sobel');
    SE = strel('disk',1);
    im1 = imdilate(im1,SE);
    im1=padarray(im1,[1 1]);

    % figure; imshow(im)
    % figure; imshow(im1)
    
    [h w] = size(im1);
    [x_1 y_1] = find(im1==1,1,'first'); 
    
    dire = [1,0 ; 1,-1 ; 0,-1 ; -1,-1 ; -1,0 ; -1,1 ; 0,1 ; 1,1]; 
    val = [6,5,4,3,2,1,0,7]; 
    
    chain_code=[];       
    current_pos=[x_1 y_1]; 
    d = 0;       
    final_pos = [-1 -1];
    final_d = -1;
    while (final_pos(1)~= x_1 || final_pos(2)~= y_1 || final_d==0)
        new_pos = current_pos + dire(d+1,:);
        i = new_pos(1);
        j = new_pos(2);
        if im1(i,j)
            chain_code=[chain_code,val(d+1)];
            current_pos=new_pos;
            final_pos = current_pos;
            d=mod(d+2,8);
            final_d = d;
        else
            d = mod(d-1,8); 
            final_d = d;
        end
    end
    score = sum(chain_code(:));
end
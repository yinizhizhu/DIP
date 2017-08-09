%% g = imadjust(f, [low_in high_in], [low_out high_out], gramma)
%  both input and output range from 0 to 1
%   uint8 - each pixel of output multi 255
%   uint16 - each pixel of output multi 65535
subplot(2, 3, 1);
%% mat2gray limit the range with [0 , 1]
%   im2uint8 limit the range with [0, 255]
f = mat2gray(imread('hit.jpg'));
tmp = (im2uint8(f) - imread('hit.jpg'));
fprintf('%f\n', max(max(tmp)));
imshow(f);
subplot(2, 3, 2);
g1 = imadjust(f, [0 1], [1 0]);
imshow(g1);
subplot(2, 3, 3);
%% gramma < 1, 映射被加权到更高（更亮）的输出值
g2 = imadjust(f, [0 1], [1 0], 0.3);
imshow(g2);
subplot(2, 3, 4);
g3 = imadjust(f, [0 1], [1 0], 1);
imshow(g3);
subplot(2, 3, 5);
%% gramma < 1, 映射被加权到更低（更暗）的输出值
g4 = imadjust(f, [0 1], [1 0], 2);
imshow(g4);
subplot(2, 3, 6);
g5 = imcomplement(f);
imshow(g5);

% subplot(1, 2, 1);
% imshow(f);
% g = im2uint8(mat2gray(log(1+double(f))));
% subplot(1,2,2);
% imshow(g);
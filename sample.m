close all; clear all; clc;
im = imread('/home/banerji/Desktop/low-contrast.jpg');
im = rgb2gray(im);
% im = im(300:400,300:400);
figure, imshow(im);
% neg = 255-im;
% figure, imshow(neg);
min(min(im))
max(max(im))

%% Contrast stretching
im = double(im);
im = im - min(min(im));
im = im / max(max(im));
im = im * 255;
im = uint8(im);
figure, imshow(im);

%% Thresholding
v = graythresh(im);
bw = im2bw(im, v);
figure, imshow(bw);
bw = im2bw(im, 0.8);
figure, imshow(bw);

%% Gray level slicing
im2 = imresize(im, 4);
tic
% for row= 1: size(im2,1)
%     for col = 1:size(im2, 2)
%         if(im2(row, col)>=80 && im2(row, col)<=120)
%             im2(row, col) = 2 * im2(row, col);
%         end
%     end
% end
m = (im2>=80) .* (im2<=120);
m = m + (1-m)*0.5;
im2 = im2 .* uint8(m*2);
toc
figure, imshow(im2);

%% Bit plane slicing
% planes = zeros(size(im,1), size(im, 2), 8);
% bin = dec2bin(im);
% 
% for p = 1:8
%     temp = bin(:,p);
%     temp = str2num(temp);
%     planes(:,:,p) = reshape(temp, size(im));
% end
% A = figure;
% for x = 1:8
%     subplot(2, 4, x);
%     imshow(planes(:,:,x));
% end
 %% Filtering
 
 lowpass = (1/9) * [1 1 1; 1 1 1; 1 1 1];
 highpass = (1/9) * [-1 -1 -1; -1 45 -1; -1 -1 -1];
 
im1 = filter2(lowpass,im);
 figure, imshow(stretchContrast(im1));
 im2 = filter2(highpass,im);
 figure, imshow(stretchContrast(im2));
 e1 = edge(im, 'canny');
 e2 = edge(im1, 'canny');
 e3 = edge(im2, 'canny');
 
 figure;
 subplot(1,3,1);
 imshow(e1);
 subplot(1,3,2);
 imshow(e2);
 subplot(1,3,3);
 imshow(e3);
 

close all; clear all; clc;
im = imread('C:\Users\Binam B\Desktop\lena_256.bmp');
%% Resolution Decrease
small1=imresize(im, 0.5);
small2=imresize(small1,0.5);
figure, imshow(im);
figure, imshow(small1);
figure, imshow(small2)

%% Rescaling
scale1=imresize(small1,2);
scale2=imresize(small2,4);
figure, imshow(im);
figure, imshow(scale1);
figure, imshow(scale2);

%% 4-level Quantization
gr0=grayslice(im,4);
figure, imshow(gr0*64);

%% Negative
neg=imcomplement(im);
figure, imshow(neg);

%% histogram
div=imdivide(im,4);
eq=histeq(div);
figure;
 subplot(1,2,1);
 imshow(div);
 subplot(1,2,2);
 imhist(div);
figure;
 subplot(1,2,1);
 imshow(eq);
 subplot(1,2,2);
 imhist(eq);
 
%% Edge      
e1 = edge(im, 'roberts');
e2 = edge(im, 'sobel');
e3 = edge(im, 'prewitt');
 
figure;
 subplot(1,3,1);
 imshow(e1);
 subplot(1,3,2);
 imshow(e2);
 subplot(1,3,3);
 imshow(e3);

%% Rotation
r1=imrotate(im, 60,'bilinear');
r2=imrotate(im,60,'nearest');
r3=imrotate(im,60,'bicubic');
figure, imshow(r1);
figure, imshow(r2);
figure, imshow(r3);
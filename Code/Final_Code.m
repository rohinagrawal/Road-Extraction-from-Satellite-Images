warning off
clear
clc

img = imread('orignal.jpg');
im1 = imresize(img,2.734);
img = rgb2gray(im1);

%subplot(1,2,1),imshow(img)

imagen1 = medfilt2(img,'zeros');
imagen = im2bw(imagen1,0.56);
subplot(1,2,2),imshow(imagen)

se = strel('line',2,10);
im2 = imerode(imagen,se);
im3 = bwmorph(im2,'remove')
im4 = edge(im3,'sobel')
im5 = imfuse(im4,im1,'blend')
subplot(1,2,2),imshow(im5)
imshow(im4);

% Measure signal-to-noise ratio
im=im4;
im=double(im(:));
ima=max(im(:));
imi=min(im(:));
mse=std(im(:));
snr=20*log10((ima-imi)./mse)

fprintf('\n The SNR value is %0.4f \n', snr);
fprintf('\n The MSE value is %0.4f \n', mse);

%disp('Signal to Noise Ratio = ');
%disp(SNR);
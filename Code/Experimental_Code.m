warning off
clear
clc

img = imread('orignal.jpg');
im1 = imresize(img,2.734);
img0 = rgb2gray(im1);
imagen2 = filter2(fspecial('average',3),img0)/255;
%imagen4 = filter2(fspecial('prewitt'),imagen1);
%imagen2 = medfilt2(imagen1,'zeros');
imagen = im2bw(imagen2,0.8);
%subplot(1,2,2),imshow(imagen)
se = strel('line',2,10);
im2 = imerode(imagen,se);
im3 = bwmorph(im2,'remove')
im4 = edge(im3,'sobel')
imagen1 = filter2(fspecial('unsharp',1),im4);
imagen3 = filter2(fspecial('gaussian',99,0.00000000000000000001),imagen1);
%im5 = imfuse(im4,im1,'blend')
%subplot(1,2,2),imshow(im5)
imshow(imagen3);
% Measure signal-to-noise ratio
im=imagen3;
im=double(im(:));
ima=max(im(:));
imi=min(im(:));
mse=std(im(:));
snr=20*log10((ima-imi)./mse)

fprintf('\n The SNR value is %0.4f \n', snr);
fprintf('\n The MSE value is %0.4f \n', mse);
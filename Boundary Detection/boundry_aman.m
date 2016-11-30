clc;
close all;
clear;
figure;

Background=imread('background.jpg');
%Read Current Frame
CurrentFrame=imread('original.jpg');
%Display Background and Foreground

subplot(1,2,1);
imshow(Background);
title('BackGround');
subplot(1,2,2);
imshow(CurrentFrame);
title('Current Frame');

figure;
%Convert RGB 2 HSV
[Background_hsv]=rgb2hsv(Background);
subplot(2,2,1);
imshow(Background_hsv);
title('HSV of background');

[Background_hsv]=round(Background_hsv);
subplot(2,2,2);
imshow(Background_hsv);
title('HSV of background rounded');

[CurrentFrame_hsv]=rgb2hsv(CurrentFrame);
subplot(2,2,3);
imshow(CurrentFrame_hsv);
title('HSV of current frame');

[CurrentFrame_hsv]=round(CurrentFrame_hsv);
subplot(2,2,4);
imshow(CurrentFrame_hsv);
title('HSV of current frame rounded');


%rounding off step to convert all decimal valued pixels to integers
ni=round(Background)-round(CurrentFrame);

figure;
subplot(1,2,1);
imshow(ni);
title('subtracting background from current frame');
%converting rounded RGB to grayscale
ni=rgb2gray(ni);
subplot(1,2,2);
imshow(ni);
title('Converted to grayscale');

%initialize BW image
[rows columns]=size(ni);

%global thresholding to convert it from gray scale to black and white 
I = ni;
T = mean(I(:));

threshhold_global=11.3896;

while 1
    It = im2bw(I,T/255);
    group1 = find(It == 1);
    group2 = find(It == 0);
    m1 = mean(mean(I(group1)));
    m2 = mean(mean(I(group2)));
    T1 = 0.5*(m1 + m2);
    T - T1
    if (T - T1 < 0.000001)
        break
    end
    T = T1;
end

T

%thresholding by otsu's method
[level eff] = graythresh(I);
level*255
eff



%Convert to Binary Image
for i=1:rows
for j=1:columns
if ni(i,j) >threshhold_global
BinaryImage1(i,j)=1;
else
BinaryImage1(i,j)=0;
end
end
end

figure;
subplot(2,2,1);
imhist(ni);
title('histogram of grayscaled image');


subplot(2,2,2);
imshow(BinaryImage1);
title('image using global threshhold');



%Convert to Binary Image using otsu's
for i=1:rows
for j=1:columns
if ni(i,j) >level*255  
BinaryImage(i,j)=1;
else
BinaryImage(i,j)=0;
end
end
end


subplot(2,2,3);
imshow(BinaryImage);
title('image using otsu threshhold');

figure;
subplot(1,2,1);
imshow(BinaryImage);
title('Binary image');


bw = bwareaopen(BinaryImage,20);
a=edge(bw,'sobel',.1);
subplot(1,2,2);
imshow(bw);
title('After removing noise');

figure;
subplot(1,2,1);
imshow(a);
title('Edge detected');



cc = bwconncomp(bw,26);
%cc = 

%    Connectivity: 26
  %     ImageSize: [143 177]
 %     NumObjects: 8
  %  PixelIdxList: {1x8 cell}

    
number  = cc.NumObjects;
title(strcat('Number of persons detected : ',num2str(number)));




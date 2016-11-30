clc;
close all;
clear;
figure;
cdata = imread('try1.jpeg');
subplot(2,1,1),imshow(cdata),title('Original');
hsvImage = rgb2hsv(cdata);         %# Convert the image to HSV space
hPlane = 360.*hsvImage(:,:,1);     %# Get the hue plane scaled from 0 to 360
sPlane = hsvImage(:,:,2);          %# Get the saturation plane

nonRedIndex = ((hPlane > 340) | (hPlane < 255 )); %# Select non red pixels
nonGreenIndex= ((hPlane < 70) | (hPlane>160)) ;  %# Select non green pixels
nonRedIndex=nonRedIndex & nonGreenIndex;
      
sPlane(nonRedIndex)=0;
hsvImage(:,:,2) = sPlane;  

rgbImage = hsv2rgb(hsvImage);      %# Convert the image back to RGB space
subplot(2,1,2),imshow(rgbImage),title('Red and Green color popped');
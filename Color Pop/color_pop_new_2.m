clc;
close all;
clear;
figure
%#for red
cdata = imread('a4.jpg');
subplot(2,4,1),imshow(cdata),title('Original Image');
hsvImage = rgb2hsv(cdata);         %# Convert the image to HSV space
hPlane = 360.*hsvImage(:,:,1);     %# Get the hue plane scaled from 0 to 360
sPlane = hsvImage(:,:,2);          %# Get the saturation plane
nonRedIndex = (hPlane > 15) & ...  %# Select "non-red" pixels
              (hPlane < 330);
subplot(2,4,2),imhist(hsvImage(:,:,2));
sPlane(nonRedIndex) = 0;           %# Set the selected pixel saturations to 0
hsvImage(:,:,2) = sPlane;          %# Update the saturation plane
rgbImage = hsv2rgb(hsvImage);      %# Convert the image back to RGB space
subplot(2,4,3),imshow(rgbImage),title('Red color popped');
subplot(2,4,4),imhist(hsvImage(:,:,2));
imhist(hsvImage(:,:,2));

%#for green
cdata = imread('a4.jpg');
subplot(2,4,5),imshow(cdata),title('Original Image');
hsvImage = rgb2hsv(cdata);         %# Convert the image to HSV space
hPlane = 360.*hsvImage(:,:,1);     %# Get the hue plane scaled from 0 to 360
sPlane = hsvImage(:,:,2);           %# Get the saturation plane
subplot(2,4,6),imhist(hsvImage(:,:,2));
nonGreenIndex = (hPlane > 145) | ...  %# Select "non-green" pixels
              (hPlane < 60);
sPlane(nonGreenIndex) = 0;         %# Set the selected pixel saturations to 0
hsvImage(:,:,2) = sPlane;          %# Update the saturation plane
rgbImage = hsv2rgb(hsvImage);      %# Convert the image back to RGB space
subplot(2,4,7),imshow(rgbImage),title('Green color popped');
subplot(2,4,8),imhist(hsvImage(:,:,2));

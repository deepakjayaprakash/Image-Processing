clc;
close all;
clear;
figure
%#for red
cdata = imread('a5.jpg');
subplot(2,2,1),imshow(cdata),title('Original Image');
hsvImage = rgb2hsv(cdata);         %# Convert the image to HSV space
hPlane = 360.*hsvImage(:,:,1);     %# Get the hue plane scaled from 0 to 360
sPlane = hsvImage(:,:,2);          %# Get the saturation plane
nonRedIndex = (hPlane > 15) & ...  %# Select "non-red" pixels
              (hPlane < 330);
sPlane(nonRedIndex) = 0;           %# Set the selected pixel saturations to 0
hsvImage(:,:,2) = sPlane;          %# Update the saturation plane
rgbImage = hsv2rgb(hsvImage);      %# Convert the image back to RGB space
subplot(2,2,2),imshow(rgbImage),title('Red color popped');

%#for green
cdata = imread('a5.jpg');
subplot(2,2,3),imshow(cdata),title('Original Image');;
hsvImage = rgb2hsv(cdata);         %# Convert the image to HSV space
hPlane = 360.*hsvImage(:,:,1);     %# Get the hue plane scaled from 0 to 360
sPlane = hsvImage(:,:,2);           %# Get the saturation plane
nonBlueIndex = (hPlane > 255) | ...  %# Select "non-blue" pixels
              (hPlane < 165);
sPlane(nonBlueIndex) = 0;            %# Set the selected pixel saturations to 0
hsvImage(:,:,2) = sPlane;          %# Update the saturation plane
rgbImage = hsv2rgb(hsvImage);      %# Convert the image back to RGB space
subplot(2,2,4),imshow(rgbImage),title('Blue color popped');

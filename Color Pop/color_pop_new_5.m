clc;
close all;
clear;
figure
%#for red
cdata = imread('pop_diff2.jpeg');
subplot(2,2,1),imshow(cdata),title('Original Image');
hsvImage = rgb2hsv(cdata);         %# Convert the image to HSV space
hPlane = 360.*hsvImage(:,:,1);     %# Get the hue plane scaled from 0 to 360

%# Plotting histogram for hue values
binEdges = 0:360;                 %# Edges of histogram bins
N = histc(hPlane(:),binEdges);    %# Bin the pixel hues from above
subplot(2,2,2),hBar = bar(binEdges(1:end-1),N(1:end-1),'histc');  %# Plot the histogram
set(hBar,'CData',1:360,...            %# Change the color of the bars using
         'CDataMapping','direct',...  %#   indexed color mapping (360 colors)
         'EdgeColor','none');         %#   and remove edge coloring
colormap(hsv(360));               %# Change to an HSV color map with 360 points
axis([0 360 0 max(N)]);           %# Change the axes limits
set(gca,'Color','k');             %# Change the axes background color
set(gcf,'Pos',[50 400 560 200]);  %# Change the figure size
xlabel('HSV hue (in degrees)');   %# Add an x label
ylabel('Bin counts');             %# Add a y label

sPlane = hsvImage(:,:,2);          %# Get the saturation plane
RedIndex = (hPlane >345) | ...      %# Select red pixels
              (hPlane <35);
hPlane(RedIndex)=hPlane(RedIndex)+30;   %# Increment the selected pixel hues by 25
hsvImage(:,:,1) = hPlane./360;          %# Update the hue plane in HSV by converting 0-360 values back to range 0-1.
rgbImage = hsv2rgb(hsvImage);      %# Convert the image back to RGB space
subplot(2,2,3),imshow(rgbImage),title('Transition of Red to Orange/Yellow color');

%# Histogram for changed color
binEdges = 0:360;                 %# Edges of histogram bins
N = histc(hPlane(:),binEdges);    %# Bin the pixel hues from above
subplot(2,2,4),hBar = bar(binEdges(1:end-1),N(1:end-1),'histc');  %# Plot the histogram
set(hBar,'CData',1:360,...            %# Change the color of the bars using
         'CDataMapping','direct',...  %#   indexed color mapping (360 colors)
         'EdgeColor','none');         %#   and remove edge coloring
colormap(hsv(360));               %# Change to an HSV color map with 360 points
axis([0 360 0 max(N)]);           %# Change the axes limits
set(gca,'Color','k');             %# Change the axes background color
set(gcf,'Pos',[50 400 560 200]);  %# Change the figure size
xlabel('HSV hue (in degrees)');   %# Add an x label
ylabel('Bin counts');             %# Add a y label

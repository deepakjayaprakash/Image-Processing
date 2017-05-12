# Boundary Detection and Color Pop

Surveillance systems for the maritime domain are becoming more and more important. The increasing threats coming from illegal smuggling, immigration, illegal fishing, oil spills, and, in some part of the world, piracy make the protection of coastal areas a necessary requirement. The use of **Background Subtraction (BS)** for detecting moving objects in the maritime domain is discussed. 

In our implementation, we intend to use the non-adaptive method, i.e., with a fixed number of video frames and try to subtract the two frames. We then apply thresholding methods to the resultant image to get a binary image with better object recognition.
We finally count the number of object/intruders that it has identified.

## Steps in Boundary Detection
- Read background and current image
- Convert both to HSV
- Round off both converted HSVs
- Subtract background from current frame
- Convert the resulting images to greyscale
- Apply thresholding methods
- Noise removal
- Count objects
- Edge detection

## Color Pop

Color pop has been one of the many interesting features present in Photoshop applications. Many approaches has been made contributing to this application. In this project we are developing an application which can highlight the particular set of color present in the image and also change it. However we have left out one of the implementation where two or more object having same color cannot be separated from each other where the application of boundary detection comes into the picture. 

## Steps in Color pop
- Convert RGB to HSV
- Round off both converted HSVs
- Select a particular color of range of colors
- Update the saturation values of non selected pixels to 0
- Update the saturation plane in HSV image
- Change the hue value of selected color
- Convert image back to RGB

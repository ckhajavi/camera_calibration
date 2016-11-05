function [] = epipolar_lines(I1, C1, I2, C2, I3, C3)

% Given some images with their corresponding calibration matrices, this
% function allows you to hand-pick a point in the first image and then
% computes and plots the epipolar lines in the rest of the images

F12 = fundamental_matrix(C1,C2);
F13 = fundamental_matrix(C1,C3);

fprintf('Select a point in the image \n');

% Get 2D coords
imshow(I1);
[p1,p2] = ginput(1);

% Epipolar line equation in image 2
%---------------------------------------------------------
l = F12*[p1 p2 1]';

m = -l(1)/l(2);      % Slope
n = -l(3)/l(2);      % Offset

% Plot epipolar line in image 2
figure
imshow(I2);
hold on
x = 0:size(I2,2);
y = m*x+n;
plot(x,y);

% Epipolar line equation in image 3
%---------------------------------------------------------
l = F13*[p1 p2 1]';

m = -l(1)/l(2);      % Slope
n = -l(3)/l(2);      % Offset

% Plot epipolar line in image 3
figure
imshow(I3);
hold on
x = 0:size(I3,2);
y = m*x+n;
plot(x,y);

end
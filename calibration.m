function [C] = calibration(im, P)

%Given an image and the 4D homogeneous coordinates of the points to use 
%for calibration, this function obtains the 2D corresponding points (3D 
%homogeneous coordinates) and solves a linear system to get the calibration
%matrix C

%The 2D coordinates of the points are identified by using 'ginput' function,
%which allows to click on the image and get the coordinates

n = size(P,1);      % Number of points

fprintf('Select the following %f points in the image: \n', n);
disp(P);
pause on;
pause(3);

% Get 2D coords
imshow(im);
[u,v] = ginput(n);

% Get matrices A, B of linear system Ax = B
A = zeros(2*n,12);
for i = 1:n
    A(2*i-1,:) = [-P(i,:), zeros(1,4), u(i).*P(i,:)];
    A(2*i,:) = [zeros(1,4), -P(i,:), v(i).*P(i,:)];
end
B = -A(:,12);          % B is 2n x 1
A = A(:,1:11);         % A is 2n x 11

% Solve linear system and reshape calibration matrix
X = linsolve(A,B);      % X is 11 x 1
C = reshape([X; 1], 4, 3)';

end
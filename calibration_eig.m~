function [C] = calibration_eig(im, P)

%Given an image and the 4D homogeneous coordinates of the points to use 
%for calibration, this function obtains the 2D corresponding points (3D 
%homogeneous coordinates) and solves a homogeneous linear system to get the calibration
%matrix C, by finding the eigenvectors with the smallest eigenvalues of
%transpose(A)*A.  The Homogeneous linear system is Am = 0.  Where we
%minimize Am.  

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

% Get matrices A of linear system Am = 0. A = 2nx12 m = 12x1
A = zeros(2*n,12);
for i = 1:n
    A(2*i-1,:) = [P(i,:), zeros(1,4),-u(i).*P(i,:)];
    A(2*i,:) = [zeros(1,4), P(i,:), -v(i).*P(i,:)];
end

B = A'; %Find the transpose
[V,D] = eig(B*A);   %D is a diagonal matrix with eigen values.  V is matrix of eigenvectors

%disp(size(A))
eigVals = diag(D);  %vector of eigenvalues

[sorted_eigVals, index] = sort(eigVals);  %sort eigenvalues with respected old index


disp(size(index))
disp(size(V))

eigenVector = V(:,index(1));

C = eigenVector
end
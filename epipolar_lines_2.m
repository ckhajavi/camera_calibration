function [P] = epipolar_lines_2(set, k)

% Given a cell array containing a set of images (first row) and their 
% corresponding calibration matrices (row 2), and given an integer 'k' 
% referencing one of these images, this function performs the
% following steps:
%     1 - Show image 'k' and allow user to click on a point
%     2 - Compute epipolar lines in the rest of images
%     3 - Plot each image with its epipolar line and allow user to
%     hand-pick corresponding points
%     4 - Reconstruct 3D point and return it

I = set{1,k};   % Image to pick the point from
C = set{2,k};

fprintf('Select a point in the image \n');
pause on;
pause(2);

% Get 2D coords
imshow(I);
[p1,p2] = ginput(1);
set{3,k} = [p1,p2];     % Save point in the set

% Epipolar Lines
for i = 1:size(set,2)
    if i~=k
        F = fundamental_matrix(C,set{2,i});
        l = F*[p1 p2 1]';    % Epipolar line in image 'i'
        m = -l(1)/l(2);      % Slope
        n = -l(3)/l(2);      % Offset
        
        figure
        imshow(set{1,i});
        hold on
        x = 0:size(set{1,i},2);
        y = m*x+n;
        plot(x,y);           % Plot epipolar line
        
        [a,b] = ginput(1);   % Select corresponding point over the epip. line
        set{3,i} = [a,b];
    end
end

% 3D Depth Estimation
A = zeros(2*size(set,2),4);     % 2 equations for each 2D point
for i = 1:size(set,2)
    C = set{2,i};
    u = set{3,i}(1);
    v = set{3,i}(2);
    A(2*i-1,:) = [u*C(3,1)-C(1,1), u*C(3,2)-C(1,2), u*C(3,3)-C(1,3), u*C(3,4)-C(1,4)];
    A(2*i,:) = [v*C(3,1)-C(2,1), v*C(3,2)-C(2,2), v*C(3,3)-C(2,3), v*C(3,4)-C(2,4)];
end
B = -A(:,4);
A = A(:,1:3);

P = linsolve(A,B);      % Solve linear system to get P

end
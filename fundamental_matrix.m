function [F] = fundamental_matrix(C1, C2)

% Given 2 camera calibration matrices C1 and C2, this function uses 15
% 3D-points to compute the corresponding fundamental matrix 

% Approach 1 (only valid for calibrated stereo rig?)
% F = vec_to_mat(C2(:,4))*C2(:,1:3)*inv(C1(1:3,1:3));

% Approach 2 (Estimation with 'n' points)
points = [0 0 0 1; 100 0 0 1; 0 100 0 1; 0 0 100 1; 100 100 0 1; 100 0 100 1; 0 100 100 1; 100 100 100 1;
          200 0 0 1; 0 200 0 1; 0 0 200 1; 200 200 0 1; 200 0 200 1; 0 200 200 1; 200 200 200 1];
n = size(points, 1);    % Number of points
A = zeros(n,8);
for i = 1:n
    p1 = C1*points(i,:)';
    p1 = p1/p1(3);      % Normalize
    p2 = C2*points(i,:)';
    p2 = p2/p2(3);      % Normalize
    A(i,:) = [p2(1)*p1(1), p2(1)*p1(2), p2(1), p2(2)*p1(1), p2(2)*p1(2), p2(2), p1(1), p1(2)];
end
B = -ones(n,1);
X = linsolve(A,B);      % X is 8 x 1
F = reshape([X; 1], 3, 3)';

end

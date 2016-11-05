function [O,i,j,k] = camera_origin(C)

% Given a camera calibration matrix, this function finds the extrinsic
% parameters and outputs the real position and orientation of the camera

M = C(1:3,1:3);

% Find rotation R
[U,R] = rq(M);      % U is upper triangular and R is the rotation

% Find translation T
T = inv(M)*C(:,4);      % 3x1 vector (Tx, Ty, Tz)

% Origin and orientation of camera
O = -T;
axes = inv(R);
i = axes(:,1);
j = axes(:,2);
k = axes(:,3);

end

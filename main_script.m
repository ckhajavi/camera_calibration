%% CS211A - Visual Computing - HW3

clear ; close all; clc

%% Part 0. 3D Points from calibration pattern

% P contains the 4D homogeneous coordinates of all points in the 
% order provided in the calibration pattern
P = zeros(36,4);
P(1,:) = [0 0 0 1];
P(2,:) = [64 0 0 1];
P(3,:) = [64 64 0 1];
P(4,:) = [0 64 0 1];
P(5,:) = [0 0 19 1];
P(6,:) = [64 0 19 1];
P(7,:) = [64 64 19 1];
P(8,:) = [0 64 19 1];
P(9,:) = [0 0 29 1];
P(10,:) = [64 0 29 1];
P(11,:) = [64 64 29 1];
P(12,:) = [0 64 29 1];
P(13,:) = [16 16 29 1];
P(14,:) = [48 16 29 1];
P(15,:) = [48 48 29 1];
P(16,:) = [16 48 29 1];
P(17,:) = [16 16 48 1];
P(18,:) = [48 16 48 1];
P(19,:) = [48 48 48 1];
P(20,:) = [16 48 48 1];
P(21,:) = [0 48 29 1];
P(22,:) = [32 48 29 1];
P(23,:) = [32 80 29 1];
P(24,:) = [0 80 29 1];
P(25,:) = [0 48 48 1];
P(26,:) = [32 48 48 1];
P(27,:) = [32 80 48 1];
P(28,:) = [0 80 48 1];
P(29,:) = [0 48 48 1];
P(30,:) = [32 48 48 1];
P(31,:) = [32 80 48 1];
P(32,:) = [0 80 48 1];
P(33,:) = [0 48 67 1];
P(34,:) = [32 48 67 1];
P(35,:) = [32 80 67 1];
P(36,:) = [0 80 67 1];


%% Part 1. Camera Calibration Matrix


% Set 1
I1 = imread('Images/DSCF4179.jpg');
C1 = calibration(I1, P([1,2,3,9,10,11,17,18,19,33,34,35],:));

I2 = imread('Images/DSCF4181.jpg');
C2 = calibration(I2, P([1,2,4,9,10,12,17,18,20,21,24,25,28,33,36],:));

%pick my set2
I1 = imread('data/DSCF4177.jpg');
C1 = calibration(I1, P([1:3 9:11 17:19 33:35], :));

I2 = imread('data/DSCF4184.jpg');
C2 = calibration(I2, P([3:4 7:8 23 24 27 28 35 36], :));

I3 = imread('data/DSCF4186.jpg');
C3 = calibration(I3, P([4 8 22 23 24 26 27 28 34 35 36], :));

I4 = imread('data/DSCF4188.jpg');
C4 = calibration(I4, P([2 6 10 14 18 26 27 28 34 35 36], :));

I5 = imread('data/DSCF4193.jpg');
C5 = calibration(I5, P([2 3 6 7 10 11 18 19 34 35], :));

I6 = imread('data/DSCF4199.jpg');
C6 = calibration(I6, P([1 2 5 6 9:11 17:19 33:35], :));

I3 = imread('Images/DSCF4183.jpg');
C3 = calibration(I3, P([1,3,4,5,7,8,21,23,24,25,27,28,33,35,36],:));

I4 = imread('Images/DSCF4187.jpg');
C4 = calibration(I4, P([18,19,24,26,27,28,34,35,36],:));

I5 = imread('Images/DSCF4191.jpg');
C5 = calibration(I5, P([2,3,6,7,10,11,18,19,23,24,27,28,34,35],:));

I6 = imread('Images/DSCF4195.jpg');
C6 = calibration(I6, P([1,2,3,9,10,11,17,18,19,33,34,35],:));

set1 = {I1, I2, I3, I4, I5, I6; C1, C2, C3, C4, C5, C6};

%% Part 2. Epipolar Lines

% Run 150 times with each set
P = epipolar_lines_2(set1, 1);


% Position and orientation of each camera
[O,i,j,k] = camera_origin(C2);


% Run 150 times with each set
horse = epipolar_lines_2(set2, 1);
for i = 1:2
    close all;
    j = randi(6);
    horse_again = [horse_again epipolar_lines_2(set2, j)];
    save('horse_again.mat', 'horse_again');
end

% Position and orientation of each camera


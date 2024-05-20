%%  Setup script
clear
close all
clc

%%  Load data and set variables
load('small.mat', 'ST');     % Start time

load('small.mat', 'J');      % Total amount of jobs

load('small.mat', 'M');      % Total amount of machines

load('small.mat', 'PT');     % Time for each job

[n, m] = size(ST);

jobs_left = ones(1, J);

z_star = 9999;

X = cell(1, M);
solution = cell(1, M);

for i = 1:M
    X{i} = zeros(n, m);
    solution{i} = zeros(n, m);
end

disp("  >> Data loaded sucessfully")

%%  Generate initial state

jobs_per_machine = floor((J)/M);

for i = 1:M-1
    [X{i}, jobs_left] = generate_state(n, m, jobs_per_machine, jobs_left);
end

[X{M}, jobs_left] = generate_state(n, m, ceil(J-(M-1)*jobs_per_machine), jobs_left);


if (sum(jobs_left) == 0 && check_legality(X, M, J))
    disp("  >> Start state generated sucessfully")
else
    disp("  >> ERROR, all jobs not done");
end

%%  TEST
% Create a 9x9 matrix of zeros
matrix = zeros(6, 6);

% Specify the positions where ones should be placed
positions = {[6, 1], [1, 2], [2, 3], [3,4], [4,5]};

% Set ones at the specified positions
for i = 1:length(positions)
    position = positions{i};
    matrix(position(1), position(2)) = 1;
end

% Display the resulting matrix
disp(matrix);
a = neighborhood(6, 6, matrix)

%%  Start optimize

%X_nex = neigbour(X)  % Find close X 
z_new = zeros(M, 1);

for i  = 1:M
    z_new(i) = custom_evaluate(X{i}, ST, PT', J);
end


if ( max(z_new) < z_star )
    for i = 1:M
        solution{i} = X{i};
    end
    z_star = max(z_new);
end


if (false)
    disp("  >>  Display of solution for each machine")
    for i = 1:M
        disp("  >>  Machine " + i + ", totalt antal jobb = " + sum(X{i}, 'all'))
        disp(X{i})
    end
    disp("  >>  Objective function value: z_star = " + z_star)
end

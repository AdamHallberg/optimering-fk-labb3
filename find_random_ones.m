function [pos1, pos2] = find_random_ones(X)
    % Get the size of the matrix
    [rows, cols] = size(X);
    
    % Find indices of all ones in the matrix
    [one_rows, one_cols] = find(X == 1);
    
    % Check if there are at least two ones in the matrix
    if numel(one_rows) < 2
        error('Matrix must contain at least two ones.');
    end
    
    idx = randperm(numel(one_rows), 2); % Ta vå random index med 1or
    
    pos1 = [one_rows(idx(1)), one_cols(idx(1))];
    pos2 = [one_rows(idx(2)), one_cols(idx(2))];
end
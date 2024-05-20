function [X, jobs_left] = generate_state(n, m, J, jobs_left)
    %  n, m gives dim of X
    %  J = amount of jobs
    %  jobs_left = availability of jobs in each column
    X = zeros(n, m);

    % Get a list of all possible positions
    positions = randperm(n * (m-1));
    
    % Track the rows and columns that already have 1's
    row_has_one = false(1, n);
    col_has_one = false(1, m);
    ones_placed = 0;
    
    previous_job = 0;
    
    % lägg en etta i botten 
    bottom_row = n;
    
    if (~row_has_one(bottom_row))
        for col = randperm(length(jobs_left))
            if (ones_placed < J)
                if (~col_has_one(col) && col ~= m && jobs_left(col) == 1)
                    X(bottom_row, col) = 1;
                    ones_placed = ones_placed + 1;
                    row_has_one(bottom_row) = true;
                    col_has_one(col) = true;
                    jobs_left(col) = 0;
                    previous_job = col;
                    break; % avbryt efter att en 1a placerats
                end
            end
        end
    end

    % placera ut resterande jobb
    while (ones_placed < J)
        for idx = 1:length(positions)-1
            if (ones_placed < J)  % Fortsätt sålänge det finns job kvar
                % Convert the linear index to row and column indices
                [row, col] = ind2sub([n, m], positions(idx));
                
                if (~row_has_one(row) && ~col_has_one(col) && col ~= m && row ~= col && jobs_left(col) == 1 &&  row == previous_job)
                    if (col ~= n)
                        X(row, col) = 1;
                        ones_placed = ones_placed + 1;
                        row_has_one(row) = true;
                        col_has_one(col) = true;
                        jobs_left(col) = 0;
                        previous_job = col;
                    else
                        X(row, col) = 1;
                        row_has_one(row) = true;
                        col_has_one(col) = true;
                    end
   

                end
            end
        end
    end
end

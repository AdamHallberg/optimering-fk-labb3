function [X] = neighborhood(n, m, X)
    % X is cell matrix containint all Machines

    % find to jobs to swap order
    
    [pos1, pos2] = find_random_ones(X)
    


    %X( pos1(1), pos1(2) ) = X( pos1(1), pos2(2) );
    

    col_2 = 0;
    
    for j = 1:m
        if (X(pos2(2), j) == 1)
            col_2 = j;
        end
    end
    
    
    col_2

    % Modify matrix
    X(pos1(1), pos1(2)) = 0;
    X(pos2(1), pos2(2)) = 0;

    X(pos1(1), pos2(2)) = 1;
    X(pos2(2), pos1(2)) = 1;

    X( pos2(2), col_2 ) = 0;
    X( pos2(1), col_2 ) = 1;

end


function result = check_legality(X, M, J)
% Return if matrix have max 1 '1' for each row and column

    jobs_preformed = 0;
    
    for i = 1:M
        jobs_preformed = jobs_preformed + sum(X{i}, 'all');
    end

    if ( jobs_preformed == J ) 
        result = true;
    else
        result = false;
    end
end
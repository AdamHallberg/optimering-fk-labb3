function [z] = custom_evaluate(X, C, b, J)
    % X_i = choices for machine i
    % C = startup time
    % J = number of jobs
    % b = job times

    % Evaluate objective function
    b = b(:);
    b = [b; 0];
    e = ones(J + 1, 1);

    z =2*b'*X*e  + e'*(C.*X)*e;
end


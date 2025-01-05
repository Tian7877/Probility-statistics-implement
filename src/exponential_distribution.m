function exponential_distribution(m, lambda)
    % exponential_distribution.m
    % This function generates Exponential random samples and compares
    % them with MATLAB's built-in exprnd function. (compare define function with machine_learning toolbox)
    %
    % Inputs:
    %   m - Number of samples
    %   lambda - Rate parameter for the Exponential distribution

    % Custom Exponential Distribution
    x_exp_custom = - (1 / lambda) * log(1 - rand(m, 1));

    % Built-in Exponential Distribution (exprnd)
    x_exp_builtin = exprnd(1 / lambda, m, 1);

    % Calculate statistics for both distributions
    mu_exp_custom = mean(x_exp_custom);
    sigma_exp_custom = std(x_exp_custom);
    
    mu_exp_builtin = mean(x_exp_builtin);
    sigma_exp_builtin = std(x_exp_builtin);

    % Plot histograms for comparison
    figure;
    subplot(1, 2, 1);
    histogram(x_exp_custom, 100);
    title('Custom Exponential Distribution');
    xlabel('Value');
    ylabel('Frequency');
    
    subplot(1, 2, 2);
    histogram(x_exp_builtin, 100);
    title('Built-in Exponential Distribution (exprnd)');
    xlabel('Value');
    ylabel('Frequency');

    % Calculate frequencies for histogram bins
    [counts_custom, edges_custom] = histcounts(x_exp_custom, 100);
    [counts_builtin, edges_builtin] = histcounts(x_exp_builtin, 100);

    % Create comparison table
    Distribution = [repmat({'Custom'}, length(edges_custom)-1, 1); ...
                    repmat({'Built-in'}, length(edges_builtin)-1, 1)];
    Bin_Values = [edges_custom(1:end-1)'; edges_builtin(1:end-1)'];
    Frequency = [counts_custom'; counts_builtin'];

    results_table = table(Distribution, Bin_Values, Frequency);

    % Display the table in the Command Window
    disp(results_table);

    % Display statistical comparison in Command Window
    fprintf('\nExponential Distribution Comparison:\n');
    fprintf('Custom: Mean = %.2f, Std = %.2f\n', mu_exp_custom, sigma_exp_custom);
    fprintf('Built-in (exprnd): Mean = %.2f, Std = %.2f\n\n', mu_exp_builtin, sigma_exp_builtin);
end
%Run with exponential_distribution(100000, 1.5);  % 100,000 samples, lambda = 1.5
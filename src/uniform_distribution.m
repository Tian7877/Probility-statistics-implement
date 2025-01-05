function uniform_distribution(m, a, b)
    % uniform_distribution.m
    % This function generates Uniform random samples and compares
    % them with MATLAB's built-in unifrnd function. (compare with the task statics function and machine learnig toolbox)
    %
    % Inputs:
    %   m - Number of samples
    %   a - Lower bound of the Uniform distribution
    %   b - Upper bound of the Uniform distribution

    % Custom Uniform Distribution
    x_uniform_custom = a + (b - a) * rand(m, 1);

    % Built-in Uniform Distribution (unifrnd)
    x_uniform_builtin = unifrnd(a, b, m, 1);

    % Calculate statistics for both distributions
    mu_uniform_custom = mean(x_uniform_custom);
    sigma_uniform_custom = std(x_uniform_custom);
    
    mu_uniform_builtin = mean(x_uniform_builtin);
    sigma_uniform_builtin = std(x_uniform_builtin);

    % Plot histograms for comparison
    figure;
    subplot(1, 2, 1);
    histogram(x_uniform_custom, 100);
    title('Custom Uniform Distribution');
    xlabel('Value');
    ylabel('Frequency');
    
    subplot(1, 2, 2);
    histogram(x_uniform_builtin, 100);
    title('Built-in Uniform Distribution (unifrnd)');
    xlabel('Value');
    ylabel('Frequency');

    % Calculate frequencies for histogram bins
    [counts_custom, edges_custom] = histcounts(x_uniform_custom, 100);
    [counts_builtin, edges_builtin] = histcounts(x_uniform_builtin, 100);

    % Create comparison table
    Distribution = [repmat({'Custom'}, length(edges_custom)-1, 1); ...
                    repmat({'Built-in'}, length(edges_builtin)-1, 1)];
    Bin_Values = [edges_custom(1:end-1)'; edges_builtin(1:end-1)'];
    Frequency = [counts_custom'; counts_builtin'];

    results_table = table(Distribution, Bin_Values, Frequency);

    % Display the table in the Command Window
    disp(results_table);

    % Display statistical comparison in Command Window
    fprintf('\nUniform Distribution Comparison:\n');
    fprintf('Custom: Mean = %.2f, Std = %.2f\n', mu_uniform_custom, sigma_uniform_custom);
    fprintf('Built-in (unifrnd): Mean = %.2f, Std = %.2f\n\n', mu_uniform_builtin, sigma_uniform_builtin);
end
% run with uniform_distribution(100000, 0, 10);  % 100,000 samples, a = 0, b = 10
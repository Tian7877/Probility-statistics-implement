
function gaussian_comparison(m, mu, sigma)
    % gaussian_comparison.m
    % Compare custom Gaussian function with normrnd (Statistics and Machine Learning Toolbox)
    % Inputs:
    %   m - Number of samples
    %   mu - Mean of the Gaussian distribution
    %   sigma - Standard deviation of the Gaussian distribution
    
    % Custom Gaussian Distribution
    x_gauss_custom = mu + (sigma * randn(m, 1));
    
    % Built-in Gaussian Distribution (normrnd)
    x_gauss_builtin = normrnd(mu, sigma, m, 1);
    
    % Calculate statistics for both distributions
    mu_gauss_custom = mean(x_gauss_custom);
    sigma_gauss_custom = std(x_gauss_custom);
    
    mu_gauss_builtin = mean(x_gauss_builtin);
    sigma_gauss_builtin = std(x_gauss_builtin);
    
    % Plot histograms for comparison
    figure;
    subplot(1, 2, 1);
    histogram(x_gauss_custom, 100);
    title('Custom Gaussian Distribution');
    xlabel('Value');
    ylabel('Frequency');
    
    subplot(1, 2, 2);
    histogram(x_gauss_builtin, 100);
    title('Built-in Gaussian Distribution (normrnd)');
    xlabel('Value');
    ylabel('Frequency');
    
    % Calculate frequencies for histogram bins
    [counts_custom, edges_custom] = histcounts(x_gauss_custom, 100);
    [counts_builtin, edges_builtin] = histcounts(x_gauss_builtin, 100);
    
    % Create comparison table
    Distribution = [repmat({'Custom'}, length(edges_custom)-1, 1); ...
                    repmat({'Built-in'}, length(edges_builtin)-1, 1)];
    Bin_Values = [edges_custom(1:end-1)'; edges_builtin(1:end-1)'];
    Frequency = [counts_custom'; counts_builtin'];
    
    results_table = table(Distribution, Bin_Values, Frequency);
    
    % Display the table in the Command Window
    disp(results_table);
    
    % Display statistical comparison in Command Window
    fprintf('\nGaussian Distribution Comparison:\n');
    fprintf('Custom: Mean = %.2f, Std = %.2f\n', mu_gauss_custom, sigma_gauss_custom);
    fprintf('Built-in (normrnd): Mean = %.2f, Std = %.2f\n\n', mu_gauss_builtin, sigma_gauss_builtin);
end

%Run with gaussian_comparison(100000, 5, 2);  % 100000 sampel, mu = 5, sigma = 2 at Terminal 

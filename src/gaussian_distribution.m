function gaussian_distribution(m, mu, sigma)
    % gaussian_distribution.m
    % This function generates Gaussian random samples and displays 
    % the histogram, calculated mean, variance, and standard deviation.
    %
    % Inputs:
    %   m - Number of samples
    %   mu - Mean of the Gaussian distribution
    %   sigma - Standard deviation of the Gaussian distribution
    
    % Generate Gaussian random samples
    x_gauss = mu + (sigma * randn(m,1));
    
    % Calculate statistics
    mu_gauss = mean(x_gauss);
    sigma_gauss = std(x_gauss);
    variance_gauss = var(x_gauss);
    
    % Plot histogram
    [counts, edges] = histcounts(x_gauss, 100);
    figure;
    histogram(x_gauss, 100);  % Modern histogram function
    title(['Histogram of Gaussian Distribution (\mu=', num2str(mu), ', \sigma=', num2str(sigma), ')']);
    xlabel('Value');
    ylabel('Frequency');
    
    % Create table of results
    Distribution = repmat({'Gaussian'}, length(edges)-1, 1);
    Bin_Values = edges(1:end-1)';
    Frequency = counts';
    
    results_table = table(Distribution, Bin_Values, Frequency);
    
    % Display table
    disp(results_table);
    
    % Display statistics in command window
    fprintf('Gaussian Distribution:\n');
    fprintf('Estimated Mean (mu): %.2f\n', mu_gauss);
    fprintf('Estimated Variance: %.2f\n', variance_gauss);
    fprintf('Estimated Std (sigma): %.2f\n\n', sigma_gauss);
end
%run with gaussian_distribution(100000, 5, 2);  % 100,000 samples, mu = 5, sigma = 2
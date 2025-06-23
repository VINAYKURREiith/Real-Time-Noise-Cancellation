%% function of Adaptive filter filter along with feed back and buffer input converstion
function [output, V_cap] = Adaptive_filter(noisy_speech, external_noise)
    N = length(noisy_speech); % length of noisy_speech
    filter_order = 3;       % order of the filter
    eta = 0.0005;    
    epsilon = 1e-4;
    x_but = zeros(filter_order,1); % buffer input x(n)
    H = zeros(filter_order,1); %adaptive file h(n)
    V_cap = zeros(N,1); % estimated error
    e = zeros(N,1); % error signal
    H_mat = zeros(filter_order, N); % adaptive filter matrix
    K = 0.5; 
    H_prev = zeros(filter_order, 1);  % pervious value of adaptive filter
    for i = 1:20
        for n = 1:N
            x_but = [x_but(2:filter_order); external_noise(n)]; % funtion for buffer input x(n)
            V_cap(n) = H' * x_but; % estimating error
            e(n) = noisy_speech(n) - V_cap(n); %  error output
            H = H + eta  * e(n)*x_but / (epsilon + (norm(x_but)^2)) + K * H_prev; % feed back for adapative filter
            H_prev = eta  * e(n)*x_but / (epsilon + (norm(x_but)^2)) + K * H_prev; % storing h(n) for further usage  
            H_mat(:, n) = H; % storing H(n)
        end
    end
    output = e; % assigin of out put signal
end

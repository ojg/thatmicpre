function [R_real, gains_real_db, err_db] = micpre_gain2res(gains_db, part, res_series)
%[R_real, gains_real_db, err_db] = micpre_gain2res(gains_db, part, res_series)
%
%   Parameters:
%   gains_db : vector of desired gain in dB
%   part: one of the following strings: 
%       'that1510', 'that1512', 'ssm2019', 'ina217', 'ina163', 'ina103'
%   res_series: optionally specify a standard resistor series to use:
%       'e12', 'e24, 'e48', 'e96'
%
%   Returns:
%   R_real: Resistor values to use in ladder
%   gains_real_db: Actual gain values
%   err_db: Gain error using actual resistors
%
%   OJG 2020


e96 = [1.00, 1.02, 1.05, 1.07, 1.10, 1.13, 1.15, 1.18, 1.21, 1.24, 1.27, 1.30, 1.33, 1.37, 1.40, 1.43, 1.47, 1.50, 1.54, 1.58, 1.62, 1.65, 1.69, 1.74, 1.78, 1.82, 1.87, 1.91, 1.96, 2.00, 2.05, 2.10, 2.15, 2.21, 2.26, 2.32, 2.37, 2.43, 2.49, 2.55, 2.61, 2.67, 2.74, 2.80, 2.87, 2.94, 3.01, 3.09, 3.16, 3.24, 3.32, 3.40, 3.48, 3.57, 3.65, 3.74, 3.83, 3.92, 4.02, 4.12, 4.22, 4.32, 4.42, 4.53, 4.64, 4.75, 4.87, 4.99, 5.11, 5.23, 5.36, 5.49, 5.62, 5.76, 5.90, 6.04, 6.19, 6.34, 6.49, 6.65, 6.81, 6.98, 7.15, 7.32, 7.50, 7.68, 7.87, 8.06, 8.25, 8.45, 8.66, 8.87, 9.09, 9.31, 9.53, 9.76];
e24 = [1.0, 1.1, 1.2, 1.3, 1.5, 1.6, 1.8, 2.0, 2.2, 2.4, 2.7, 3.0, 3.3, 3.6, 3.9, 4.3, 4.7, 5.1, 5.6, 6.2, 6.8, 7.5, 8.2, 9.1];

if strcmpi(res_series, 'e48')
    res_avail = e96(1:2:end);
elseif strcmpi(res_series, 'e24')
    res_avail = e24;
elseif strcmpi(res_series, 'e12')
    res_avail = e24(1:2:end);
else
    warning('res_series not specified, using E96')
    res_avail = e96;
end

res_avail = sort(kron(res_avail, 10.^(0:5)));

if strcmpi(part, 'that1510') || strcmpi(part, 'ssm2019') || strcmpi(part, 'ina217')
    R2G = @R2G_10k;
    G2R = @G2R_10k;
elseif strcmpi(part, 'ina163') || strcmpi(part, 'ina103')
    R2G = @R2G_6k;
    G2R = @G2R_6k;
elseif strcmpi(part, 'that1512')
    R2G = @R2G_that1512;
    G2R = @G2R_that1512;
else
    error('Unknown part');
end


gains_db = sort(gains_db, 'descend');

gains_lin = 10.^(gains_db / 20);

Rsum_ideal = G2R(gains_lin);

R_real=zeros(1,length(gains_lin));
for i = 1:length(gains_lin)
    R_diff = Rsum_ideal(i) - sum(R_real);
    R_real(i) = interp1(res_avail, res_avail, R_diff, 'nearest');
    if isnan(R_real(i))
        R_real(i) = Inf;
    end
end

Rsum_real = cumsum(R_real);

gains_real_db = 20*log10(R2G(Rsum_real));
err_db = gains_db - gains_real_db;

end

function G = R2G_10k(R)
    G = 1 + 10000 ./ R;
end

function R = G2R_10k(G)
    R = 10000 ./ (G - 1);
end

function G = R2G_6k(R)
    G = 1 + 6000 ./ R;
end

function R = G2R_6k(G)
    R = 6000 ./ (G - 1);
end

function G = R2G_that1512(R)
    G = 0.5 + 5000 ./ R;
end

function R = G2R_that1512(G)
    R = 5000 ./ (G - 0.5);
end

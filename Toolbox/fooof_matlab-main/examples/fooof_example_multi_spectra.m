%% FOOOF Matlab Wrapper Example - Multiple PSDs
%
% This example computes example power spectra models on a group of
% power spectra, and prints out the results.
%
pyversion('E:\Anaconda3-202\envs\python37\python.exe');
%% Run Example

% Load data
load('C:\Users\Administrator\Downloads\fooof_matlab-main\fooof_matlab-main\examples\data/ch_dat_one.mat');
load('C:\Users\Administrator\Downloads\fooof_matlab-main\fooof_matlab-main\examples\data/ch_dat_two.mat');

% Combine into a multi-channel data matrix
chs_dat = [ch_dat_one; ch_dat_two]';

% Calculate power spectra with Welch's method
[psds, freqs] = pwelch(chs_dat, 500, [], [], s_rate);

% Transpose, to make inputs row vectors
freqs = freqs';

% FOOOF settings
settings = struct();
f_range = [1, 30];

% Run FOOOF across a group of power spectra
fooof_results = fooof_group(freqs, psds, f_range, settings);

% Check out the FOOOF Results
fooof_results
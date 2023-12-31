%% FOOOF Matlab Wrapper Example - Multiple PSDs for Lemon dataset
%%%%%%%%%%%%%%%%%% 2023/07/16
% This example computes example power spectra models on a group of
% power spectra, and prints out the results.
% Notice: You should add the toolbox('fooof_matlab-main') in your matlab addpath

clc;
clear all;
close all;
Fs=250;
FreqRange=[2,40];
frequency_band= [2,40];
filter_order = 128;
File=':\Leipzig\Analyze\DATA\Step00\';
Sub_File=dir([File,'*.mat']);
pyversion(':\Anaconda3-202\envs\python37\python.exe'); % Here, you could set the path of 'python.exe' in theAnaconda enviroment file.You should notice that you have a Python >= 3.6, and numpy and scipy(>=0.19) in Anaconda enviroment.
%% Load data
for Sub=1:length(Sub_File)
    Sub_name=Sub_File(Sub,1).name;
    load([File,Sub_name]);
    data_for=Sub_data.EEG_EC.data;
    Data_Filt = data_for; %eegfilt(data_for,Fs,frequency_band(1),frequency_band(2),0,filter_order);
    %% Run Toolbox
    % change a multi-channel data matrix
    chs_dat = Data_Filt';
    
    % Calculate power spectra with Welch's method
    [psds, freqs] = pwelch(chs_dat, 500, [], Fs, Fs); % for here, you could see the psd and freqs result of lemon data
    
    % Transpose, to make inputs row vectors
    freqs = freqs';
    
    % FOOOF settings
    settings = struct();
    f_range = [2, 40];
    

    % Run FOOOF across a group of power spectra
    fooof_results = fooof_group(freqs, psds, f_range, settings);

    
    Sub_data.FOOOF=fooof_results;
    SavePath=[':\Leipzig\Analyze\DATA\Step01\'];
    if isdir(SavePath)==0
        mkdir(SavePath);
    end
    save([SavePath,Sub_name(1:end-4),'.mat'],'Sub_data');
    clearvars -except Sub Sub_File File filter_order frequency_band Fs
end

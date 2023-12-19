%% Plot the FOOOF analyze group aperodic component reconstruction
%%%%%%%%% 2023/12/10, Cz in No.13 channel

clc;
clear all;
close all;
Fs=250;
File=':\Leipzig\Analyze\DATA\Step00\';
Sub_File=dir([File,'*.mat']);
%% data_load
u=0;
v=0;
for Sub=1:length(Sub_File)
    Sub_name=Sub_File(Sub,1).name;
    load([File,Sub_name]);
    data_for=Sub_data.EEG_EC.data(13,:);
    
    % Calculate the Cz power spectrum with Welch's method
    [psd, freqs] = pwelch(data_for,500, [], Fs, Fs);
    % Transpose, to make inputs row vectors
    freqs = freqs';
    
    % FOOOF settings
    settings = struct();
    f_range = [2, 40];
    

    % Run FOOOF across a group of power spectra
    fooof_results = fooof(freqs, psd, f_range, settings, true);
    if strcmp(Sub_data.Base_information.Age,'20-25') || strcmp(Sub_data.Base_information.Age,'25-30') || strcmp(Sub_data.Base_information.Age,'30-35') || strcmp(Sub_data.Base_information.Age,'35-40')
        u=u+1;
        plot(fooof_results.freqs, fooof_results.ap_fit, 'Color', [83/255, 168/255, 225/255],'LineWidth',0.2);
        hold on
        a(u,:)=fooof_results.freqs;
        b(u,:)=fooof_results.ap_fit;
    else
        v=v+1;
        plot(fooof_results.freqs, fooof_results.ap_fit,'Color', [101/255, 210/255, 96/255],'LineWidth',0.2);
        hold on
        c(v,:)=fooof_results.freqs;
        d(v,:)=fooof_results.ap_fit;
    end
end
aa=mean(a,1); bb=mean(b,1);
cc=mean(c,1); dd=mean(d,1);
plot(aa, bb, 'b','LineWidth',4);
hold on
plot(cc, dd, 'Color', [101/255, 210/255, 96/255],'LineWidth',4);
hold on
xlim([2, 40]);
SavePath=[':\Leipzig\Analyze\DATA\Step03\']
if isdir(SavePath)==0
    mkdir(SavePath);
end
% saveas(gcf, [SavePath,'Cz_group_AP.jpg']);
% ÉèÖÃ·Ö±æÂÊÎª900 DPI
resolution = 900;
format='jpeg'
print(gcf, ['-d' format], 'Cz_group_AP.jpg', ['-r' num2str(resolution)]);

% ±£´æÍ¼ÐÎ
saveas(gcf, [SavePath,'Cz_group_AP.jpg']);

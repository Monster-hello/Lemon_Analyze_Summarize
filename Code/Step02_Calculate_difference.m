%% Analyze the 1/f with age different
%%%%%%%%%%%%%%% 2023/07/27

clc;
clear all;
close all;
Fs=250;
File=':\Leipzig\Analyze\DATA\Step01\';
Sub_File=dir([File,'*.mat']);
%% data_load
u=0;
v=0;
for Sub=1:length(Sub_File)
    Sub_name=Sub_File(Sub,1).name;
    load([File,Sub_name]);
    for channel = 1:length(Sub_data.FOOOF)
        K(channel,:)=Sub_data.FOOOF(channel).aperiodic_params;
        G(channel,:)=Sub_data.FOOOF(channel).peak_params(1,:);
    end
%     Sub_data.K=K;
%     Sub_data.G=G;
%     SavePath=['I:\Leipzig\Analyze\DATA\Step02\Individual_data\'];
%     if isdir(SavePath)==0
%         mkdir(SavePath);
%     end
%     save([SavePath,Sub_name(1:end-4),'.mat'],'Sub_data')
    a=mean(K,1);
    Sub_data.slope=a(1,1);
    Sub_data.offset=a(1,2);
    
    b=mean(G,1);
    Sub_data.CF=b(1,1);
    Sub_data.AP=b(1,2);
    Sub_data.BW=b(1,3);
    
    if strcmp(Sub_data.Base_information.Age,'20-25') || strcmp(Sub_data.Base_information.Age,'25-30') || strcmp(Sub_data.Base_information.Age,'30-35') || strcmp(Sub_data.Base_information.Age,'35-40')
        u=u+1;
        Group_young_exponent(u,:)=Sub_data.slope;
        Group_young_offset(u,:)=Sub_data.offset;
        Group_young_CF(u,:)=Sub_data.CF;
        Group_young_AP(u,:)=Sub_data.AP;
        Group_young_BW(u,:)=Sub_data.BW;
    else
        v=v+1;
        Group_old_exponent(v,:)=Sub_data.slope;
        Group_old_offset(v,:)=Sub_data.offset;
        Group_old_CF(v,:)=Sub_data.CF;
        Group_old_AP(v,:)=Sub_data.AP;
        Group_old_BW(v,:)=Sub_data.BW;
    end
end
SavePath=[':\Leipzig\Analyze\DATA\Step02\'];
if isdir(SavePath)==0
    mkdir(SavePath);
end
save([SavePath,'summary.mat'],'Group_young_exponent','Group_young_offset','Group_young_CF','Group_young_AP','Group_young_BW','Group_old_exponent','Group_old_offset','Group_old_CF','Group_old_AP','Group_old_BW');
%% Conduct a ttest2 for significant differences
%%%%%%%% 2023/12/10

clc;
clear all;
close all;

File='J:\Leipzig\Analyze\DATA\Step02\';
file_path=dir([File,'*.mat']);
%% data_load
file_name=file_path(1,1).name;
load([File,file_name]);
[h_Ap,p_Ap] = ttest2(Group_old_AP,Group_young_AP)
[h_BW,p_BW] = ttest2(Group_old_BW,Group_young_BW)
[h_CF,p_CF] = ttest2(Group_old_CF,Group_young_CF)
[h_exponent,p_exponent] = ttest2(Group_old_exponent,Group_young_exponent)
[h_offset,p_offset] = ttest2(Group_old_offset,Group_young_offset)
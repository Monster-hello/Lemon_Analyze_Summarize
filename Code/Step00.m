%% Load and reconstruct the Lemon dataset
%%%%%%%%%%% 2023/06/16

clc;
clear all;
close all;

File='\Leipzig\Processed EEG\';
Sub_File=dir([File,'*.set']);
Sub_data=struct;
%% load Participants' information

Base_infor=table2struct(readtable('\Leipzig\Behavior\META_File_IDs_Age_Gender_Education_Drug_Smoke_SKID_LEMON.csv'));
%% load Cognitive Test Battery
CVLT_0=table2struct(readtable('\Leipzig\Behavior\Cognitive_Test_Battery_LEMON\CVLT (1)\CVLT.csv'));
LPS_0=table2struct(readtable('\Leipzig\Behavior\Cognitive_Test_Battery_LEMON\LPS\LPS.csv'));
RWT_0=table2struct(readtable('\Leipzig\Behavior\Cognitive_Test_Battery_LEMON\RWT\RWT.csv'));
TAP_Alertness_0=table2struct(readtable('\Leipzig\Behavior\Cognitive_Test_Battery_LEMON\TAP_Alertness\TAP-Alertness.csv'));
TAP_Incompatibility_0=table2struct(readtable('\Leipzig\Behavior\Cognitive_Test_Battery_LEMON\TAP_Incompatibility\TAP-Incompatibility.csv'));
TAP_Working_Memory_0=table2struct(readtable('\Leipzig\Behavior\Cognitive_Test_Battery_LEMON\TAP_Working_Memory\TAP-Working Memory.csv'));
TMT_0=table2struct(readtable('\Leipzig\Behavior\Cognitive_Test_Battery_LEMON\TMT\TMT.csv'));
WST_0=table2struct(readtable('\Leipzig\Behavior\Cognitive_Test_Battery_LEMON\WST\WST.csv'));

%% load Emotion and Personality Test Battery

BISBAS=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\BISBAS.csv'));
CERQ=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\CERQ.csv'));
COPE=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\COPE.csv'));
ERQ=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\ERQ.csv'));
FEV=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\FEV.csv'));
F_SozU_K_22=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\F-SozU_K-22.csv'));
FTP=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\FTP.csv'));
LOT_R=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\LOT-R.csv'));
MARS=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\MARS.csv'));
MDBF_Day1=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\MDBF_Day1.csv'));
MDBF_Day2=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\MDBF_Day2.csv'));
MDBF_Day3=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\MDBF_Day3.csv'));
MSPSS=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\MSPSS.csv'));
NEO_FFI=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\NEO_FFI.csv'));
NYC_Q_lemon=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\NYC_Q_lemon.csv'));
PSQ=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\PSQ.csv'));
STAI_G_X2=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\STAI_G_X2.csv'));
STAXI=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\STAXI.csv'));
TAS=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\TAS.csv'));
TEIQue_SF=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\TEIQue-SF.csv'));
TICS=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\TICS.csv'));
UPPS=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\UPPS.csv'));
YFAS=table2struct(readtable('\Leipzig\Behavior\Emotion_and_Personality_Test_Battery_LEMON\YFAS.csv'));

%% load Medical Data

Anthropometry=table2struct(readtable('\Leipzig\Behavior\Medical_LEMON\Anthropometry\Anthropometry_LEMON.csv'));
BloodPressure=table2struct(readtable('\Leipzig\Behavior\Medical_LEMON\Blood Pressure\Blood_Pressure_LEMON.csv'));
BloodSample=table2struct(readtable('\Leipzig\Behavior\Medical_LEMON\Blood Sample\Blood_Results_LEMON.csv'));

%% load Data
for sub= 1:2:length(Sub_File)
    % Base_information
    Sub_data.Base_information=Base_infor((sub+1)/2,:);
    % Cognitive
    Sub_data.Cognitive_Test_Battery.CVLT=CVLT_0((sub+1)/2,:);
    Sub_data.Cognitive_Test_Battery.LPS=LPS_0((sub+1)/2,:);
    Sub_data.Cognitive_Test_Battery.RWT=RWT_0((sub+1)/2,:);
    Sub_data.Cognitive_Test_Battery.TAP_Alertness=TAP_Alertness_0((sub+1)/2,:);
    Sub_data.Cognitive_Test_Battery.TAP_Incompatibility=TAP_Incompatibility_0((sub+1)/2,:);
    Sub_data.Cognitive_Test_Battery.TAP_Working_Memory=TAP_Working_Memory_0((sub+1)/2,:);
    Sub_data.Cognitive_Test_Battery.TMT=TMT_0((sub+1)/2,:);
    Sub_data.Cognitive_Test_Battery.WST=WST_0((sub+1)/2,:);
    % Emotion
    Sub_data.Emotion_and_Personality_Test_Battery.BISBAS=BISBAS((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.CERQ=CERQ((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.COPE=COPE((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.ERQ=ERQ((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.FEV=FEV((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.F_SozU_K_22=F_SozU_K_22((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.FTP=FTP((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.LOT_R=LOT_R((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.MARS=MARS((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.MDBF_Day1=MDBF_Day1((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.MDBF_Day2=MDBF_Day2((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.MDBF_Day3=MDBF_Day3((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.MSPSS=MSPSS((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.NEO_FFI=NEO_FFI((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.NYC_Q_lemon=NYC_Q_lemon((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.PSQ=PSQ((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.STAI_G_X2=STAI_G_X2((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.STAXI=STAXI((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.TAS=TAS((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.TEIQue_SF=TEIQue_SF((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.TICS=TICS((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.UPPS=UPPS((sub+1)/2,:);
    Sub_data.Emotion_and_Personality_Test_Battery.YFAS=YFAS((sub+1)/2,:);
    %Medical
    Sub_data.Medical.Anthropometry=Anthropometry((sub+1)/2,:);
    Sub_data.Medical.BloodPressure=BloodPressure((sub+1)/2,:);
    Sub_data.Medical.BloodSample=BloodSample((sub+1)/2,:);
    
    sub_name=Sub_File(sub,1).name;
    EEG_EC=pop_loadset(sub_name,File);
    Sub_data.EEG_EC=EEG_EC;
    sub_name01=Sub_File(sub+1,1).name;
    EEG_EO=pop_loadset(sub_name01,File);
    Sub_data.EEG_EO=EEG_EO;
    SavePath=['\DATA\Step00\'];
    if isdir(SavePath)==0
        mkdir(SavePath);
    end
    save([SavePath,sub_name(1:end-7),'.mat'],'Sub_data');
end
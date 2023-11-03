clear;
clc;
close all;
format shortG

folder1='C:\Local Matlab Data';
cd(folder1)
addpath(folder1)
pause(0.1)


tic;
%%%%%%%%%%%%%%%%%%%%%%%%%%%Test to Check ITM/Terrain 
NET.addAssembly(fullfile('C:\USGS', 'SEADLib.dll')); %%%%%%Where the SEADLib.dll is located
itmp=ITMAcs.ITMP2P;


%%%%%%% 1 Equatorial, 2 Continental Subtorpical, 3 Maritime Tropical, 4 Desert, 5 Continental Temperate, 6 Maritime Over Land, 7 Maritime Over Sea
RadioClimate=int32(5);
Refractivity=301;
Dielectric=25.0;
Conductivity=0.02;
ConfPct=.50; %%%%%% 50%  %%%%Confidence Percentage
Polarity=1; %%%%%%1=Vertical, 0=Horizontal
FreqMHz=3500; %%%%%MHz

reliability=50;  %%%%%
RelPct=reliability/100;  %%%%%Reliability 

TxLat = 43.05;
TxLon = -70.79;
TxHtm = 30;  %%%%%%%%%Height in Meters

RxLat =  42.3805;
RxLon = -71.0468;
RxHtm = 6.0;  %%%%%%%%%Height in Meters

TerHandler=int32(1); % 0 for GLOBE, 1 for USGS
TerDirectory='C:\USGS\';    %%%%%%%%%Where the terrain data is located
[temp_dBloss, propmodeary, errnumary] =itmp.ITMp2pAryRels(TxHtm,RxHtm,Refractivity,Conductivity,Dielectric,FreqMHz,RadioClimate,Polarity,ConfPct,RelPct,TxLat,TxLon,RxLat,RxLon,TerHandler,TerDirectory);
toc;
dBloss=double(temp_dBloss)

'Answer should be: 207.71'
















%%
clear all; close all; clc;
% seq = [0.0774, 2.3929, 12.2138, 2.0072, 1.3999, 0.0322, 1.9497, 0.1425, -0.8223, 0.2];

load('VGAM_6N_TagaLike_11_17_13_57_hip_feedback__GA_only.mat','GA');
seq = GA.Seqs(1,:,10);

Sim = tryToWalk(seq);

figure;
subplot(2,1,1);
plot(Sim.Out.T,Sim.Out.X(:,1),'LineWidth',2); hold on;
plot(Sim.Out.T,Sim.Out.X(:,2),'LineWidth',2);
legend('\theta_1','\theta_2');
xlabel('time')
subplot(2,1,2);
plot(Sim.Out.T,-seq(end)*Sim.Out.X(:,2),'LineWidth',2); hold on;
plot(Sim.Out.T,seq(end)*Sim.Out.X(:,2),'LineWidth',2);
legend('FB flex','FB ext');
xlabel('time')

figure;
plot(Sim.Out.X(:,1),Sim.Out.X(:,3),'LineWidth',2); hold on;
xlabel('\theta_1'); ylabel('\theta_1 dot');
%%
clear all; close all; clc;

generate_GenomeFile('6N_tagaLike_2Ank_torques_symm')

whichCPG = '6N_TagaLike_symm';
whichGA_Case = '_rescale_only';%'_GA_only';
trainingDataFile = 'MatsRandomRes_6N_TagaLike_TrainingSet_2.mat';

MOGA_Matsuoka_Run(whichCPG,whichGA_Case,trainingDataFile,[])
%%
clear all; close all; clc;

generate_GenomeFile('6N_tagaLike_2Ank_torques_symm_with_rescale')

whichCPG = '6N_TagaLike_symm';
whichGA_Case = '_NNclassi_and_rescale';
trainingDataFile = 'MatsRandomRes_6N_TagaLike_TrainingSet_2.mat';

MOGA_Matsuoka_Run(whichCPG,whichGA_Case,trainingDataFile,[])
% MOGA_Matsuoka_Run(whichCPG,whichGA_Case,trainingDataFile,[])

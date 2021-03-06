%% Analize the statistical perf of many:
clear all; close all; clc

% set default options
set(0,'defaultlinelinewidth',2);

% define the class for CPG simulation:
MML = MatsuokaML();
MML.perLim = [0.68 0.78];
MML.perLimOut = MML.perLim + [-0.08 0.08]; % Desired period range
MML.tStep = 0.05;
MML.tEnd = 15;

seqOrder = {'tau' ,'b', 'c', 'w1', 'w2', 'w3', 'w4','k_tau','k_{c}'};


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% % % % % % % % % % 20 generations ******* 500 genomes % % % % % % % % %
% LOAD GA_only files:
InFiles_names_GA_20gen_500pop = {'VGAM_6N_TagaLike_11_15_08_15_same_tonicInputs_20Gen_500Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_15_18_46_same_tonicInputs_20Gen_500Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_22_17_20_same_tonicInputs_20Gen_500Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_23_02_19_same_tonicInputs_20Gen_500Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_23_13_40_same_tonicInputs_20Gen_500Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_23_23_48_same_tonicInputs_20Gen_500Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_24_11_16_same_tonicInputs_20Gen_500Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_25_09_01_same_tonicInputs_20Gen_500Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_25_19_42_same_tonicInputs_20Gen_500Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_26_18_30_same_tonicInputs_20Gen_500Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_27_06_04_same_tonicInputs_20Gen_500Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_27_16_34_same_tonicInputs_20Gen_500Genes__GA_only.mat'};

% % LOAD GA_NN files:
InFiles_names_NN_20gen_500pop = {'VGAM_6N_TagaLike_11_15_11_44_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_15_23_05_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_22_20_53_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_23_07_34_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_23_18_18_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_24_04_32_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_24_17_39_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_25_13_47_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_26_00_44_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_26_23_37_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_27_10_46_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_27_19_29_same_tonicInputs_20Gen_500Genes__NN_classi_only.mat'};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% % % % % % % % % % 10 generations ******* 1000 genomes % % % % % % % % %
% LOAD GA_only files:
InFiles_names_GA_10gen_1000pop = {'VGAM_6N_TagaLike_11_12_14_11_same_tonicInputs_symm_GA_only.mat',...
    'VGAM_6N_TagaLike_11_13_09_49_same_tonicInputs_symm_GA_only.mat',...
    'VGAM_6N_TagaLike_11_13_11_31_same_tonicInputs_symm_GA_only.mat',...
    'VGAM_6N_TagaLike_11_13_17_06_same_tonicInputs_symm_GA_only.mat',...
    'VGAM_6N_TagaLike_11_13_17_28_same_tonicInputs_symm_GA_only.mat',...
    'VGAM_6N_TagaLike_11_14_00_54_same_tonicInputs_symm_GA_only.mat',...
    'VGAM_6N_TagaLike_11_14_01_27_same_tonicInputs_symm_GA_only.mat'};


% % LOAD GA_NN files:
% % % LOAD files:
InFiles_names_NN_10gen_1000pop = {'VGAM_6N_TagaLike_11_12_17_47_same_tonicInputs_symm_NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_13_13_07_same_tonicInputs_symm_NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_13_13_33_same_tonicInputs_symm_NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_13_19_54_same_tonicInputs_symm_NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_13_20_37_same_tonicInputs_symm_NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_14_03_26_same_tonicInputs_symm_NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_14_03_52_same_tonicInputs_symm_NN_classi_only.mat'};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% % % % % % % % % % 20 generations ******* 2000 genomes % % % % % % % % %
% LOAD GA_only files:
InFiles_names_GA_20gen_2000pop = {'VGAM_6N_TagaLike_11_17_11_45_symmetric_20Gen_2000Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_18_23_18_symmetric_20Gen_2000Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_20_06_46_symmetric_20Gen_2000Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_21_16_52_symmetric_20Gen_2000Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_23_05_27_symmetric_20Gen_2000Genes__GA_only.mat',...
    'VGAM_6N_TagaLike_11_24_13_23_symmetric_20Gen_2000Genes__GA_only.mat'};

% % LOAD GA_NN files:
InFiles_names_NN_20gen_2000pop = {'VGAM_6N_TagaLike_11_18_05_13_symmetric_20Gen_2000Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_19_11_26_symmetric_20Gen_2000Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_20_22_32_symmetric_20Gen_2000Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_22_10_19_symmetric_20Gen_2000Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_23_21_17_symmetric_20Gen_2000Genes__NN_classi_only.mat',...
    'VGAM_6N_TagaLike_11_25_02_34_symmetric_20Gen_2000Genes__NN_classi_only.mat'};
% Note: 3 more simulations are currently running
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run statistical data:
clc; close all;

% call the relevant results names:
InFiles_names1 = InFiles_names_GA_20gen_500pop;
InFiles_names2 = InFiles_names_NN_20gen_500pop;
InFiles_names3 = InFiles_names_GA_20gen_2000pop;
InFiles_names4 = InFiles_names_NN_20gen_2000pop;


% % compare {'GA only','GA+NN'} with population of 500:
% categoryLegend = {'GA pop=500','GA+NN pop=500'};
% inFilesNames = {InFiles_names1,InFiles_names2};

% compare {'GA only','GA+NN'} with population of 2000:
categoryLegend = {'GA pop=2000','GA+NN pop=2000'};
inFilesNames = {InFiles_names3,InFiles_names4};

% plot results:

% check maximum fitness perf + sighn rank test:
MOGA_statistical_analisys(seqOrder,MML,inFilesNames,categoryLegend,...
    'mean_of_max_fitness_Signrank_test_per_Generation');

% check maximum fitness perf + plot individual results in thin lines
MOGA_statistical_analisys(seqOrder,MML,inFilesNames,categoryLegend,...
    'mean_of_max_fitness_thinLines');

% pef statistical test on all of the generations combained
MOGA_statistical_analisys(seqOrder,MML,inFilesNames,categoryLegend,...
    'mean_of_max_fitness_Signrank_test_All_Generation');

%% run the different generations num against each other:
clc; close all;

% call the relevant results names:
InFiles_names1 = InFiles_names_GA_20gen_500pop(1,1:6);
InFiles_names2 = InFiles_names_NN_20gen_500pop(1,1:6);
InFiles_names3 = InFiles_names_GA_20gen_2000pop(1,1:6);
InFiles_names4 = InFiles_names_NN_20gen_2000pop(1,1:6);

%% compare 'GA only' {500,2000} population:
categoryLegend = {'GA pop=500','GA pop=2000'};
inFilesNames = {InFiles_names1,InFiles_names3};

%% compare 'GA+NN' {500,2000} population:
categoryLegend = {'GA pop=500','GA pop=2000'};
inFilesNames = {InFiles_names2,InFiles_names4};

%% compare {500pop,'GA+NN} with {2000pop,'GA only'}:
categoryLegend = {'GA+NN pop=500','GA pop=2000'};
inFilesNames = {InFiles_names2,InFiles_names3};
%% plot results:

% RunTime comparison: runTime of the i-th generation
MOGA_statistical_analisys(seqOrder,MML,inFilesNames,categoryLegend,...
    'mean_of_max_runTime_Signrank_test_per_Generation');

% RunTime comparison: runTime until the i-th generation
MOGA_statistical_analisys(seqOrder,MML,inFilesNames,categoryLegend,...
    'mean_runTime_until_the_ith_gen');

% check maximum fitness perf + sighn rank test:
MOGA_statistical_analisys(seqOrder,MML,inFilesNames,categoryLegend,...
    'mean_of_max_fitness_Signrank_test_per_Generation');

% check maximum fitness perf + plot individual results in thin lines
MOGA_statistical_analisys(seqOrder,MML,inFilesNames,categoryLegend,...
    'mean_of_max_fitness_thinLines');

% pef statistical test on all of the generations combained
MOGA_statistical_analisys(seqOrder,MML,inFilesNames,categoryLegend,...
    'mean_of_max_fitness_Signrank_test_All_Generation');
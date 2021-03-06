
close all; clc; clear all;

%%
generate_GenomeFile('4N_general')

%%
% define the class:
MML = MatsuokaML();
MML.perLim = [0.68 0.78];
MML.perLimOut = MML.perLim + [-0.08 0.08]; % Desired period range
MML.tStep = 0.05;
MML.tEnd = 15;
MML.nNeurons = 4;

% MML.Gen.Range(2,2) = 2.5; % the class will filter genes that are not in the new range.
%% Train data:

N = 100; % the number of samples
% % % % CPG parameters:
% seqOrder = {'tau','b','c_1','c_2','c_3','c_4',...
%     'w_{12}','w_{13}','w_{14}','w_{21}','w_{23}','w_{24}',...
%     'w_{31}','w_{32}','w_{34}','w_{41}','w_{42}','w_{43}'};

seq = MML.Gen.RandSeq(N);

tic
t_cur = tic;

disp('start with the sim:');
% parfor i=1:N % Simulate and calculate the frequecy (also calc from Matsuoka extimation)
for i=1:N
    disp(['at sim #',num2str(i)]);
    [out, sim, signal] = MML.runSim(seq(i,:));
        % Prepare output:
    % Parameters
    results(i).seq = seq(i,:);
    results(i).b = sim.Con.beta;
    results(i).c = sim.Con.Amp0;
    results(i).Worig = sim.Con.wex;
    results(i).W = sim.Con.W;
    results(i).Tr = sim.Con.tau;
    results(i).Ta = sim.Con.tav;
    results(i).x0 = out.x0;

    % Results- caculate perdiods using different methods:
    results(i).periods = out.periods;
    
%     [periods_LSQ1,~,~,~,~] = ...
%         MML.processResults_LSQ(signal.signal(1,:),signal.T,0);
%     [periods_LSQ2,~,~,~,~] = ...
%         MML.processResults_LSQ(signal.signal(2,:),signal.T,0);
%     results(i).periods_LSQ = [periods_LSQ1(1,1);periods_LSQ2(1,1)];
%     [periodsFFT,sine_coef,cos_coef,a0,~] = ...
%         MML.processResults_LSQ(x,t,0);
%     results(i).bias_coef = a0;
%     results(i).sine_coef = sine_coef;
%     results(i).cos_coef = cos_coef;
    
    results(i).pos_work = out.pos_work;
    results(i).neg_work = out.neg_work;
    results(i).perError1 = out.perError1;
    results(i).perOK1 = out.perOK1;
    results(i).perError2 = out.perError2;
    results(i).perOK2 = out.perOK2;
    results(i).neuronActive = out.neuronActive;
    results(i).neuronOsc = out.neuronOsc;
    
    % check Matsuoka conditions:
%     results(i).cond0 = checkCond_0(results(i).seq,seqOrder);
%     
%     results(i).cond1 = checkCond_1(results(i).seq,seqOrder);
%     
%     results(i).cond2 = checkCond_2(results(i).seq,seqOrder,cond1);
    
%     disp(['at i=',num2str(i),...
%         '  cond0=',num2str(results(i).cond0),...
%         '  cond1=[',num2str(results(i).cond1),']',...
%         '  cond2=',num2str(results(i).cond2)]);

end 
disp('sim end...');

t_elapsed = toc(t_cur);
avg_sim_time = t_elapsed/N;
disp(['avg sim time is ',num2str(avg_sim_time),' [sec]']);

% header = sprintf('tau ratio is equal to 12 \n');
% header = [header,sprintf('data is for 4N general CPG case \n')];
% header = [header,sprintf('seq Order: \n')];
% header = [header,sprintf('"tau","b","c_1","c_2","c_3","c_4" \n')];
% header = [header,sprintf('"w_{12}","w_{13}","w_{14}","w_{21}","w_{23}","w_{24}" \n')];
% header = [header,sprintf('"w_{31}","w_{32}","w_{34}","w_{41}","w_{42}","w_{43}" \n')];
% header = [header,sprintf('b in range (0.2,10) \n')];
% header = [header,sprintf('W_ij in range (0,10) \n')];
% 
% save('MatsRandomRes_4Neurons_4Paper_Large_b_Large_W_3.mat','results','MML','header');

%% Phase 2 - Re-run simulations that converged outside the desired range,
% this time with scaled temporal parameters
filename2 = 'MatsScaledRes.mat';
load(filename1,'results');
periods = horzcat(results(:).periods);
reDo_ids = zeros(1, length(results));
reDo_ids(~isnan(periods)) = 1;
reDo_ids(periods >= MML.perLimOut(1) &...
    periods <= MML.perLimOut(2)) = 0;

inputData = results(logical(reDo_ids));
inputPeriods = periods(logical(reDo_ids));
MML.runScaledSims(inputData, inputPeriods, filename2);

%% plot example:
% load(filename1)
[out, ~, signal] = MML.runSim(results(randsample(1:nSamples,1)).seq);

figure;
subplot(2,1,1);
plot(signal.T,signal.X);
xlabel('time[sec]');    ylabel('X_i');
title('X_i over time');
subplot(2,1,2)
plot(signal.T,signal.signal(1,:));

% Improved Dung Beetle Optimizer: (IDBO) (demo)
% Programmed by Zhanyou Chang    
% Updated June 22,2025.
% Chang Z, Luo J. EIDBO-TrICP: a coarse-to-fine algorithm for cross-source point cloud registration in aero-engineering blades. Engineering Research Letters. 2025; 7: 015280.
% DOI: https://doi.org/10.1088/2631-8695/adb4bf

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all 
close all
clc

SearchAgents_no=30; % Number of search agents

Function_name='F1'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=500; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);
[fMin,bestX,IDBO_curve]=IDBO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
semilogy(IDBO_curve,'Color','g')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');
%axis tight
grid on
box on
legend('IDBO')
display(['The best solution obtained by IDBO is : ', num2str(bestX)]);
display(['The best optimal value of the objective funciton found by IDBO is : ', num2str(fMin)]);


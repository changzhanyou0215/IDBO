clear all;
close all;
clc;

SearchAgents_no = 30;    % population size
Function_name = 'F1';    % Test Functions: F1-F23 
Max_iteration = 500;     % Maximum Iterations
cnt_max = 1;             % Runs

[lb, ub, dim, fobj] = Get_Functions_details(Function_name); % Load details of selected test function


Curve_DBO = zeros(1, Max_iteration);
Curve_IDBO = zeros(1, Max_iteration);

 
for cnt = 1 : cnt_max


    [DBO_Best_score(cnt),    DBO_Best_pos(cnt,:),   DBO_curve]   =   DBO(SearchAgents_no, Max_iteration, lb, ub, dim, fobj);      % DBO
    [IDBO_Best_score(cnt),   IDBO_Best_pos(cnt,:),  IDBO_curve]  =  IDBO(SearchAgents_no, Max_iteration, lb, ub, dim, fobj);      % IDBO
    
    
    Curve_DBO = Curve_DBO + DBO_curve;
	Curve_IDBO = Curve_IDBO + IDBO_curve;

end

% Iteration curve
Curve_DBO = Curve_DBO/cnt_max;
Curve_IDBO = Curve_IDBO/cnt_max;


% Std
std_DBO = std(DBO_Best_score);
std_IDBO = std(IDBO_Best_score);


% Worst
worst_DBO = max(DBO_Best_score);
worst_IDBO = max(IDBO_Best_score);


% Best
best_DBO = min(DBO_Best_score);
best_IDBO = min(IDBO_Best_score);


% Mean
mean_DBO = mean(DBO_Best_score);
mean_IDBO = mean(IDBO_Best_score);


figure(1)
semilogy(Curve_DBO,'color', [125, 195, 254]./255, 'linestyle', '-', 'linewidth', 2)
hold on
semilogy(Curve_IDBO,'color', [118, 80, 5]./255, 'linestyle', '-', 'linewidth', 1.5)

title(Function_name,'FontName', 'Helvetica', 'FontSize', 12);
xlabel('Iteration', 'FontName', 'Helvetica', 'FontSize', 12);
ylabel('Best score obtained so far', 'FontName', 'Helvetica', 'FontSize', 12);
set(gca,'linewidth',2);
grid on
box on
legend('DBO','IDBO')% Comparison of different metaheuristics
grid off


% Result Outputs
disp(['DBO£ºWorst: ', num2str(worst_DBO), ', Best: ', num2str(best_DBO), ', Mean: ', num2str(mean_DBO), ', Std: ', num2str(std_DBO)]);
disp(['IDBO£ºWorst: ', num2str(worst_IDBO), ', Best: ', num2str(best_IDBO), ', Mean: ', num2str(mean_IDBO), ', Std: ', num2str(std_IDBO)]);


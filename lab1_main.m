
clear; clc; close all;

%Duota
C = [13 14 17 18 19 15 13 31 32 29 27]';
F = [55 58 63 65 66 59 56 87 90 85 81]';

%A(k,:)=[k*0.01 1];, atnaujinta: F ones(length(F) = F; 1=k2
A = [F ones(length(F),1)];


reference = [5/9; -160/9];


% Pinv rezultatas 
kPinv = pinv(A)*C;


pValues = [1 10 100 1000 10000 100000 1000000];

%k koef.
finalEstimates = zeros(2,length(pValues));


% Saugo RLSE įverčius kiekvienam pradiniam P0 daugikliui.
history = zeros(length(F),2,length(pValues));


for j = 1:length(pValues)
    [estimate,xx] = rlse(A,C,pValues(j));
    history(:,:,j) = xx';
    finalEstimates(:,j) = estimate;
end


disp('Final estimates for different initial matrices P0 = p*I:');
disp(table(pValues',finalEstimates(1,:)',finalEstimates(2,:)', ...
    'VariableNames',{'p','k1','k2'}));
disp('Comparison for the largest p:');
Method = {'RLSE'; 'pinv'; 'Physical relation'};
estimates = [finalEstimates(:,end) kPinv reference];
disp(table(Method,estimates(1,:)',estimates(2,:)', ...
    'VariableNames',{'Method','k1','k2'}));
fprintf('RLSE-pinv difference: %.6g\n',norm(finalEstimates(:,end)-kPinv));
fprintf('pinv data RMSE: %.6g C\n',sqrt(mean((A*kPinv-C).^2)));

figure('Name','RLSE convergence');
subplot(2,1,1); plot(1:length(F),history(:,1,end),'-o');
hold on; yline(kPinv(1),'--'); yline(reference(1),':');
xlabel('Observation'); ylabel('k1'); grid on;
legend('RLSE','pinv','Physical relation','Location','best');
subplot(2,1,2); plot(1:length(F),history(:,2,end),'-o');
hold on; yline(kPinv(2),'--'); yline(reference(2),':');
xlabel('Observation'); ylabel('k2'); grid on;
legend('RLSE','pinv','Physical relation','Location','best');
figure('Name','Effect of initial matrix');
subplot(2,1,1); semilogx(pValues,finalEstimates(1,:),'-o');
hold on; yline(kPinv(1),'--'); xlabel('p in P0 = p*I'); ylabel('k1'); grid on;
subplot(2,1,2); semilogx(pValues,finalEstimates(2,:),'-o');
hold on; yline(kPinv(2),'--'); xlabel('p in P0 = p*I'); ylabel('k2'); grid on;
figure('Name','Temperature observations');
plot(F,C,'ko'); hold on;
fGrid = linspace(min(F),max(F),100);
plot(fGrid,kPinv(1)*fGrid+kPinv(2),'-', ...
    fGrid,reference(1)*fGrid+reference(2),'--');
xlabel('Fahrenheit'); ylabel('Celsius'); grid on;
legend('Observations','Estimated relation','Physical relation','Location','best');

set(findall(groot,'Type','figure'),'Color','w');
set(findall(groot,'Type','axes'),'Color','w','XColor','k','YColor','k');
set(findall(groot,'Type','legend'),'Color','w','TextColor','k');
set(findall(groot,'Type','text'),'Color','k');

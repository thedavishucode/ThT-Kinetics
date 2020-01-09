% Fit ThT Fluorescence - Sigmoid equation
% Sigmoid equation (Logistic curve)
%          BOTTOM + (TOP-BOTTOM)/(1+exp((t50-t)*c))
% BOTTOM - first reading
% TOP    - final reading
% t      - time
% t50    - t at half max reading
% c      - hill coeffecient

% Fitting Steps :
% Step 1 - Using "fittype" command 
%          Enter Formula in ''
%          Formula should contain all Independents, Coeffecients
%          Enter Independents and Dependents in '' 
%          Enter Coeffecients within {} using ''
%          Close fittpe command with ;
% Step 2 - Using "fit" command
%          Enter xdata, ydata and ft
%          Define Fitting parameters or StartPoint 
%          Input initial estimates of the Coefficients in [] 
%          separated by single space, and in the same order as defined above.

% Code
sigdata    = xlsread('ThTkinetics.xlsx')
time       = sigdata(:,1);
thtsignal  = sigdata(:,2);
formula = 'y0 + (y1-y0)/(1+exp((t50-t)*c))';
ft = fittype(formula,...
    'Independent','t',... 
    'Dependent','y',...
    'Coefficients', {'y1', 'y0' 't50', 'c'});   
f = fit(time,thtsignal,ft,...
    'StartPoint', [10000 2000 8 1])
plot(f,time,thtsignal,'o')
xlabel('Time [h]', 'Fontsize', 14)
ylabel('ThT fluorescence', 'Fontsize', 14)
% End

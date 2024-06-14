%% Calculating step width and length

%% Walking trial
% Load GRF data (example)
load('Day6GA2.mat'); %load the trial you want to analyze

%% Walking trial
% Time started after system was turned on but participant did not start
% walking from that moment. Extracting the 6 min walking data:
fs = 500; %sample rate is 500Hz
N = length(time); %number of samples
N_6min = fs* (6*60);
N_begin = (N-N_6min)+1;

LFz = LFz(N_begin:end);
LFx = LFx(N_begin:end);
LFy = LFy(N_begin:end);

RFz = RFz(N_begin:end);
RFx = RFx(N_begin:end);
RFy = RFy(N_begin:end);

LMz = LMz(N_begin:end);
LMx = LMx(N_begin:end);
LMy = LMy(N_begin:end);

RMz = RMz(N_begin:end);
RMx = RMx(N_begin:end);
RMy = RMy(N_begin:end);

%% Calculate heel strikes and toe offs

T_Ltoe_offs = [];
T_Lheel_strikes = [];

threshold = 100; % Threshold for detecting foot contact
min_N_between = 200; % Minimum samples between heel strikes and toe offs to avoid multiple detections for one event

for i = 1:length(LFz)
    if i == length(LFz)
        break
    end

    if LFz(i) < threshold && LFz(i+1) > threshold
        if isempty(T_Lheel_strikes) || (i - T_Lheel_strikes(end)) > min_N_between
        T_Lheel_strikes(end+1) = i+1;
        end
    end

    if LFz(i) > threshold && LFz(i+1) < threshold
        if isempty(T_Ltoe_offs) || (i - T_Ltoe_offs(end)) > min_N_between
        T_Ltoe_offs(end+1) = i;
        end
    end
end

T_Rtoe_offs = [];
T_Rheel_strikes = [];

threshold = 100; 
min_N_between = 200;

for i = 1:length(RFz)
    if i == length(RFz)
        break
    end

    if RFz(i) < threshold && RFz(i+1) > threshold
        if isempty(T_Rheel_strikes) || (i - T_Rheel_strikes(end)) > min_N_between
        T_Rheel_strikes(end+1) = i+1;
        end
    end

    if RFz(i) > threshold && RFz(i+1) < threshold
        if isempty(T_Rtoe_offs) || (i - T_Rtoe_offs(end)) > min_N_between
        T_Rtoe_offs(end+1) = i;
        end
    end
end

%% PLausibility check: does the GRF plot resemble that of normal walking

LFz(LFz<100) = NaN;
RFz(RFz<100) = NaN;

figure(1)
plot(LFz(1:2000), 'g'); hold on; plot(RFz(1:2000), 'r');


% in the article of K.L. Poggensee and S.H. Collins they mention that data for the last three minutes
% of trials was used for analysis, that is the last half of each trial
% since one trial is six minuten
fs = 500; %sample rate is 500Hz
N = length(LFz); %number of samples from the 6 min trial
N2 = N/2;
Lheel_strikes = T_Lheel_strikes(T_Lheel_strikes > N2);
Rheel_strikes = T_Rheel_strikes(T_Rheel_strikes > N2);

Ltoe_offs = T_Ltoe_offs(T_Ltoe_offs > N2);
Rtoe_offs = T_Rtoe_offs(T_Rtoe_offs > N2);

%% Calculate CoP

% corner position of force plate --> these are the offset values (X0, Y0)
% of the forceplate (there is no offset in Z direction, z0=0). 
L_FPx = 0.5665;
R_FPx = -.0005;
L_FPy = -1.78;
R_FPy = -1.78;

L_CoPx = -LMy./LFz + L_FPx;
L_CoPy = -LMx./LFz - L_FPy;

R_CoPx = -RMy./RFz + R_FPx;
R_CoPy = -RMx./RFz - R_FPy;

% make toe off and heel strike events of equal length
if length(Lheel_strikes)>length(Ltoe_offs)
    Lheel_strikes = Lheel_strikes(1:end-1);
    Ltoe_offs = Ltoe_offs;
elseif length(Ltoe_offs)>length(Lheel_strikes)
    Ltoe_offs = Ltoe_offs(1:end-1);
    Lheel_strikes = Lheel_strikes;
else
    Ltoe_offs = Ltoe_offs;
    Lheel_strikes = Lheel_strikes;
end

% make toe off and heel strike events of equal length
if length(Rheel_strikes)>length(Rtoe_offs)
    Rheel_strikes = Rheel_strikes(1:end-1);
    Rtoe_offs = Rtoe_offs;
elseif length(Rtoe_offs)>length(Rheel_strikes)
    Rtoe_offs = Rtoe_offs(1:end-1);
    Rheel_strikes = Rheel_strikes;
else
    Rtoe_offs = Rtoe_offs;
    Rheel_strikes = Rheel_strikes;
end


Lsupport_time = [];
hs_LCoPx = [];

%Lheel_strikes=Lheel_strikes(1:end-1);

%calculate the center of pressure at heel strike
for k = 1:length(Lheel_strikes)
    %Lsupport_time(end+1) = (Ltoe_offs(k) - Lheel_strikes(k))/Fs;
    hs_LCoPx(k) = L_CoPx(Lheel_strikes(k));
end

%Rheel_strikes = Rheel_strikes(1:end-1);

Rsupport_time = [];
hs_RCoPx = [];

%calculate the center of pressure at heel strike
for k2 = 1:length(Rheel_strikes)
    %Rsupport_time(end+1) = (Rtoe_offs(k2) - Rheel_strikes(k2))/Fs;
    hs_RCoPx(k2) = R_CoPx(Rheel_strikes(k2));
end

%% Make sure both left and right are of equal length to do furter calculations

if length(hs_LCoPx)>length(hs_RCoPx)
    hs_LCoPx = hs_LCoPx(1:length(hs_RCoPx));
else 
    hs_LCoPx = hs_LCoPx;
    hs_RCoPx = hs_RCoPx;
end

if length(hs_RCoPx)>length(hs_LCoPx)
    hs_RCoPx = hs_RCoPx(1:length(hs_LCoPx));
else 
    hs_LCoPx = hs_LCoPx;
    hs_RCoPx = hs_RCoPx;
end

%% calculating step width
% step width = distance between left and right CoPx at heel strike
step_width = hs_RCoPx - hs_LCoPx;
mean_step_width = mean(step_width)
step_width_variability = std(step_width)


% Plausebility check: Step width values should fall within the range of
% the treadmill, that is a total width of 0.5 meters for each belt (Bertec, Columbus, OH, USA)

% Define lower and upper bounds
lb = 0;
ub = 0.5;

% Check if any elements are outside the range
outsideRange = any(step_width < lb | step_width > ub);

% Display the result
if outsideRange
    disp('There are elements outside the specified range.');
else
    disp('All elements are within the specified range.');
end


all_step_width = [step_width];

SW_Table = array2table(all_step_width');
% Export to Excel 
writetable(SW_Table,'StepWidth_Day2_GA2.xls') % change the name to match the trial you are analysing 


%% Step length

Lsupport_time = [];
hs_LCoPy = [];

%Lheel_strikes=Lheel_strikes(1:end-1);

%calculate the center of pressure at heel strike
for k = 1:length(Lheel_strikes)
    Lsupport_time(end+1) = (Ltoe_offs(k) - Lheel_strikes(k))/Fs;
    hs_LCoPy(k) = L_CoPy(Lheel_strikes(k));
end

%Rheel_strikes = Rheel_strikes(1:end-1);

Rsupport_time = [];
hs_RCoPy = [];

%calculate the center of pressure at heel strike
for k2 = 1:length(Rheel_strikes)
    Rsupport_time(end+1) = (Rtoe_offs(k2) - Rheel_strikes(k2))/Fs;
    hs_RCoPy(k2) = R_CoPy(Rheel_strikes(k2));
end

%hs_RCoPy=hs_RCoPy(1:end-1);

%% Make sure both left and right are of equal length to do furter calculations

if length(hs_LCoPy)>length(hs_RCoPy)
    hs_LCoPy = hs_LCoPy(1:length(hs_RCoPy));
else 
    hs_LCoPy = hs_LCoPy;
    hs_RCoPy = hs_RCoPy;
end

if length(hs_RCoPy)>length(hs_LCoPy)
    hs_RCoPy = hs_RCoPy(1:length(hs_LCoPy));
else 
    hs_LCoPy = hs_LCoPy;
    hs_RCoPy = hs_RCoPy;
end


%% Calculating step length
% step length = distance between left and right CoPy at heel strike
step_length = hs_LCoPy + hs_RCoPy;
mean_step_length = mean(step_length)
step_length_variability = std(step_length)


% Plausebility check: Step length values should fall within the range of
% the treadmill, that is a length of 1.78 meters (Bertec, Columbus, OH, USA)

% Define lower and upper bounds
lb = 0;
ub = 1.78;

% Check if any elements are outside the range
outsideRange = any(step_length < lb | step_length > ub);

% Display the result
if outsideRange
    disp('There are elements outside the specified range.');
else
    disp('All elements are within the specified range.');
end


all_step_length = [step_length];

SL_Table = array2table(all_step_length');
% Export to Excel
writetable(SL_Table,'StepLength_Day2_GA2.xls')
 
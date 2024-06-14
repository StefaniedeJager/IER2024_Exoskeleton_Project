
# Determening step width and step length from ground reaction force data of different walking trials 
This repository contains the data set, all files can be found in the Introduction to engineering research map
This analyses is an extension on that of K.L. Poggensee and S.H. Collins from their article: "How adaptation, training, and customization contributeto benefits from exoskeleton assistance", the data used here was collected during their research. 
The code and files for the data analysis and statistical analysis are stored in seperate folders. 

# Data Analysis
All the data is stored in .mat files, for all different walking trials on two different training days seperately. 
All data is from one participant, containing the ground reaction force (Fx, Fy, Fz) and ground reaction moment data (Mx, My, Mz) in three directions; left, forward, down, which are used for analyses.
Data files also contain (From K.L. Poggensee and S.H. Collins):
- Time (s): time (0 is when the system was first turned on)
- Ankle angles from exoskeleton encoder: posaL, posaR (radians)
- Ankle velocities from exoskeleton encoder: velaL, velaR (rad/sec)
- Exoskeleton torque measured by strain gauges: tauL, tauR (Nm)
- Desired exoskeleton torque: taudesL, taudesR (Nm)
- Metabolics measurements: vo2, vco2 (mL/min)

**Data from the first training day**
- Day2NW2.mat = contains the data of the walking trials with normal shoes
- Day2ZT2.mat = contains the data of the walking trials with the exoskeleton on zero torque
- Day2GA2.mat = contains the data of the walking trials with the exoskeleton subjected to the general assistance pattern

**Data from the last training day**
- Day6NW2.mat = contains the data of the walking trials with normal shoes
- Day6ZT2.mat = contains the data of the walking trials with the exoskeleton on zero torque
- Day6GA2.mat = contains the data of the walking trials with the exoskeleton subjected to the general assistance pattern

Next to that, this folder contains some .xlsx excelfiles which contains all of the data that is collected by running the Matlab scripts and will be used for making the boxplot figures.

**Used for Boxplot figure**
- StepLength_Day1vs5_2.xlsx = Containing step length data of the first and last training days
- StepWidth_Day1vs5_2.xlsx = Containing step width data of the first and last training days

These data files are used in the Boxplot.MATLAB script to obtain boxplots of the data, used for visualization of the data and in R for statistical analyses.

## Installing dependencies
To run all scripts a version of Matlab 2022b is needed.

## Matlab scripts
This repository contains two Matlab scripts:

- **StepVariability.m**
  - This script loads the .mat data. 
    - In line 5: load('Day6GA2.mat'); change the name between " into the filename that corresponds to the walking trial you want to analyze
              e.g. when you want to analyze the general assistance trial on the last training day: 'Day6GA2.mat'
    - In line 209: writetable(SW_Table,'StepWidth_Day6_GA2.xls'); The name between the quotation marks will be the name of the excel output file for step width, change this to match the walking trial you are analyzing (in line 5)
    - In line 284: writetable(SL_Table,'StepLength_Day2_GA2.xls'); The name between the quotation marks will be the name of the excel output file for step length, change this to match the walking trial you are analyzing (in line 5)
  - Run the Script
    - Plausibility checks are performed for Ground Reaction Force data, check for abnormalities in the plot (figure 1)
    - Plausibility checks are performed for Step Width and Step Length: it should show "All elements are within the specified range." for both metrics. If not, results are not plausible.
    - Two excel files are created (in line 209 and 284), containing all the step width and step length data.
    - Mean and standard deviation are also calculated for both step width and step lentgh and are shown as variables in Matlab.
  
- **Boxplot.m**
  - This script makes the Boxplot that visualises the difference between the different walking trials on the first and last trainingday for both step width and step length.
  - Run the script and two figures containing the boxplot for both metrics are created.
  
# Statistical analyses
This folder contains the data stored in .xlsx files and the code for conducting statistical analyses in matlab files of R files. 

**Data Files: Normality check**
- StepLength_Day2_2.xlsx:
- StepLength_Day6_2.xlsx:
- StepWidth_Day2_2.xlsx:
- StepWidth_Day6_2.xlsx:

**Data Files: Friedman Test**
- StepLength_2vs6_2.xlsx:
- StepWidth_2vs6_2.xlsx:

**Data Files: Pairwise Test**
- StepLengthDay2vsDay6_2.xlsx:
- StepWidthDay2vsDay6_2.xlsx:

## Installing dependencies
To run all scripts a version of Matlab 2022b and R-4.4.0 and RStudio is needed.

# Scripts
In order to run the script you need to import the right excel file set in to RStudio (on the right side under environment select import data).

- **Normality_test.R**
  - This R scripts checks normality for all conditions for both stability metrics on the first and last training day.
  - Run the script through selecting all the code an pressing Run at the right top of the script.
  - In the script after # each outcome variable is defined
  - After running the script, the outcome variables are shown in the R Console (left bottom)
- **Friedmantest.m**
  - This Matlab script runs the Friedman statistical test.
  - Run the script, it automatically stops after performing the first friedman test, press continue to perform the second test.
  - Outcomes are shown in figures and in the command window.
- **Pairwise(wilcox).R**
  - This R script performs the pairwise Wilcoxen signed rank tests for all conditions for both stability metrics on the first and last training day.
  - In the script after # each outcome variable is defined.
  - Run the script through selecting all the code an pressing Run at the right top of the script.
  - After running the script, the outcome variables are shown in the R Console (left bottom)


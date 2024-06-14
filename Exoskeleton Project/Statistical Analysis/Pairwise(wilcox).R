library(readxl)

# Read the Excel file
data <- read_excel("StepLengthDay2vsDay6_2.xlsx")

attach(data)

SL_NW2 <- wilcox.test(data$Tnormal,data$Znormal, paired = TRUE)
SL_ZT2 <- wilcox.test(data$Tzero,data$Zzero, paired = TRUE)
SL_GA2 <- wilcox.test(data$Tgeneral,data$Zgeneral, paired = TRUE)
SL2_NW_ZT <- wilcox.test(data$Tnormal,data$Tzero, paired = TRUE)
SL2_NW_GA <- wilcox.test(data$Tnormal,data$Tgeneral, paired = TRUE)
SL2_ZT_GA <- wilcox.test(data$Tzero,data$Tgeneral, paired = TRUE)
SL6_NW_ZT <- wilcox.test(data$Znormal,data$Zzero, paired = TRUE)
SL6_NW_GA <- wilcox.test(data$Znormal,data$Zgeneral, paired = TRUE)
SL6_ZT_GA <- wilcox.test(data$Zzero,data$Zgeneral, paired = TRUE)
SL_NW2 #Step length: training effect --> normal condition 
SL_ZT2 #Step length: training effect --> zero torque condition
SL_GA2 #Step length: training effect --> general assistance condition
SL2_NW_ZT #Step length: first training day --> normal vs zero torque 
SL2_NW_GA #Step length: first training day --> normal vs general assistance 
SL2_ZT_GA #Step length: first training day --> zero torque vs general assistance 
SL6_NW_ZT #Step length: last training day --> normal vs zero torque 
SL6_NW_GA #Step length: last training day --> normal vs general assistance
SL6_ZT_GA #Step length: last training day --> zero torque vs general assistance 

library(readxl)

# Read the Excel file
data <- read_excel("StepWidthDay2vsDay6_2.xlsx")

attach(data)

SW_NW <- wilcox.test(data$Tnormal,data$Znormal, paired = TRUE)
SW_ZT <- wilcox.test(data$Tzero,data$Zzero, paired = TRUE)
SW_GA <- wilcox.test(data$Tgeneral,data$Zgeneral, paired = TRUE)
SW2_NW_ZT <- wilcox.test(data$Tnormal,data$Tzero, paired = TRUE)
SW2_NW_GA <- wilcox.test(data$Tnormal,data$Tgeneral, paired = TRUE)
SW2_ZT_GA <- wilcox.test(data$Tzero,data$Tgeneral, paired = TRUE)
SW6_NW_ZT <- wilcox.test(data$Znormal,data$Zzero, paired = TRUE)
SW6_NW_GA <- wilcox.test(data$Znormal,data$Zgeneral, paired = TRUE)
SW6_ZT_GA <- wilcox.test(data$Zzero,data$Zgeneral, paired = TRUE)
SW_NW #Step Width: training effect --> normal condition 
SW_ZT #Step Width: training effect --> zero torque condition 
SW_GA #Step Width: training effect --> general assistance condition 
SW2_NW_ZT #Step Width: : first training day --> normal vs zero torque
SW2_NW_GA #Step Width: : first training day --> normal vs general assistance
SW2_ZT_GA #Step Width: : first training day --> zero torque vs general assistance
SW6_NW_ZT #Step Width: : last training day --> normal vs zero torque
SW6_NW_GA #Step Width: : last training day --> normal vs general assistance
SW6_ZT_GA #Step Width: : last training day --> zero torque vs general assistance

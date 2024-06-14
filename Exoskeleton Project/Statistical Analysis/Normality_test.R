# Shapiro-Wilk normality test
library(readxl)

# Step Width Last training day
# Read the Excel file
data <- read_excel("StepWidthDay2_2.xlsx")

SW_NW1 <- shapiro.test(data$Normal)
SW_ZT1 <- shapiro.test(data$Zero)
SW_GA1 <- shapiro.test(data$General)

SW_NW1
SW_ZT1
SW_GA1

# Step Width Last training day
# Read the Excel file
data <- read_excel("StepWidthDay6_2.xlsx")

SW_NW5 <- shapiro.test(data$Normal)
SW_ZT5 <- shapiro.test(data$Zero)
SW_GA5 <- shapiro.test(data$General)

SW_NW5
SW_ZT5
SW_GA5

# Step Width Last training day
# Read the Excel file
data <- read_excel("StepLengthDay2_2.xlsx")

SL_NW1 <- shapiro.test(data$Normal)
SL_ZT1 <- shapiro.test(data$Zero)
SL_GA1 <- shapiro.test(data$General)

SL_NW1
SL_ZT1
SL_GA1

# Step Width Last training day
# Read the Excel file
data <- read_excel("StepLengthDay6_2.xlsx")

SL_NW5 <- shapiro.test(data$Normal)
SL_ZT5 <- shapiro.test(data$Zero)
SL_GA5 <- shapiro.test(data$General)

SL_NW5
SL_ZT5
SL_GA5


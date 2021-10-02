# Load packages
library(dplyr)
library(tidyverse)

## Deliverable 1 ##

# Import and read the csv file
mpg <- read.csv(file = 'Data/MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

# Linear regression for all variables
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mpg)

# p-value and r-squared  for all variables
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mpg))

## Deliverable 2 ##

# Import and read the csv file
sus_coils <- read.csv('Data/Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

# Create a summary for all PSI data
total_summary <- sus_coils %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Create a summary for all PSI data by lot
lot_summary <- sus_coils %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

###  Deliverable 3 ###

# t-test across all manufacturing lots against the population mean = 1500 PSI
t.test(x=sus_coils$PSI, mu=1500)

# t-test lot1 against population mean = 1500 PSI
pop1 <- subset(sus_coils, Manufacturing_Lot=='Lot1')
t.test(x=pop1$PSI, mu=1500)

# t-test lot2 against population mean = 1500 PSI
pop2 <- subset(sus_coils, Manufacturing_Lot=='Lot2')
t.test(x=pop2$PSI, mu=1500)

# t-test lot3 against population mean = 1500 PSI
pop3 <- subset(sus_coils, Manufacturing_Lot=='Lot3')
t.test(x=pop3$PSI, mu=1500)

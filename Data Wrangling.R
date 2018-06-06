# Get Working Directory of the current project
getwd()

# Set Working Directory where the file resides'
setwd("F:/Janaki & Venky/Data Science/Capstone-Project")

install.packages("tidyverse")
install.packages("rgr")
library(tidyverse)
library (dplyr)
library (tidyr)

# Data Import to R and creates the dataframe.
# Dataset contains 14769 rows.

ZHVI <- read.csv("ZHVI Summary.csv")
View(ZHVI)

# Retain RegionName aka "Zipcode", City, State and ZHVI columns
# and remove other columns from the ZHVI dataset.

ZHVI <- ZHVI[-c(1:2,5:6,8,10:19)]  
View(ZHVI)

# Dataset contains 27790 rows.
IRSI <- read.csv("IRS Income By Zip Code.csv")
View(IRSI)

# Retain Zipcode and AGI columns and 
# remove other columns in the IRS Income file

IRSI <- IRSI[-c(1,3,5:11)]  
View(IRSI)

# ZHVI - Change column name from RegionID to ZIPCODE
colnames(ZHVI)[colnames(ZHVI) == "RegionName"] <- "ZIPCODE"

# Merge ZHVI and IRSI by Zipcode using left join
ZHVI_IRSI <- left_join(ZHVI,IRSI,by="ZIPCODE")
View(ZHVI_IRSI)

# Remove rows if the income data is NA or blank for zip codes.
# drop_na - tidyr function. 
# ZHVI_IRSI %>% drop_na()   -- Not working. Not sure why!!!
# View (ZHVI_IRSI)
# Dataset contains 14629 rows after removing NA.

ZHVI_IRSI<-na.omit(ZHVI_IRSI)
View (ZHVI_IRSI)

# Made Column names readable
colnames(ZHVI_IRSI)
colnames(ZHVI_IRSI)[colnames(ZHVI_IRSI) == "ZIPCODE"] <- "ZipCode"
colnames(ZHVI_IRSI)[colnames(ZHVI_IRSI) == "Adjusted.gross.income..AGI."] <- "MedianHouseholdIncome"
colnames(ZHVI_IRSI)[colnames(ZHVI_IRSI) == "Zhvi"] <- "ZillowHomeValueIndex"
View (ZHVI_IRSI)

# Retain zip codes only in the range "00501 and 99950"
ZHVI_IRSI <- filter(ZHVI_IRSI,(ZHVI_IRSI$`Zip Code` >= 00501 & ZHVI_IRSI$`Zip Code` <=99950))
View(ZHVI_IRSI)

write.csv(ZHVI_IRSI, 'ZHVI_IRSI.csv', row.names = FALSE)
View(ZHVI_IRSI)

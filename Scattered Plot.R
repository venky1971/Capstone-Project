# Get Working Directory of the current project
getwd()

# Set Working Directory where the file resides'
setwd("F:/Janaki & Venky/Data Science/Capstone-Project")

# Load packages
library(ggplot2)
library(dplyr)

# Data Import to R and create the dataframe.
ZHVI_IRSI <- read.csv("ZHVI_IRSI.csv")
str(ZHVI_IRSI)
View(ZHVI_IRSI)

# Plot a scatter plot
 ggplot(ZHVI_IRSI, aes(x = ZHVI_IRSI$Zillow.Home.Value.Index, y = ZHVI_IRSI$Median.Household.Income)) +
   geom_point()
 
 


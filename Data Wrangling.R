library (dplyr)
library (tidyr)

# Data Import to R and creates the dataframe.
# Dataset contains 14769 rows.
ZHVI <- read_csv("ZHVI Summary.csv") %>%
  glimpse()

# Dataset contains 27790 rows.
IRSI <- read_csv("IRS Income By Zip Code.csv") %>%
  glimpse()

# Retain RegionName aka "Zipcode", City, State and ZHVI columns
# ZHVI - Change column name from RegionID to ZIPCODE
ZHVI <- ZHVI %>% 
  select(RegionName, City, State, Zhvi) %>%
  rename(Zipcode =  RegionName, Zillow_Home_Value_Index = Zhvi ) %>%
  glimpse()

# select only Zipcode and AGI columns  
IRSI <- IRSI %>% 
  select(ZIPCODE, `Adjusted gross income (AGI)`) %>%
  rename(Zipcode = ZIPCODE, Adjusted_Gross_Income = 'Adjusted gross income (AGI)') %>% 
  glimpse()

# Merge ZHVI and IRSI by Zipcode using left join.
# Remove rows if the income data is NA or blank for zip codes.
# Retain zip codes only in the range "00501 and 99950".
# Instead of left join, Merge is possible too.
ZHVI_IRSI <- left_join(ZHVI,IRSI,by="Zipcode") %>%
  na.omit() %>%
  filter(Zipcode >= 00501 & Zipcode <= 99950) %>%
  glimpse()
# Print CSV File
write_csv(ZHVI_IRSI, 'ZHVI_IRSI.csv')
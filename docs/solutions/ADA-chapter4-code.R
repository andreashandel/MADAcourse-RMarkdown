# ADA Chapter 4 Code


# Load packages
library(readr)
library(dplyr)
library(maps)

# Load data
ozone <- read_csv("hourly_44201_2014.csv", col_types = "ccccinnccccccncnncccccc")
names(ozone) <- make.names(names(ozone))

# Looking at full dataset
nrow(ozone)
ncol(ozone)
str(ozone)
head(ozone[, c(6:7, 10)])
tail(ozone[, c(6:7, 10)])

#Looking at time
table(ozone$Time.Local)
filter(ozone, Time.Local == "13:14") %>% select(State.Name, County.Name, Date.Local, Time.Local, Sample.Measurement)
filter(ozone, State.Code == "36" & County.Code == "033" & Date.Local == "2014-09-30") %>% 
  select(Date.Local, Time.Local, Sample.Measurement) %>% as.data.frame

#look at states
select(ozone, State.Name) %>% unique %>% nrow
unique(ozone$State.Name)

#looking at summary statistics for one of the measurements
summary(ozone$Sample.Measurement)
quantile(ozone$Sample.Measurement, seq(0, 1, 0.1))

#make a plot
par(las = 2, mar = c(10, 4, 2, 2), cex.axis = 0.8)
boxplot(Sample.Measurement ~ State.Name, ozone, range = 0, ylab = "Ozone level (ppm)")

#draw a map
map("state")
abline(v = -100, lwd = 3)
text(-120, 30, "West")
text(-75, 30, "East")

ozone$region <- factor(ifelse(ozone$Longitude < -100, "west", "east"))
group_by(ozone, region) %>%
    summarize(mean = mean(Sample.Measurement, na.rm = TRUE), median = median(Sample.Measurement, na.rm = TRUE))
boxplot(Sample.Measurement ~ region, ozone, range = 0)

# Challenge Your Solution
filter(ozone, State.Name != "Puerto Rico" & State.Name != "Georgia" & State.Name != "Hawaii") %>%
  group_by(region) %>% 
  summarize(mean = mean(Sample.Measurement, na.rm = TRUE), median = median(Sample.Measurement, na.rm = TRUE))

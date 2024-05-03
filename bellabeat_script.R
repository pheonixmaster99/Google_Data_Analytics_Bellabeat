# STEP 1 - LOAD THE PACKAGES
install.packages('tidyverse')
install.packages('janitor')
install.packages('lubridate')
install.packages('sqldf')

library('tidyverse')
library('janitor')
library('lubridate')
library('sqldf')

# STEP 2 - PREPARE THE DATA
daily_acitivity <- read.csv('dailyActivity_merged.csv')
daily_sleep <- read.csv('sleepDay_merged.csv')
daily_calories <- read.csv('dailyCalories_merged.csv')
daily_steps <- read.csv('dailySteps_merged.csv')
daily_intensity <- read.csv('dailyIntensities_merged.csv')
weight <- read.csv('weightLogInfo_merged.csv')

head(daily_acitivity)
head(daily_sleep)
head(daily_calories)
head(daily_steps)
head(daily_intensity)
head(weight)

# STEP 3  - DATA CLEANING AND EXPLORATION
n_distinct(daily_acitivity$Id)
n_distinct(daily_calories$Id)
n_distinct(daily_intensity$Id)
n_distinct(daily_steps$Id)
n_distinct(daily_sleep$Id)
n_distinct(weight$Id)
n_distinct(steps_hourly$Id)

# N/A (Empty val)  Sums up values where no value is written
sum(is.na(daily_acitivity))
sum(is.na(daily_sleep))
sum(is.na(daily_calories))
sum(is.na(daily_steps))
sum(is.na(daily_intensity))
sum(is.na(steps_hourly))

# Duplicates Check - Sums up the total amount of duplicates within each dataset
sum(duplicated(daily_acitivity))
sum(duplicated(daily_sleep))
sum(duplicated(daily_calories))
sum(duplicated(daily_steps))
sum(duplicated(daily_intensity))
sum(duplicated(steps_hourly))

# remove dupicates from each dataset
daily_acitivity <- daily_acitivity[!duplicated(daily_acitivity),]
daily_sleep <- daily_sleep[!duplicated(daily_sleep),]
daily_calories <- daily_calories[!duplicated(daily_calories),]
daily_steps <- daily_steps[!duplicated(daily_steps),]
daily_intensity <- daily_intensity[!duplicated(daily_intensity),]

# Removed LoggedActivitiesDistance and SedentaryActiveDistance columns from the array
# as they do not give important information.
daily_acitivity <- daily_acitivity[c(-6, -10)]
colnames(daily_acitivity)[2] = "Date"
head(daily_acitivity)

# Separate the SleepDay column into two separate vectors called "Date" and "Time"
daily_sleep <- separate(daily_sleep, SleepDay, into = c('Date', 'Time'), sep = " ")
head(daily_sleep)

# Rename column 2 "ActivityDay" to "Date"
colnames(daily_calories)[2] = "Date"
head(daily_calories)

# Rename column 2 "ActivityDay" to "Date"
colnames(daily_steps)[2] = "Date"
head(daily_steps)

# Rename column 2 "ActivityDay" to "Date"
colnames(daily_intensity)[2] = "Date"
head(daily_intensity)

# Separate ActivityHour column into two separate vectors called "Date" and "Time"
steps_hourly <- separate(steps_hourly, ActivityHour, into = c('Date', 'Time'), sep = '(?<=\\S)\\s')

# STEP 4 - ANALYZE 
# daily_activity
daily_acitivity %>%
  select(TotalSteps, 
         TotalDistance,
         SedentaryMinutes, 
         Calories) %>%
  summary()

daily_acitivity %>%
  select(VeryActiveMinutes,
         FairlyActiveMinutes,
         LightlyActiveMinutes) %>%
  summary()

# daily_sleep
daily_sleep %>%
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()

# STEP 5 - VISUALIZE
# Merged Data
merged_data <- merge(daily_sleep, daily_acitivity, by = c('Id', 'Date'))
head(merged_data)

# TotalMinutesAsleep v. TotalSteps
ggplot(data = merged_data, aes(x = TotalSteps, y = TotalMinutesAsleep)) + geom_point() + geom_smooth() + labs(title = "Total Minutes Asleep v. Total Steps")
cor_1 <- cor(merged_data$TotalSteps, merged_data$TotalMinutesAsleep, method = c("pearson", "kendall", "spearman"))
cor_1 #Weak Correlation

# SedentaryMinutes v. LightlyActiveMinutes
ggplot(data = merged_data, aes(x = LightlyActiveMinutes, y = SedentaryMinutes)) + geom_point() + geom_smooth() + labs(title = "SedentaryMinutes v. LightlyActiveMinutes")
cor_2 <- cor(merged_data$LightlyActiveMinutes, merged_data$SedentaryMinutes, method = c("pearson", "kendall", "spearman"))
cor_2 #Weak Correlation

# SedentaryMinutes v. TotalSteps
ggplot(data = merged_data, aes(x = TotalSteps, y = SedentaryMinutes)) + geom_point() + geom_smooth() + labs(title = "SedentaryMinutes v. TotalSteps")
cor_3 <- cor(merged_data$TotalSteps, merged_data$SedentaryMinutes, method = c("pearson", "kendall", "spearman"))
cor_3 # Weak Correlation

# Calories v. TotalSteps
ggplot(data = merged_data, aes(x = TotalSteps, y = Calories)) + geom_point() + geom_smooth() + labs(title = "Calories v. TotalSteps")
cor_4 <- cor(merged_data$TotalSteps, merged_data$Calories, method = c("pearson", "kendall", "spearman"))
cor_4 # Moderate Positive Correlation

# TotalMinutesAsleep v. SedentaryMinutes
ggplot(data = merged_data, aes(x = SedentaryMinutes, y = TotalMinutesAsleep)) + geom_point() + geom_smooth() + labs(title = "TotalMinutesAsleep v. SedentaryMinutes")
cor_5 <- cor(merged_data$SedentaryMinutes, merged_data$TotalMinutesAsleep, method = c("pearson", "kendall", "spearman"))
cor_5 # Strong Negative Correlation

# TotalMinutesAsleep v. TotalTimeInBed
ggplot(data = merged_data, aes(x = TotalMinutesAsleep, y = TotalTimeInBed)) + geom_point() + geom_smooth() + labs(title = "TotalMinutesAsleep v. TotalTimeInBed")
cor_6 <- cor(merged_data$Date        , merged_data$TotalTimeInBed, method = c("pearson", "kendall", "spearman"))
cor_6 # Strong Positive Correlation

# Total Steps v. Time
ggplot(data = steps_hourly, aes(x = Time, y = StepTotal)) + geom_point() + labs(title = "Total Steps v. Time")

# aggregate the data by day of week to summarize averages
# Convert Date to Date object with the correct format
merged_data <- merged_data %>%
  mutate(Date = as.Date(Date, format = "%m/%d/%Y")) 
# Check if the dates have been properly converted
head(merged_data)

# Calculate 'day' as day of the week
merged_data <- merged_data %>%
  mutate(day = wday(Date, label = TRUE))

summarized_activity_sleep <- merged_data %>%
  group_by(day) %>%
  summarise(
    AvgDailySteps = mean(TotalSteps, na.rm = TRUE),
    AvgAsleepMinutes = mean(TotalMinutesAsleep, na.rm = TRUE),
    AvgAwakeTimeInBed = mean(TotalTimeInBed, na.rm = TRUE),
    AvgSedentaryMinutes = mean(SedentaryMinutes, na.rm = TRUE),
    AvgLightlyActiveMinutes = mean(LightlyActiveMinutes, na.rm = TRUE),
    AvgFairlyActiveMinutes = mean(FairlyActiveMinutes, na.rm = TRUE),
    AvgVeryActiveMinutes = mean(VeryActiveMinutes, na.rm = TRUE),
    AvgCalories = mean(Calories, na.rm = TRUE),
    .groups = "drop"  # This ensures that the resulting tibble doesn't carry over grouping
  )

# View results
head(summarized_activity_sleep)

ggplot(data = summarized_activity_sleep, aes(x = day, y = AvgDailySteps)) + geom_col(fill = "red") + labs(title = "Average Daily Step Count")



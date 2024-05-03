# Google Data Analytics - bellabeat Case Study

# Introduction
  In this case study, I will perform the real-world tasks of a junior data analyst at a fictional company - bellabeat. The answer of key business questions, will be done through the data analyst process: Ask, Prepare, Process, Analyze, Act, and Share. 

## bellabeat (About the Company)
Urška Sršen and Sando Mur founded Bellabeat, a high-tech company that manufactures health-focused smart products. Sršen used her background as an artist to develop beautifully designed technology that informs and inspires women around the world. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their own health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women. 

By 2016, Bellabeat had opened offices around the world and launched multiple products. Bellabeat products became available through a growing number of online retailers in addition to their own e-commerce channel on their website. The company has invested in traditional advertising media, such as radio, out-of-home billboards, print, and television, but focuses on digital marketing extensively. Bellabeat invests year-round in Google Search, maintaining active Facebook and Instagram pages, and consistently engages consumers on Twitter. Additionally, Bellabeat runs video ads on Youtube and display ads on the Google Display Network to support campaigns around key marketing dates.

Sršen knows that an analysis of Bellabeat’s available consumer data would reveal more opportunities for growth. She has asked the marketing analytics team to focus on a Bellabeat product and analyze smart device usage data in order to gain insight into how people are already using their smart devices. Then, using this information, she would like high-level recommendations for how these trends can inform Bellabeat marketing strategy

# Ask
## Business Task
Use smart device usage data to gain an insight into how consumers are already using their non-Bellabeat smart devices. These insights are then used to inform the marketing strategy of Bellabeat's products.

The three key questions that guide the marketing strategy:
1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help influence Bellabeat marketing strategy?

## Stakeholders
- Urška Sršen: Bellabeat’s cofounder and Chief Creative Officer
- Sando Mur: Mathematician and Bellabeat’s cofounder; key member of the Bellabeat executive team
- Bellabeat marketing analytics team: A team of data analysts responsible for collecting, analyzing, and
reporting data that helps guide Bellabeat’s marketing strategy. You joined this team six months ago and have
been busy learning about Bellabeat’’s mission and business goals — as well as how you, as a junior data analyst,
can help Bellabeat achieve them.

# Prepare
## Data Collection
The data being used in this case study can be found here: 
[FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit) CC0: Public Domain, dataset made available through [Mobius](https://www.kaggle.com/arashnic).

The data is stored and uploaded in R Studio. This Kaggle data set contains personal fitness tracker from thirty fitbit users. Thirty eligible Fitbit users consented to the submission of personal tracker data, including minute-level output for physical activty, heart rate, and sleep monitoring. It includes information about daily activity, steps, and heart rate that can be used to explore users' habits. The dataset contains 18 csv files organized in long format. Below is a breakdown of the data using the ROCCC approach:

- Reliability (Low): The data comes from 30 firbit users who consented to the submission of personal tracker data, inlcuding minute-level output for physical activity, heart rate, and sleep monitoring.
- Original - LOW: Third party data collect using Amazon Mechanical Turk.
- Comprehensive - MED: The dataset contains multiple fields on daily activity intensity, calories used, daily steps taken, daily sleep time and weight record.
- Current - LOW: This data is from March 2016 through May 2016. The data is not current, meaning that user habits may have changed over the years.
- Cited - LOW: Data was collected from a third party, therefore unknown.

# Process 
The tool being used to analyze this is R for cleaning and visualization purposes. 

## Importing Datasets
As such, the first step was to install and load packages such as **Tidyverse**, **Janitor**, **Lubridate**, and **Dplyr** as seen below.

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/d5b6daa6-531a-4ff5-86e4-2faeb3557798)

Subsequently, the files were imported into RStudio and were made into dataframes using the **read_csv** function.

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/4a6ecbf7-0d30-4639-9568-b67f016818d1)
The image below showcases an example of the top rows from the **daily_activity** dataframe created. 

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/73c2e1fd-8b70-48b5-a15b-038bdd9ff0fc)

## Data Cleaning & Data Exploration
Before going any further, it is important to realize how many distinct participants across all the above dataframes. 

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/1c69cb3e-71f6-406e-9be5-c41165303c19)

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/b2391128-642f-4735-8b52-0f8c42e3a79c)

To summarize the daa above, there are 33 participants in the dataframes of **daily_activity**, **daily_calories**, and **daily_intensity**, 24 in the **daily_sleep** dataframe, and only 8 in the **weight** dataframe. As there are only 8 participants within the weight dataset, it will not be utilized as more data is needed to make stronger reccommendations or conclusions. 

We now need to perform a proper cleanup of all the other remaining datasets by checking if there are any empty values, and duplicate datasets. As seen in the image below, there are no empty cells within the dataframe. 

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/855de6ff-b73d-4dc0-9a84-2249e05a9e16)

The image below showcases a sum of all the duplicate cells and then removes them. 
![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/3c564367-e098-4cab-bd11-475e42af62fb)
![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/df24e1ca-0381-44b3-843c-05f0e2536832)

Finally, we perform some changes to the column description of the datasets we care about, and also remove some columns from the dataset altogether. The image below for the **daily_activity** dataset showcases the renaming the the column called "ActivityDay" to "Date", alongside removing certain columns to make the data easier to read by having only necessary columns we want for analysis. 

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/f131f6e5-b36c-42a6-a01c-351d17528fd8)

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/9e3da3d3-9e45-4eec-b70f-ce37aad403a3)

For the datasets of **daily_sleep**, **daily_calories**, **daily_steps**, and
**daily_intensity**, the column name has been changed from "ActivityDay" to "Date". In addition, for the **daily_sleep** dataset, the date and time row is separated into two columns as well, called "Date" and "Time", respectively. 

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/02cd13af-daac-4c7d-90e8-13ac7745ad8a)

An example of the dataframe for the **daily_sleep** dataset is given below.
![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/f890ef32-6e07-4a32-8917-8c36a4e36cda)

With this, the entire cleaning and exploration process of the data is complete. 

# Analyze
The business task we have to solve for is **"[Using] smart device usage data to gain an insight into how consumers are already using their non-Bellabeat smart devices."**. The task will be solved by obtaining answers to the following questions:
1) What usages are the current non-Bellabeat devices mainly used for (e.g. sleep, exercise, stress)?
2) What time of the day, is the data collected the most often? Any variation in pattern between morning, afternoon, and evening?

Together, these questions set the framework of how to approach answering this bsiness task, as insight into how non-Bellabeat smart devices are currently used gives us an insight into how Bellabeat could be poentially further targeted towards those market segments. 

To answer the above questions, it is important to take a look at the summaries for the datasets of **daily_activity**, **daily_sleep**.

*Note: The daily_activity dataset contains the same rows as daily_calories, daily_steps, and daily_intensity datasets. For this reason, the summary was only determined using the daily_sleep and daily_activity datasets.*

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/688e32e2-f915-4e9a-b58b-916681fdbfd8)
![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/be0541c3-37c7-4df4-8fe0-637c6e03e0a1)

- daily_activity
  
![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/bb1e0553-2632-44ea-92f3-6c3ea9bb6279)
![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/105043ff-7d0c-47ef-8f37-6f97a400eeb1)

- daily_sleep

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/2ea4c5fb-839c-412a-a0a5-cc6d1c2a559f)

A couple of observations can be made from the summary above:
- The average steps taken by people each is 7638 steps. This is less in comparison to the recommended steps by CDC of [10,000 per day](https://www.mayoclinic.org/healthy-lifestyle/fitness/in-depth/10000-steps/art-20317391).
- The average amount of sedentary minutes per day was 16.5 hours! This means that on average, the lifestyle of the average participant is one with very little movement or exercise. This further is evidenced when realizing that majority of participants are only lightly active for 3 hours per day and not fairly/very active meaning not much physical activity is done.
-  The total distance walked by the average participant is 5.5km approximately. The CDC recommends that the average person walks 8km per day.
-  The average amount of calories consumed per day is 2304 calories.  
- The average time slept by people is approximately 7 hours.This falls in line for adults who are the participants for this [study](https://www.mayoclinic.org/healthy-lifestyle/adult-health/expert-answers/how-many-hours-of-sleep-are-enough/faq-20057898).

# Share 
## Merging the Data
Before visualizing the data, two of the datasets will be merged. The merger will be done through the usage of inner joining the daily_activity and daily_sleep datasets through the 'Id' and 'Date' columns.

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/205a97e5-9c00-487c-bb42-503ae15897cf)

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/72302396-1b95-4ca5-a4bb-a5c32f8d316b)

Now, we will look at three cases of scatterplots to understand how devices similar to Bellabeat are being currently used to inform our findings. Consider the first plot below, which is that of
'Calories v. TotalSteps'

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/49dd40d6-db27-4292-8037-a4942ac50a84)

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/28ebc4b4-3209-4a8f-b6ae-5c21072a520f)

In this image above, we can clearly see that there is correlation between the total steps a participant takes each day and the amount of calories burned. We can quanitfy this further by looking at the correlation coefficient as shown below.

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/bdd15e62-2738-4778-9c59-73dd3e370710)

The Pearson correlation coefficient showcases a value of 0.4 approximately, thus indicating a moderately positive correlationship. This means that the more steps the particpant walks/runs in a day, the more the calories the participant will consume. 

The next plot we look at is that of TotalMinutesAsleep v. TotalTimeInBed as seen below.

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/03f7acb3-c208-4574-934f-7ba8c076fd4d)

In the image above, we can clearly see a positive correlation between the amount of time a person spent in bed to the amount of time they were asleep. In other words, the greater the participant slept, the more time they spent in bed. This is further evidenced by the correlation coefficient of 0.93 approximately.

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/4c4a8f1a-ff2d-4e5d-ad19-fd823bd3d381)

In order to assist users with their sleep quality, Bellabeat should allow customers to set and customize their sleep schedules according to their sleep schedules to ensure consistency. 

The final scatterplot we will look at will be TotalMinutesAsleep v. SedentaryMinutes. 

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/f7a86caa-73a4-4c2b-9dd6-7a8b54429953)

In the image above, we can clearly see a strong negative correlationship. This means that the less active a partcipant is, the less sleep they tend to get. This is also further evidenced by the correlation coefficient as seen below.

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/89fcf019-6270-4e3c-9e7e-722dc6a7dec3)

Finally, let's take a look at whether the day of the week, affects the activity levels and sleep. 

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/53dc1618-3c82-47e6-857c-966949b1d85c)

![image](https://github.com/pheonixmaster99/Google_Data_Analytics_Bellabeat/assets/91801911/6e273b66-81c7-4ad0-a92b-6825469430ad)

The bar graph above showcases that particpants are the most active on Saturday and the least active on Sunday. 


# Act
After analyzing the FitBit Fitness Tracker data, here are some reccommendations for the Bellabeat marketing strategy based on trends in smart device usage. 

1. As mentioned before, the average number of steps per day is 7,638. The CDC recommends taking a minimum of 10,000 steps per day. According to CDC, taking more steps per day is associated with a progressively lower risk of mortailty which varies by age. Thus, **one strategy that Bellabeat can implement is prompting the user of the device to take 10,000 steps per day atleast.** Bellabeat can combine that with daily notifications, with the the user being able to choose how much they want to be notified.
2.  As the majority of the participants are lightly active, Bellabeat should offer a progression system that provides a pathway for its users to progress in terms of physical activity and thereby, encourage the users to become fairly active. In addition to this, associate a positive stiumli for the user upon the completion of each level of progression. This positive stimuli could be in the form of badges, membership benefits, and small gifts that encourage the user to further their gains.
3.  To help users improve their quality of sleep, Bellabeat should consider using app notifications the reminds users to get enough rest, alongside prompting them for a set bed time. In addition to this, the app should also remind people activities to do throughout the day to help them reduce their sedentary time. This could be range from brisk walking to jogging around the neighbourhood.
4.  Bellabeat can also ideas on potential low calorie food throughout the day that covers breakfast, lunch, and dinner in order to assist the participants to help lose weight.
5.  Bellabeat should target for more activity to be done either at early morning or in the evening. This is specifically because from morning to evening is a common working day for every participant. Thus, optimizing the notification in the early or evening hours of the day, will remind the participant more frequently to do exercise, when their mind is less occupied with job tasks. 

## Next Steps to Expand Findings
1. Additional data on that is reliable needs to be collected, as the quantity of data was too low to make a definitive conclusion. Additional data such as [heart rate variabilty](https://www.healthline.com/health/stress/stress-measurement#measuring-stress) should be collected to understand the stress levels a person is experiencing and tailor the app to respond to such stress levels. The variation in time between consecutive heartbeats, gives an insight into the mental state of the person (e.g. whether the person is feeling stressed or not)
2. The data should also be current and not old to get an accurate assessment of the daily habits of the users. As the data was from 2016, it is hard to extrapolate the data to 2024 simply because the habits of the participants could have changed.  

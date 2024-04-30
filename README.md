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

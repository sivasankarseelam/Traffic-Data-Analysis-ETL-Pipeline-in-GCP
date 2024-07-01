# Traffic-Data-Analysis-ETL-Pipeline-in-GCP!
# Data Pipeline Architecture
![image](https://github.com/sivasankarseelam/Traffic-Data-Analysis-ETL-Pipeline-in-GCP/assets/133698242/94b6180a-5c64-48da-93bc-f07ac007e998)
Traffic Flow Data Analysis in London Boroughs ETL Pipeline:

## Overview:
This report aims to analyze and present traffic flow variations across different boroughs in London. The study focuses on several key aspects of traffic patterns, including peak hour trends, average traffic counts, daily variations, and differences between weekdays and weekends. Additionally, it compares current traffic data with historical data from previous years to identify any significant changes.

## Problem Statement:
Key Questions Addressed:
1. How does traffic flow vary across different boroughs in London?
2. What are the traffic trends on different types of roads during peak hours?
3. Which boroughs experience the highest and lowest traffic counts on average?
4. How does the traffic count vary throughout the day across different boroughs?
5. How do traffic patterns differ between weekdays and weekends?
6. How do current traffic counts compare to historical data from previous years?

## Data Description:

There are 2 datasets to get accomplish the complete traffic analysis in London with the names of "1_Monitoring_locations.csv" and "2014_jan_march.csv" respectively. "1_Monitoring_locations.csv" consists of 2173 records and 11 columns, "2014_jan_march.csv" comprises of 50561 rows and 11 columns. 

 1_Monitoring_locations  A reference table of all currently defined count locations, including their unique ID, coordinates (in UK Grid eastings and northings as well as latitude and longitude), information about their location (site description, borough, area of London and road type) as well as other useful information for the user (old location ID and a flag to show whether that location is part of the strategic panel of cycle counts which are used to calculate TfL’s cycling volume estimates).
 
2014_jan_march.csv  A collection of CSV files by wave, area and/or location type with all the counts data in the new, unified format described in the table below:

Year: Indicates the wave (quarter or season) that the counts represent. This may differ from the date that the counts took place if adjustment factors have been applied. However, this field is the only ‘date’ filter that can be applied to the data. The ‘Date’ field below is only provided for reference and does not provide a meaningful filter.YYYY represents the year, for example 2018. QQ represents the calendar quarter, for example Q2.[season] takes the value ‘spring’ for Q2 and ‘autumn’ for Q4 but is blank otherwise.(Mmm-Mmm) specifies the months within that quarter, for example (Apr-Jun).
	
UnqID: Unique ID that identifies the count location.ML stands for ‘monitoring location’ and the numbers are continuous from 0001 onwards. Note that these revised IDs were firstly published in the early 2024 release. The 1 Count locations file includes the old IDs for reference, should they be needed.
	
Date: Date when the counts took place. This may not correspond to the wave that the counts represent if adjustment factors have been applied (see ‘Year’ above). This field is for information only and should not be used to filter the dataset. The only meaningful ‘date’ filter is that for the wave on the ‘Year’ column.
	
Weather: Description of the weather at the time and location of the count.

Time: Start time of the quarter hour represented by the count, where HH is the hour in 24-hour format, MM the minute (one of 00, 15, 30 or 45) and SS the seconds (always 00). For example, if the time given is 13:45:00, the count represents flows between 13:45 and 14:00.
	
Day: Indicates whether the count was done on a weekday or weekend.

Round: Character indicating the iteration (‘round’) of the given count location-wave combination when multiple counts of the same location took place in the same wave of counts (in order to have several data points to take an average and mitigate the impacts of day-today variability in traffic flows).Characters A to I represent weekdays while characters T to Y represent weekends. 
	
Dir: Direction of travel of the flows counted on the path given by the ‘Path’ field below.
	
Path: Indicates the part of the road where the counts took place. When a direction is indicated on the name, this refers to the side of the road on which the path lies (using as a reference the expected travel direction of general traffic if it was a ‘drive on the left’ bidirectional road) and not the travel direction of the vehicles on that path (this is given by the ‘Dir’ field above).	

Mode: Indicates the road user class being counted.
	
Count: Total flow corresponding to the above parameters.

## Pipeline Workflow Architecture- GCP:
I will outline the data pipeline workflow implemented on Google Cloud Platform (GCP). This workflow involves several key steps, from data ingestion to transformation and finally visualization.

#### Workflow Steps:
1.  Data Ingestion
Initial Data Storage: The raw data is initially stored on a local PC.
Uploading to Google Cloud Storage: Using a Docker script, the raw data is ingested from the local PC to Google Cloud Storage (GCS).

2. Cluster Creation
Setting Up a Cluster: A 2-node cluster with standard configurations is created based on the data file size. This setup leverages parallel processing to handle the data efficiently.

3. Data Transformation with Apache Spark
Applying Transformations: Apache Spark is used to apply transformations to the data across the cluster. This step involves cleaning the data and removing unnecessary information to get it into a usable format.
Storing Transformed Data: The cleaned and transformed data is stored back in GCS in a separate folder designated for transformed data.
4. ETL Pipeline Orchestration
Using Mage for Orchestration: A Docker container running the Mage application is used as an orchestration tool. Mage integrates the data source and target location and provides additional functionality for scheduling ETL (Extract, Transform, Load) jobs.
Building the ETL Pipeline: Within Mage, an ETL pipeline is built to perform necessary transformations before the data is loaded into the data warehouse.

5. Loading Data into Google BigQuery
Final Transformations and Loading: After all transformations are completed in Mage, the data is loaded into Google BigQuery, which serves as the data warehouse.
6. Data Analysis and Visualization
Analyzing Data: BigQuery is used to fetch answers to analytical problems based on the given problem statements.
Visualization with Looker Studio: The results are then connected to Looker Studio, a visualization tool, to create pictorial representations of the data. This helps in presenting the solution effectively to the staff.






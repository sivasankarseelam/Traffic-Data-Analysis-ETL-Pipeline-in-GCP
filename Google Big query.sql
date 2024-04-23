-- Query 1: How does traffic flow vary across different boroughs in London?
SELECT Borough, 
       COUNT(*) AS Traffic_Count 
FROM `datazoomcamp-project-420918.cycling_data.final_df`
GROUP BY Borough
ORDER BY Traffic_Count DESC;

-- Query 2: What are the traffic trends on different types of roads during peak hours?
SELECT Road_type, 
       Time, 
       COUNT(*) AS Traffic_Count 
FROM `datazoomcamp-project-420918.cycling_data.final_df`
WHERE Time IN ('Morning', 'Afternoon', 'Evening')
GROUP BY Road_type, Time
ORDER BY Road_type, Time;

-- Query 3: Which boroughs experience the highest and lowest traffic counts on average?
SELECT Borough, AVG(Count) AS Avg_Traffic_Count 
FROM `datazoomcamp-project-420918.cycling_data.final_df`
GROUP BY Borough
ORDER BY Avg_Traffic_Count DESC;

-- Query 4:How does the traffic count vary throughout the day across different boroughs?
SELECT Time, COUNT(*) AS Traffic_Count 
FROM `datazoomcamp-project-420918.cycling_data.final_df`
GROUP BY Time
ORDER BY Time;

-- Query 5:How do traffic patterns differ between weekdays and weekends?
SELECT 
  CASE 
    WHEN Day IN ('Saturday', 'Sunday') THEN 'Weekend' 
    ELSE 'Weekday' 
  END AS Day_Type, 
  AVG(Count) AS Avg_Traffic_Count 
FROM `datazoomcamp-project-420918.cycling_data.final_df`
GROUP BY Day_Type
ORDER BY Day_Type;

-- Query 6:How do current traffic counts compare to historical data from previous years?
SELECT 
  EXTRACT(YEAR FROM CURRENT_DATE()) AS Current_Year, 
  EXTRACT(MONTH FROM CURRENT_DATE()) AS Current_Month, 
  AVG(Count) AS Avg_Traffic_Count
FROM `datazoomcamp-project-420918.cycling_data.final_df`
GROUP BY Current_Year, Current_Month
ORDER BY Current_Year, Current_Month;
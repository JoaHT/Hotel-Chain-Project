# PROJECT OVERVIEW: DEVELOP A DATABASE TO ANALYZE AND VISUALIZE HOTEL BOOKING DATA

# [Power BI Visualization](https://app.powerbi.com/Redirect?action=OpenReport&appId=eeaeff4c-a31f-428b-b715-94f43b4b6255&reportObjectId=f182c83b-cd96-4a76-91ab-a67004188886&ctid=d05bc23a-4bdc-426f-b7f9-fede45cfbd56&reportPage=89cab110b6d868201da1&pbi_source=appShareLink&portalSessionId=924aa473-1ee2-4b98-bdaa-3b3f11e3611f)

In this project we are going to answer two questions: "Is the hotel revenue growing by year?" segmentet by hotel type and "Should we increase the parking lot size?". Firstly, we are building a database, then developing the SQL Query, then we connect Power BI to the Database, before we visualize and summarize our findings. 

STEP 1: Create our database in Microsoft SQL Server Management Studio.

STEP 2: Import our Excel file into the database.

STEP 3: Because we have multiple year tables that we want to connect, we use the SQL Union function, to add them on to each other.
	
	SELECT * FROM dbo.['2018$']
	union
	SELECT * FROM dbo.['2019$']
	union
	SELECT * FROM dbo.['2020$'])

STEP 4: We create a temporary table with the union function above, so we can keep doing EDA on the dataset before we start visualizing.
	
	WITH hotels AS (
	SELECT * FROM dbo.['2018$']
	union
	SELECT * FROM dbo.['2019$']
	union
	SELECT * FROM dbo.['2020$'])

STEP 5: We then join the tables market_segment and meal_costs to the new table, as this new table is the one we want to use in Power BI.
	
	SELECT * FROM hotels
	LEFT JOIN dbo.market_segment$ 
	ON hotels.market_segment = market_segment$.market_segment
	LEFT JOIN dbo.meal_cost$
	ON hotels.meal = meal_cost$.meal


STEP 6: In Power BI we "Get Data" from a SQL Server Database that we just created, and paste our SQL code in the SQL statement to make sure we get the data we want. 

STEP 7: Create a new measure called Revenue, so we can answer one of the questions of the project. 

STEP 8: Add a new measure called Total Nights

STEP 9: First we create some Card visuals to portray sum of revenue, average of the average daily rate (adr), total nights, the average discount and number of car spaces. 

STEP 10: We then add a Line visual of the sum of revenue over time by hotel, which will be important for us to answer the first question of the project.

STEP 11: Then we add sparkline visuals under the Card visuals, and add a trend line, making a small but impactful visual of the change of each Card's data over time.

STEP 12: Under the Line visual, we make a Matrix visual to work as a collapsible table with important information such as sum of revenue, car parking spaces and parking percentage. All of this is separated by year and by hotel type. This visual is our primary visual we use to answer the second question of the project. 

STEP 13: Lastly we add a Pie visual portraying the revenue by hotel, which shows us that they are relatively close in revenue, with the city hotel earning 53%.

# INSIGHTS: 
Based on the line chart and matrix of the dashboard, we can see that the revenue from 2018 to 2019 grew rapidly, however that is not the case from 2019 to 2020. Where the revenue has gone from roughly 5.5 Million to 3.5 Million. At first glance one could argue that the revenue is declining, however its important to take into account the situation in 2020 being peak covid. With this situation in mind, I believe it's fair to say that the Revenue for the hotel is growing, albeit hampered by Covid. 

The second question of the car parking is answered through the matrix visual, which shows that the parking percentage is roughly around 2%. For the Resort Hotel, it looks to be steady at around 3.5%, while the City Hotel is around 1%. Meaning that there is no need for the hotel branch to increase the parking lot size, as there is plenty of space left.

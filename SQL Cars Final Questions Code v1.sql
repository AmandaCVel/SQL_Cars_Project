/*Now that the foundation is done, time to move on to answering a few questions. 
...questions to practice different types of statements, operators,


Here are a few questions that are to be answered through SQL:
	1) How many vehicles are from each country?
	2) What are the Top 3 vehicles with the highest Acceleration, Horsepower, MPG?
	3) How many vehicles from ___ (Origin) have a Horsepower between ___ and ___?
	4) What is the average weight of cars, outside the US? (I end up finding the average in the US as well)
	5) How many different Makes are there?
	6) Out of all the different Makes, how many different Models per Make? (I might've combined Questions 5 & 6)
	7) Fastest (Horsepower/Acceleration) and lightest, is there a correlation?
	8) What make is ___?
	9) Similar Q - w/one or a few letters using the "find": %%vic (for Honda Civic) 
	10) Using the NOT Operator: Acceleration, show vehicles NOT w/ ## BETWEEN ##

*/





/*How many vehicles are from each country? 

In order to find the number of vehicles in each country use the COUNT() function

Picture: (1)
*/
SELECT 
	COUNT(CarID) AS CountForUS --Added the AS
INTO 
	Detailed_Info
WHERE 
	CarOrigin = ‘US’ 
;

/*How many vehicles are from each country? 

Picture: (1.2)
*/
SELECT 
	COUNT(CarID) AS CountForEurope 
INTO 
	Detailed_Info
WHERE 
	CarOrigin = ‘Europe’
;

/*How many vehicles are from each country? 

Picture: (1.3)
*/
SELECT 
	COUNT(CarID) AS CountForJapan 
INTO 
	Detailed_Info
WHERE 
	CarOrigin = ‘Japan’
;





/*Although there are corrections made to finding the answer, this question would be better represented through at least one graph. 


What are the top 3 vehicles with the highest Acceleration, Horsepower, and MPG?
The SELECT TOP clause will need to be used to find the top 3 vehicles for each requested column

 
Found out that the TOP___ doesn’t get the top or MAX results
The TOP____

Trying to get more than 1 result with highest Acceleration
I like that it’s going from smallest to greatest value but I want the highest 3 values according to the Acceleration (Added DESC)

Picture: (2.3.4)
*/

SELECT 
	CarID,
	CarMake,
	CarModel,
	MAX(CarAcceleration) AS [FastestStartVroomVroom],
	MAX(CarHorsepower) AS [FastestVroomVroom],
	MAX(CarMPG) AS [LongestLastingVroomVroom]
FROM 
	dbo.All_Info
ORDER BY 
	CarMake, CarModel, CarID
GROUP BY 
	Max(CarAcceleration) DESC
GO
;





/*How many vehicles from Europe have a Horsepower between ____ AND ____?

Picture: (3.1.1/3.1.2)
*/

SELECT 
	CarOrigin,
	CarHorsepower
FROM 
	dbo.All_Info
WHERE 
	CarOrigin = ‘Europe’
	AND CarHorsepower BETWEEN 25 AND 75
ORDER BY 
	CarHorsepower
;

/*How many vehicles from Origin have a Horsepower between ____ AND ____?

Picture: (3.1.3 - 3.1.6)
*/

SELECT 
	CarOrigin,
	CarHorsepower
FROM 
	dbo.All_Info
WHERE 
	CarOrigin = ‘Japan’
	AND CarHorsepower BETWEEN 75 AND 150
ORDER BY 
	CarHorsepower
;

/*How many vehicles from Origin have a Horsepower between ____ AND ____?

Picture: (3.1.7)
*/

SELECT 
	CarOrigin,
	CarHorsepower
FROM 
	dbo.All_Info
WHERE 
	CarOrigin = ‘US’
	AND TCarHorsepower BETWEEN 100 AND 200
ORDER BY 
	CarHorsepower
;





/*What is the average Weight of cars outside the US?
This query will use the AVG() function to find the average
TCarWeight and the NOT IN operator to exclude results from the US

Picture: (4.1.1/4.1.2)
*/

SELECT 
	CarOrigin,
	AVG(TCarWeight) AS AvgCarWeight
FROM 
	dbo.All_Info
WHERE 
	NOT CarOrigin = (‘US’)
GROUP BY 
	CarOrigin, 
	CarWeight
ORDER BY 
	AvgCarWeight
;





/*How many different car Makes are there?
This query will use the COUNT() function combined with the DISTINCT keyword
Using DISTINCT or not using it gives the same results
I’ll try an Inner Join

Picture: (5.1.4)
*/

SELECT 
	CarMake,
	COUNT(*) AS HowManyMakes
FROM 
	dbo.All_Info
GROUP BY
	CarMake
ORDER BY 
	HowManyMakes
;





/*Out of all the different car Makes, how many different Models are there?
This query will use the COUNT() function combined with the DISTINCT keyword
Needed to get rid of the TestCarID to get each Make COUNT

Picture: (6.1.1/6.1.2)
*/

SELECT 
	CarMake,
	CarModel,
	COUNT(*) AS HowManyMakes
FROM 
	dbo.All_Info
GROUP BY
	CarMake,
	CarModel
ORDER BY 
	CarModel
;





/*Fastest (TCarHorsepower / TCarAcceleration) AND lightest.
Is there a correlation?

Picture: (7.1.1 - 7.1.3)
*/

SELECT 
	CarMake,
	CarModel,
	MAX(TCarAcceleration) AS FastestStart,
	MAX(TCarHorsepower) AS Fastest,
	MAX(TCarWeight) AS Lightest
FROM 
	dbo.All_Info
GROUP BY
	CarMake,
	CarModel,
	CarWeight
ORDER BY 
	 CarWeight
;

--The results have concluded, that, no, there is no correlation between weight and speed
--In fact the Lightest vehicles seem to be the long lasting and most dependable





/*What Make is ___ (Model)?
To find the Make when given the Model, the WHERE and LIKE statements
the ‘%’ needs to be included

Picture: (8.1.1)
*/

SELECT 
	CarMake,
	CarModel
FROM 
	dbo.Common_Info
WHERE 
	CarModel LIKE ‘%i%’
;

/*What Make is ___ (Model)?

Can find many different results

Picture: (8.1.2)
*/

SELECT 
	CarMake,
	CarModel
FROM 
	dbo.Common_Info
WHERE 
	CarModel LIKE ‘%ie%’
;

/*What Make is ___ (Model)?

Can find many different results

Picture: (8.1.3)
*/

SELECT 
	CarMake,
	CarModel
FROM 
	dbo.Common_Info
WHERE 
	CarModel LIKE ‘%ic%’
;





/*A customer wants a vehicle that has “vic” in it but the don’t remember if it’s the Make or Model
I’ll use both columns to check

Picture: (9.1.1)
*/

SELECT 
	CarMake,
	CarModel
FROM 
	dbo.Common_Info
WHERE 
	CarModel LIKE ‘%vic%’ OR
	CarMake LIKE ‘%vic%’
;





/*Using the NOT Operator: Acceleration, show vehicles NOT w/ ## BETWEEN ##

*/
SELECT
	CarMake,
	CarModel,
	CarAcceleration
FROM
	dbo.All_Info
WHERE
	NOT CarAcceleration BETWEEN 11 AND 20
ORDER BY 
	CarAcceleration DESC
;
/*This is going to show the "skeleton" or foundation code for this database. 
This will aid in the execution of the other queries



First I'll go through the notes. 
The columns are:
	CarID
	Make
	Model
	MPG
	Cylinders
	Displacement
	Horsepower
	Weight
	Acceleration
	Year
	Origin (Country)

I wanted to have 3 Tables. 
	1) All_Car_Info - Which will hold all the columns
	2) Common_Car_Info - This will only have the columns: CarID, Make, Model, MPG, and Year
	3) Detailed_Car_Info - This will have the other columns: CarID, Cylinders, Displacement, Horsepower, Weight, Acceleration, Origin



3 Tables would work better in terms of differenciating the differences between common car information and detialed car information. 
The reasoning being that most people know of the common information while car enthusiasts will know a greater amount of detail.
Furthermore, car enthusists would be more interested in certain attributes/features that most people may not know about or may not
be concerned with.
Moreover, it's great practice to work with multiple tables! Gives me an opprotunity to work with different types of statements.



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



Now it's time for the foundation, this will help with answering the above questions.
Firstly, I used a Wizard to upload the Excel file containing the dataset. This was after some data cleaning and data
governance. The table name also changed (because when I was using the Wizard it gave it the original file name, the one
that it had when I first downloaded) this would be the dbo.Excel_Car_File.

*/



--First Table
SELECT *
	INTO All_Info --This will create the first table with all columns
	FROM dbo.Excel_Car_File
;

--Second Table
SELECT CarMake, CarModel, CarMPG, CarYear
INTO Common_Info --This will create the second table with necessary columns
FROM All_Info
;

--Third Table
SELECT CarCylinders, CarDisplacement, CarHorsepower, CarWeight, CarAcceleration, CarOrigin
INTO Detailed_Info --This will create the third table with necessary columns
FROM All_Info
;



/*There were some corrections that needed to be made.
I think this is the point where I realized I forgot to add the Primary Key (or PK) CarID
I also needed to rename the "Model1" to "CarYear" I realized it needed to be changed when there was an error with above code
*/

ALTER TABLE All_Info
ADD CarID int NOT NULL
IDENTITY PRIMARY KEY --Needed to add this line for PK to be added
(CarID)
;

--ALTER TABLE Test_All_Car_Info
SP_RENAME ‘dbo.All_Info.Model1’, ‘CarYear’
;




--Will need to add the CarID column to the newly created tables
ALTER TABLE All_Info
ADD CarID INT PRIMARY KEY
;

--Will need to add the CarID column to the second table 
ALTER TABLE Common_Info
ADD CarID INT PRIMARY KEY
;

--Will need to add the CarID column to the third table 
ALTER TABLE Detailed_Info
ADD CarID INT PRIMARY KEY
;


/*This is much better approach than my previous attempts. I had created 3 new tables after creating the PK.
I was not aware, at the time, I could've just added the PK to each individual table rather than creating new tables
with new names and redoing things. 
*/
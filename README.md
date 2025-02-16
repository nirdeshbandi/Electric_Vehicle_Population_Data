# Electric_Vehicle_Population_Data
Created Dashboard and managed, developed insights in Postgres sql

During this project i have experienced many problems like
1.while importing csv file into postgres database there are particularly many datatype conveersion issues have raised.
2.After importing the csv file in postgres database it got me to change all attributes to Text type while there are also numeric types are there.
3.At first i have thought it is because of my not doing of data cleaning process but even if i have done my cleaning process i still got errors.

HOW I APPROACHED TO COME WITH THE SOLUTION
1.We have to check the possible special characters with the querys
2.after the checking the special characters if it is present we have to replace or remove if it doesnt then nothing wrong with the data
3.In my case there have been NA values because during my cleaning process, i have replaced blank spaces with NA.
4.so i have removed all NA by update statement and replaced the special characters with null values.
5.At last i have finally got to change the type to Text to Numeric.

After changing my type i have done some insights based on the dataset.
1.counting total rows //223968
2.Distribution of EV Types
3.Top 5 Cities with Most EVs
4.Average Electric Range by Make
5.Vehicles by Legislative District
And many more 
Finally i have Created a Dashborad in Excel with the help of insights from postgres sql.  

Dashboard Preview




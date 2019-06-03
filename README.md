# Final-Project-chi-2
[proposal](https://docs.google.com/document/d/1mOep_lxr2LQLeeih9Deny1cFTdHPwkqYenRHi5idUKs/edit?usp=sharing)


Project Description

For this project we will analyze housing dataset to help people find the housing trend in greater Seattle, WA. We will mainly focus on the entire King County area. The dataset is provided by King County, Washington on Kaggle.com, with 21613 observations and 19 different house features plus the home ID and price. The data includes houses sold between May 2014 and May 2015, and it contains detailed information about housing, such as price, bedrooms, bathrooms, condition, and absolute locations (longitude and latitude). 

Our target audience group is 25-35 years old people who want to start a family and set up homes in Seattle. This group typically will be looking for homes which are suitable for their children, school, and work. In other words, our analysis will be mainly focusing on the following questions:

- Is the house big enough for children to have a playroom?
- Does it have enough bedrooms for parents and children?
- Does this house have appropriate price?
- Where is this house located?
- What is the condition of this house?
	

Technical Description (See above)

The dataset will be retrieved from Kaggle.com in .csv format. Therefore, we will read the data in R, and we will analyze the data by creating an interactive visualization platform. 

Data Wrangling

In general, the average size of a family house is around 3-bedroom and 3 bathrooms. Therefore, we will be filtering out houses that are extremely small, like one-bedroom house, as well as extremely big houses, like 6-bedroom houses. We will also be filtering out the observation that have no bedrooms or bathrooms recorded. 
There are many comments about typos in this dataset on Kaggle.com, therefore, we will clear our data by omitting those observations.

To save the memory and space of the workspace, we will delete some of the 19 house features. Because the total square feet of the house is provided, variables such as the lot size, basement size, and floors will be omitted. However, the absolute locations and other features related to our analysis will be kept in our dataset. At the end, only 9 variables out of 21 will be used in our project.

The major libraries we are going to use are ggplot2, jsonlite, and we are also going to elaborate more functions from libraries like tidyr which specialized functions like fill, and ggmap for plotting the points onto real map - easy to see the location of the map, and we can fill the points with different levels, like ones we did for A5 assignment. 

Questions that we will be able to answer with our dataset include: 
- Which region have expensive price and which region have cheap price? And why does this region have such a high price?
- How big is the house? How much does the house cost per square foot?
- What is the housing condition in a given region?
- Which regions have a higher selling rate?
- Which regions boast more up-to-date homes?
- When is the right time to sell a house?


# Code Book for Live Session Unit 06 (Assignment 5)
This repo describes all objects and files used for the Assignment 5 Homework.

## Summary
Our client is expecting a baby soon. However, he is not sure what to name the child. Being out of the loop, he hires us to help him figure out popular names. He provides for you the raw data for 2015 and 2016 in order to help us make a decision.


### Files
There are 2 files provided in raw format that we will use, various objects in R that we will use to transmute the data and finally write the results to a simply CSV file.

* **Raw Data Files**
	* yob2015.txt: Popular names of children in 2015
		* Fields: Name, Gender, Count
	* yob2016.txt: Popular names of children in 2015
		* Fields: Name, Gender, Count

* **Final Output Files**
	* Top10FemaleNames.csv: Top 10 female names from 2015 and 2016 combined
		* Fields: Name, Total 

* **Scripts**
	* 05AssignmentScratch.R: scratch pad to test and verify manipulations
	* 06.RProj: R Project file that contains all history of data manipulations
	* Assignment05_Dacy.html: Final output of the reproducible activities 
	* Assignment05_Dacy.md: Plain MarkDown version of the R Markdown File
	* Assignment05_Dacy.rmd: The R MarkDown Script for KNITR
	* Assignment05.docx: The MS Word Document for the original assignment
	* README.md: The CodeBook MarkDown for GitHub

### Objects Used in Data Manipulation
Throughout the data manipulation exercises, we create data objects in memory that will be described here (as well as commented in-line in the scripts)

* df: initial data frame to import the raw data file 2016
* y2015: initial data frame to import the raw data file 2015 
* final: a merged and cleaned dataset for 2015 and 2016
* top10Results: a data frame to hold the top 10 names from the combined data fame called **final**
* top10Female: a data set to hold the top 10 female names from the **final** dataset

### Contact
If you have any questions related to the structure or content of this repository, you may [email me](mailto:ldacy@smu.edu)


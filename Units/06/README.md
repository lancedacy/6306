
# Code Book for Live Session Unit 06 (Assignment 5)
This repo describes all objects and files used for the Assignment 5 Homework.

## Summary
Our client is expecting a baby soon. However, he is not sure what to name the child. Being out of the loop, he hires us to help him figure out popular names. He provides for you the raw data for 2015 and 2016 in order to help us make a decision.


### Files
There are 2 files provided in raw format that we will use, various objects in R that we will use to transmute the data and finally write the results to a simply CSV file.

* **Raw Data Files**
	* [yob2015.txt](https://github.com/lancedacy/6306/blob/master/Units/06/yob2015.txt): Popular names of children in 2015
		* Fields: Name, Gender, Count
	* [yob2016.txt](https://github.com/lancedacy/6306/blob/master/Units/06/yob2016.txt): Popular names of children in 2015
		* Fields: Name, Gender, Count

* **Final Output Files**
	* [Top10FemaleNames.csv](https://github.com/lancedacy/6306/blob/master/Units/06/Top10FemaleNames.csv): Top 10 female names from 2015 and 2016 combined
		* Fields: Name, Total 

* **Scripts**
	* [05AssignmentScratch.R](https://github.com/lancedacy/6306/blob/master/Units/06/05AssignmentScratch.R): scratch pad to test and verify manipulations
	* [06.RProj](https://github.com/lancedacy/6306/blob/master/Units/06/06.Rproj): R Project file that contains all history of data manipulations
	* [Assignment05_Dacy.html](https://github.com/lancedacy/6306/blob/master/Units/06/Assignment05_Dacy.html): Final output of the reproducible activities 
	* [Assignment05_Dacy.md](https://github.com/lancedacy/6306/blob/master/Units/06/Assignment05_Dacy.md): Plain MarkDown version of the R Markdown File
	* [Assignment05_Dacy.rmd](https://github.com/lancedacy/6306/blob/master/Units/06/Assignment05_Dacy.Rmd): The R MarkDown Script for KNITR
	* [Assignment05.docx](https://github.com/lancedacy/6306/blob/master/Units/06/Assignment05.docx): The MS Word Document for the original assignment
	* [README.md](https://github.com/lancedacy/6306/blob/master/Units/06/README.md): The CodeBook MarkDown for GitHub

### Objects Used in Data Manipulation
Throughout the data manipulation exercises, we create data objects in memory that will be described here (as well as commented in-line in the scripts)

* _df_: initial data frame to import the raw data file 2016
* _y2015_: initial data frame to import the raw data file 2015 
* _final_: a merged and cleaned dataset for 2015 and 2016
* _top10Results_: a data frame to hold the top 10 names from the combined data fame called **final**
* _top10Female_: a data set to hold the top 10 female names from the **final** dataset

### Contact
If you have any questions related to the structure or content of this repository, you may [email me](mailto:ldacy@smu.edu)


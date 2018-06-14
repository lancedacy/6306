---
title: "Live Session Unit 05 Assignment"
author: "Lance Dacy"
date: "June 14, 2018"
output: 
  html_document:
    keep_md: true
---


## Assignment 5 for Live Session 6
Our client is expecting a baby soon. However, he is not sure what to name the child. Being out of the loop, he hires us to help him figure out popular names. He provides for us raw data in order to help us make a decision.

### Data Munging (30 points)
Utilize yob2016.txt for this question. This file is a series of popular children’s names born in the year 2016 in the United States. It consists of three columns with a first name, a gender, and the amount of children given that name. However, the data is raw and will need cleaning to make it tidy and usable.

#### Import the Data
First, import the .txt file into R so you can process it. Keep in mind this is not a CSV file. You might have to open the file to see what you’re dealing with.  Assign the resulting data frame to an object, df, that consists of three columns with human-readable column names for each.


```r
# Import the 2016 file (separated by semi-colon and no headers)
df <- read.table("yob2016.txt", sep=";", header=F)
# Add column names
colnames(df) <- c("Name","Gender", "Count")
```

#### Summary and Structure of the Data Frame

```r
#Summary of the data frame as well as structure
summary(df)
```

```
##       Name       Gender        Count        
##  Aalijah:    2   F:18758   Min.   :    5.0  
##  Aaliyan:    2   M:14111   1st Qu.:    7.0  
##  Aamari :    2             Median :   12.0  
##  Aarian :    2             Mean   :  110.7  
##  Aarin  :    2             3rd Qu.:   30.0  
##  Aaris  :    2             Max.   :19414.0  
##  (Other):32857
```

```r
str(df)
```

```
## 'data.frame':	32869 obs. of  3 variables:
##  $ Name  : Factor w/ 30295 levels "Aaban","Aabha",..: 9317 22546 3770 26409 12019 20596 6185 339 9298 11222 ...
##  $ Gender: Factor w/ 2 levels "F","M": 1 1 1 1 1 1 1 1 1 1 ...
##  $ Count : int  19414 19246 16237 16070 14722 14366 13030 11699 10926 10733 ...
```

#### Duplicated Data
Your client tells you that there is a problem with the raw file. One name was entered twice and misspelled. The client cannot remember which name it is; there are thousands he saw! But he did mention he accidentally put three y’s at the end of the name. Write an R command to figure out which name it is and display it.


```r
#Find the mispelled value that ends in YYY
grep("yyy", df$Name, value = TRUE)
```

```
## [1] "Fionayyy"
```

#### Remove the Duplicate
Upon finding the misspelled name, please remove this particular observation, as the client says it’s redundant. Save the remaining dataset as an object: y2016 


```r
# Save a new dataset without the duplicated value
y2016 <- df[ !(df$Name %in% grep("yyy", df$Name, value = TRUE)), ]
# Validate it is not in the new dataset
grep("yyy", y2016$Name, value = TRUE)
```

```
## character(0)
```

### Data Merging (30 points)
Utilize yob2015.txt for this question. This file is similar to yob2016, but contains names, gender, and total children given that name for the year 2015.

#### Import the 2015 File
Please import the .txt file into R. Look at the file before you do. You might have to change some options to import it properly. Again, please give the dataframe human-readable column names.  Assign the dataframe to y2015.


```r
# Import the 2016 file (separated by a comma and no headers)
y2015 <- read.table("yob2015.txt", sep=",", header=F)
# Add column names
colnames(y2015) <- c("Name","Gender", "Count")
#Summary of the data frame as well as structure
summary(y2015)
```

```
##       Name       Gender        Count        
##  Aalijah:    2   F:19054   Min.   :    5.0  
##  Aaliyah:    2   M:14009   1st Qu.:    7.0  
##  Aamari :    2             Median :   11.0  
##  Aarian :    2             Mean   :  111.4  
##  Aarion :    2             3rd Qu.:   30.0  
##  Aaron  :    2             Max.   :20415.0  
##  (Other):33051
```

```r
str(y2015)
```

```
## 'data.frame':	33063 obs. of  3 variables:
##  $ Name  : Factor w/ 30553 levels "Aaban","Aabha",..: 9474 22858 26680 3771 12170 20927 344 9453 6252 11404 ...
##  $ Gender: Factor w/ 2 levels "F","M": 1 1 1 1 1 1 1 1 1 1 ...
##  $ Count : int  20415 19638 17381 16340 15574 14871 12371 11766 11381 10283 ...
```

#### The Last 10 Rows
Display the last ten rows in the dataframe. Describe something you find interesting about these 10 rows:

*Upon review of the last 10 rows of the 2015 data set below, you will notice that they all have a count of 5. Upon further investigation, this extends well beyond the last 10 and into the hundreds which makes me a little suspect of the data cleanliness.*


```r
#Last 10 rows of 2015
tail(y2015, 10)
```

```
##         Name Gender Count
## 33054   Ziyu      M     5
## 33055   Zoel      M     5
## 33056  Zohar      M     5
## 33057 Zolton      M     5
## 33058   Zyah      M     5
## 33059 Zykell      M     5
## 33060 Zyking      M     5
## 33061  Zykir      M     5
## 33062  Zyrus      M     5
## 33063   Zyus      M     5
```

#### Merge the 2016 and 2015 Data
Merge y2016 and y2015 by your Name column; assign it to final. The client only cares about names that have data for both 2016 and 2015; there should be no NA values in either of your amount of children rows after merging.


```r
# Merge the data sets not just by name, but gender as well
# if you don't you will get disparate rows with M / F values
# that don't match
final = merge(y2016, y2015, by.x=c("Name", "Gender"), 
              by.y=c("Name", "Gender"), na.rm=TRUE)

summary(final)
```

```
##       Name       Gender       Count.x           Count.y       
##  Aalijah:    2   F:15267   Min.   :    5.0   Min.   :    5.0  
##  Aamari :    2   M:11283   1st Qu.:    8.0   1st Qu.:    8.0  
##  Aarian :    2             Median :   15.0   Median :   16.0  
##  Aaron  :    2             Mean   :  135.5   Mean   :  137.2  
##  Aarya  :    2             3rd Qu.:   41.0   3rd Qu.:   41.0  
##  Aaryn  :    2             Max.   :19414.0   Max.   :20415.0  
##  (Other):26538
```
### Data Summary (30 points)
Utilize your data frame object final for this part.

#### New Totals
Create a new column called “Total” in final that adds the amount of children in 2015 and 2016 together. In those two years combined, how many people were given popular names?


```r
# Add the 2015 and 2016 total fields to a new field called Total
final$Total <- final$Count.x + final$Count.y
# How many people had popular names
sum(final$Total)
```

```
## [1] 7239231
```

#### Top 10 Names
Sort the data by Total. What are the top 10 most popular names?


```r
# Create a new data frame to hold the results and only put the top 10
top10Results <- head(final[order(-final$Total),], 10)
top10Results
```

```
##           Name Gender Count.x Count.y Total
## 8290      Emma      F   19414   20415 39829
## 19886   Olivia      F   19246   19638 38884
## 19594     Noah      M   19015   19594 38609
## 16114     Liam      M   18138   18330 36468
## 23273   Sophia      F   16070   17381 33451
## 3252       Ava      F   16237   16340 32577
## 17715    Mason      M   15192   16591 31783
## 25241  William      M   15668   15863 31531
## 10993    Jacob      M   14416   15914 30330
## 10682 Isabella      F   14722   15574 30296
```

#### Top 10 Girl Names
The client is expecting a girl! Omit boys and give the top 10 most popular girl’s names.


```r
# Create a new data frame to hold the clean list of top 10 female names
top10Female <- head(subset(final, Gender != "M", select =c("Name", "Total"))
                    [order(-subset(final, Gender != "M")$Total),], 10)

# Display the data frame
top10Female
```

```
##            Name Total
## 8290       Emma 39829
## 19886    Olivia 38884
## 23273    Sophia 33451
## 3252        Ava 32577
## 10682  Isabella 30296
## 18247       Mia 29237
## 5493  Charlotte 24411
## 277     Abigail 24070
## 8273      Emily 22692
## 9980     Harper 21016
```

#### Write the Top 10 Female Names to a CSV File
Write these top 10 girl names and their Totals to a CSV file. Leave out the other columns entirely.


```r
write.csv(top10Female, file = "Top10FemaleNames.csv", row.names=FALSE)
list.files()
```

```
##  [1] "~$signment05.docx"      "05AssignmentScratch.R" 
##  [3] "06.Rproj"               "Assignment05_Dacy.html"
##  [5] "Assignment05_Dacy.md"   "Assignment05_Dacy.Rmd" 
##  [7] "Assignment05.docx"      "Top10FemaleNames.csv"  
##  [9] "yob2015.txt"            "yob2016.txt"
```

### Upload to GitHub
Push at minimum your RMarkdown for this homework assignment and a Codebook to one of your GitHub repositories (you might place this in a Homework repo like last week). The Codebook should contain a short definition of each object you create, and if creating multiple files, which file it is contained in.

My GitHub Repo: https://github.com/lancedacy/6306/tree/master/Units/06 

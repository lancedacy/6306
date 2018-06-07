---
title: "Live Session Unit 04 Assignment"
author: "Lance Dacy"
date: "June 7, 2018"
output: 
  html_document:
    keep_md: true
---



## Assignment 04
This assignment had 4 parts:

* Navigating the FiveThirtyEight Data
* Creating a Data Summary of the Data / Export to CSV
* Codebook creation on a Git Repository
* Swirl Lesson 15 on Graphs

###Question 1: FiveThirtyEight Data (30 points)
Navigate to [FiveThirtyEight](https://github.com/rudeboybert/fivethirtyeight) on GitHub and read README.md. Perform the commands listed below:

a. Install the fivethirtyeight package.


```r
library("fivethirtyeight")
fileURL <- "https://raw.githubusercontent.com/fivethirtyeight/data/master/college-majors/recent-grads.csv"
```

b. In the listing of Data sets in package ‘fivethirtyeight,’ assign the 22nd data set to an object ‘df.’


```r
library(repmis)
df <-repmis::source_data(fileURL)
```

```
## Downloading data from: https://raw.githubusercontent.com/fivethirtyeight/data/master/college-majors/recent-grads.csv
```

```
## SHA-1 hash of the downloaded data file is:
## 4b681ed0ae40cd8ee8f55da2b5e37943f0cd0a8f
```

c. Use a more detailed list of the data sets to write out the URL in a comment to the related news story.


```r
newsstory <- "https://fivethirtyeight.com/features/the-economic-guide-to-picking-a-college-major/"
```

d. Using R commands, give the dimensions and column names of this data frame.


```r
dim(df)
```

```
## [1] 173  21
```

```r
colnames(df)
```

```
##  [1] "Rank"                 "Major_code"           "Major"               
##  [4] "Total"                "Men"                  "Women"               
##  [7] "Major_category"       "ShareWomen"           "Sample_size"         
## [10] "Employed"             "Full_time"            "Part_time"           
## [13] "Full_time_year_round" "Unemployed"           "Unemployment_rate"   
## [16] "Median"               "P25th"                "P75th"               
## [19] "College_jobs"         "Non_college_jobs"     "Low_wage_jobs"
```

###Question 2: Data Summary (30 points)
Use your newly assigned data frame

a. Write an R command that gives you the column names of the data frame. Right after that, write one that counts the number of columns but not rows.


```r
colnames(df)
```

```
##  [1] "Rank"                 "Major_code"           "Major"               
##  [4] "Total"                "Men"                  "Women"               
##  [7] "Major_category"       "ShareWomen"           "Sample_size"         
## [10] "Employed"             "Full_time"            "Part_time"           
## [13] "Full_time_year_round" "Unemployed"           "Unemployment_rate"   
## [16] "Median"               "P25th"                "P75th"               
## [19] "College_jobs"         "Non_college_jobs"     "Low_wage_jobs"
```

```r
ncol(df)
```

```
## [1] 21
```

b. Generate a count of each unique major_category in the data frame. Assign it to major_count.


```r
library(plyr)
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:plyr':
## 
##     arrange, count, desc, failwith, id, mutate, rename, summarise,
##     summarize
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
major_count <- data.frame(df %>% group_by(df$Major_category) %>% tally())
major_count
```

```
##                      df.Major_category  n
## 1      Agriculture & Natural Resources 10
## 2                                 Arts  8
## 3               Biology & Life Science 14
## 4                             Business 13
## 5          Communications & Journalism  4
## 6              Computers & Mathematics 11
## 7                            Education 16
## 8                          Engineering 29
## 9                               Health 12
## 10           Humanities & Liberal Arts 15
## 11 Industrial Arts & Consumer Services  7
## 12                   Interdisciplinary  1
## 13                 Law & Public Policy  5
## 14                   Physical Sciences 10
## 15            Psychology & Social Work  9
## 16                      Social Science  9
```

c. To make things easier to read, enter par(las=2) before your plot to make the text perpendicular to the axis. Make a barplot of major_count. 


```r
par(las=2)
barplot(as.matrix(major_count$n, major_count$df.Major_category), 
        main="Major Distribution", 
        xlab = "Unique Counts", ylab = "Major Category", 
        horiz=TRUE, col = "blue")
```

![](Assignment04_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

d. Write the fivethirtyeight data to a csv file. Make sure that it does not have row labels.


```r
write.csv(df, file = "df.csv", row.names=FALSE)
list.files()
```

```
## [1] "appleorange.csv"     "Assignment04_files"  "Assignment04.html"  
## [4] "Assignment04.md"     "Assignment04.Rmd"    "df.csv"             
## [7] "Scratch05.R"         "stability.csv"       "Unit05Project.Rproj"
```

```r
dfcsv <- read.csv("df.csv", header=TRUE)
str(dfcsv)
```

```
## 'data.frame':	173 obs. of  21 variables:
##  $ Rank                : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ Major_code          : int  2419 2416 2415 2417 2405 2418 6202 5001 2414 2408 ...
##  $ Major               : Factor w/ 173 levels "ACCOUNTING","ACTUARIAL SCIENCE",..: 141 116 113 132 24 134 2 15 109 53 ...
##  $ Total               : int  2339 756 856 1258 32260 2573 3777 1792 91227 81527 ...
##  $ Men                 : int  2057 679 725 1123 21239 2200 2110 832 80320 65511 ...
##  $ Women               : int  282 77 131 135 11021 373 1667 960 10907 16016 ...
##  $ Major_category      : Factor w/ 16 levels "Agriculture & Natural Resources",..: 8 8 8 8 8 8 4 14 8 8 ...
##  $ ShareWomen          : num  0.121 0.102 0.153 0.107 0.342 ...
##  $ Sample_size         : int  36 7 3 16 289 17 51 10 1029 631 ...
##  $ Employed            : int  1976 640 648 758 25694 1857 2912 1526 76442 61928 ...
##  $ Full_time           : int  1849 556 558 1069 23170 2038 2924 1085 71298 55450 ...
##  $ Part_time           : int  270 170 133 150 5180 264 296 553 13101 12695 ...
##  $ Full_time_year_round: int  1207 388 340 692 16697 1449 2482 827 54639 41413 ...
##  $ Unemployed          : int  37 85 16 40 1672 400 308 33 4650 3895 ...
##  $ Unemployment_rate   : num  0.0184 0.1172 0.0241 0.0501 0.0611 ...
##  $ Median              : int  110000 75000 73000 70000 65000 65000 62000 62000 60000 60000 ...
##  $ P25th               : int  95000 55000 50000 43000 50000 50000 53000 31500 48000 45000 ...
##  $ P75th               : int  125000 90000 105000 80000 75000 102000 72000 109000 70000 72000 ...
##  $ College_jobs        : int  1534 350 456 529 18314 1142 1768 972 52844 45829 ...
##  $ Non_college_jobs    : int  364 257 176 102 4440 657 314 500 16384 10874 ...
##  $ Low_wage_jobs       : int  193 50 0 0 972 244 259 220 3253 3170 ...
```

###Question4: Codebook (30 points)
Simulate a codebook by completing the following:

a. Start a new repository on GitHub for your SMU MSDS homework. On your local device, make sure there is a directory for Homework at the minimum.

* GitHub Respository: https://github.com/lancedacy/6306

b. Create a README.md file which explains the purpose of the repository, the topics included, the sources for the material you post, and contact information in case of questions. Remember, the one in the root directory should be general.

* GitHub Respository: https://github.com/lancedacy/6306

c. In one (or more) of the nested directories, post your RMarkdown script, HTML file, and data from ‘fivethirtyeight.’

* GitHub Respository: https://github.com/lancedacy/6306/tree/master/Units/05/Unit05Project

d. In your RMarkdown script, please provide the link to this GitHub so the grader can see it.

* GitHub Respository: https://github.com/lancedacy/6306

###Question5: Swirl (10 points)
Complete Module 15 in the R Programming course of Swirl

* GitHub Link: https://github.com/lancedacy/6306/blob/master/Units/05/Swirl15Output.txt

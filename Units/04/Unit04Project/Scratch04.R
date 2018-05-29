#Question 1
library("fivethirtyeight")
fileURL <- "https://raw.githubusercontent.com/rudeboybert/fivethirtyeight/master/data-raw/classic-rock/classic-rock-raw-data.csv"
library(repmis)
df <-repmis::source_data(fileURL)
newsstory <- "http://fivethirtyeight.com/features/why-classic-rock-isnt-what-it-used-to-be/"
colnames(df)
dim(df)


#Question 2
count(colnames(df)
      )
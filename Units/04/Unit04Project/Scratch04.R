#Question 1
library("fivethirtyeight")
fileURL <- "https://raw.githubusercontent.com/rudeboybert/fivethirtyeight/master/data-raw/classic-rock/classic-rock-raw-data.csv"
library(repmis)
df <-repmis::source_data(fileURL)
newsstory <- "http://fivethirtyeight.com/features/why-classic-rock-isnt-what-it-used-to-be/"
colnames(df)
dim(df)


#Question 2
ncol(df)
unique(df$COMBINED)

head(df)


#Building the table
unique(df$COMBINED)

aggregate(data.frame(count = major_count), list(value = v), length)

#if you have multiple factors try this

library("dplyr")
dfSong_table <- df %>% group_by(df$COMBINED) %>% summarize(major_count=n())
dfCallSign_table <- df %>% group_by(df$CALLSIGN) %>% summarize(major_count=n())
dfYear_table <- df %>% group_by(as.POSIXlt(as.numeric(df$TIME),origin="1970-01-01",tz="GMT"))) %>% summarize(major_count=n())
head(as.POSIXlt(as.numeric(df$TIME),origin="1970-01-01",tz="GMT"))
head(as.Date(as.POSIXct(df$TIME, origin="1970-01-01")))


#write to CSV file with no row names
write.csv(df, file = "df.csv", row.names=FALSE)

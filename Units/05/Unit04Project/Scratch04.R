# 1a.Install the library
library("fivethirtyeight")
fileURL <- "https://raw.githubusercontent.com/rudeboybert/fivethirtyeight/master/data-raw/classic-rock/classic-rock-raw-data.csv"

# 1b. In the listing of Data sets in package ‘fivethirtyeight,’ assign the 
# eighteenth data set to an object ‘df.’
library(repmis)
df <-repmis::source_data(fileURL)

# 1c. Use a more detailed list of the data sets to 
# write out the URL in a comment to the related news story.
newsstory <- "http://fivethirtyeight.com/features/why-classic-rock-isnt-what-it-used-to-be/"

#1d. Using R command(s), give the dimensions and column names of this data frame.
dim(df)
colnames(df)


# 2a. Write an R command that gives you the column names of the data frame. 
# Right after that, write one that counts the number of columns but not rows. 
# Hint: The number should match one of your numbers in Question 1d for dimensions.
colnames(df)
ncol(df)

# 2b. Generate a count of each unique major_category in the data frame. 
# I recommend using libraries to help. I have demonstrated one briefly 
# in live-session. To be clear, this should look like a matrix or data 
# frame containing the major_category and the frequency it occurs in the dataset. 
# Assign it to major_count.

library("dplyr")
dfSong_table <- df %>% group_by(df$COMBINED) %>% summarize(major_count=n())
# dfCallSign_table <- df %>% group_by(df$CALLSIGN) %>% summarize(major_count=n())
# dfYear_table <- df %>% group_by(as.POSIXlt(as.numeric(df$TIME),origin="1970-01-01",tz="GMT"))) %>% summarize(major_count=n())
# head(as.POSIXlt(as.numeric(df$TIME),origin="1970-01-01",tz="GMT"))
# head(as.Date(as.POSIXct(df$TIME, origin="1970-01-01")))

# 2c. To make things easier to read, enter par(las=2) before your plot to make the text 
# perpendicular to the axis. Make a barplot of major_count. Make sure to label the title with 
# something informative (check the vignette if you need), label the x and y axis, and make it 
# any color other than grey. Assign the major_category labels to their respective bar. Flip the 
# barplot horizontally so that bars extend to the right, not upward. All of these options can be 
# done in a single pass of barplot(). Note: It’s okay if it’s wider than the preview pane.

# Fitting Labels 
par(las=2) # make label text perpendicular to axis

major_counts <- table(dfSong_table$major_count)
barplot(major_counts, main="Song Distribution", 
        xlab = "Unique Plays", ylab = "Song", 
        horiz=TRUE, col = "blue")

# 2d. Write the fivethirtyeight data to a csv file. Make sure that it does not have row labels.
write.csv(df, file = "df.csv", row.names=FALSE)

# 1a.Install the library
library("fivethirtyeight")
fileURL <- "https://raw.githubusercontent.com/fivethirtyeight/data/master/college-majors/recent-grads.csv"

# 1b. In the listing of Data sets in package ‘fivethirtyeight,’ assign the 
# eighteenth data set to an object ‘df.’
library(repmis)
df <-repmis::source_data(fileURL)

# 1c. Use a more detailed list of the data sets to 
# write out the URL in a comment to the related news story.
newsstory <- "https://fivethirtyeight.com/features/the-economic-guide-to-picking-a-college-major/"

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
library(plyr)
library(dplyr)
major_count <- data.frame(df %>% group_by(df$Major_category) %>% tally())
major_count

major_count <- as.data.frame(table(df$major_category))
major_count
# 2c. To make things easier to read, enter par(las=2) before your plot to make the text 
# perpendicular to the axis. Make a barplot of major_count. Make sure to label the title with 
# something informative (check the vignette if you need), label the x and y axis, and make it 
# any color other than grey. Assign the major_category labels to their respective bar. Flip the 
# barplot horizontally so that bars extend to the right, not upward. All of these options can be 
# done in a single pass of barplot(). Note: It’s okay if it’s wider than the preview pane.

# Fitting Labels 
par(las=2) # make label text perpendicular to axis
barplot(as.matrix(major_count$n, major_count$df.Major_category), 
        main="Major Distribution", 
        xlab = "Unique Counts", ylab = "Major Category", 
        horiz=TRUE, col = "blue")

# 2d. Write the fivethirtyeight data to a csv file. Make sure that it does not have row labels.
write.csv(df, file = "df.csv", row.names=FALSE)


install.packages("downloader")
library(downloader)

download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/appleorange.csv", destfile="appleorange.csv")
download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/stability.csv", destfile="stability.csv")
ao = read.csv("appleorange.csv", stringsAsFactors = FALSE, header = FALSE)
aoraw <- ao
str(aoraw)
head(aoraw)
str(aoraw)
tail(aoraw)

aodata <- aoraw[3:700,]
names(aodata) <- c("country", "countrynumber", "products", "productnumber", "tonnes", "year")
aodata$countrynumber <- as.integer(aodata$countrynumber)
str(aodata)
fslines <- which(aodata$country == "Food supply quantity (tonnes) (tonnes)")
aodata <- aodata[(-1 * fslines),]
str(aodata)
aodata$tonnes <- gsub("\xca", "", aodata$tonnes)
aodata$tonnes <- gsub(", tonnes \\(\\)", "", aodata$tonnes)
aodata$tonnes <- as.numeric(aodata$tonnes)
str(aodata)
aodata$year <- 2009
apples <- aodata[aodata$productnumber == 2617, c(1,2,5)]
str(apples)
names(apples)[3] <- "apples"
str(apples)
oranges <- aodata[aodata$productnumber == 2611, c(2,5)]
str(oranges)
names(oranges)[2] <- "oranges"
str(oranges)
oranges

View(oranges)
cleanao2 <- merge(apples, oranges, by="countrynumber", all=TRUE)
library(reshape2)
cleanao3 <- dcast(aodata[,c(1:3,5)], formula = country + countrynumber ~ products, value.var="tonnes")
names(cleanao3)[3:4] <- c("apples", "oranges")
cleanao2[!(complete.cases(cleanao2)),]
cleanao3[!(complete.cases(cleanao3)),]
table(aodata$country)[table(aodata$country) == 1]
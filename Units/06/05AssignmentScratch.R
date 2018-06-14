# Import the 2016 file in R
df <- read.table("yob2016.txt", sep=";", header=F)

# Add column names
colnames(df) <- c("Name","Gender", "Count")

#Summary of the data frame as well as structure
summary(df)
str(df)

#Find the mispelled value that ends in YYY
grep("yyy", df$Name, value = TRUE)

# Save a new dataset without the value
y2016 <- df[ !(df$Name %in% grep("yyy", df$Name, value = TRUE)), ]

# Import the 2015 file in R
y2015 <- read.table("yob2015.txt", sep=",", header=F)

# Add column names
colnames(y2015) <- c("Name","Gender", "Count")

#Summary of the data frame as well as structure
summary(y2015)
str(y2015)
View(y2015)

#Last 10 rows of 2015
tail(y2015, 10)

#Observations about this: All counts are 5

# Merge y2016 and y2015 by your Name column; assign it to final.  
# The client only cares about names that have data for both 2016 and 
# 2015; there should be no NA values in either of your amount of 
# children rows after merging.
final = merge(y2016, y2015, by.x=c("Name", "Gender"), 
              by.y=c("Name", "Gender"), na.rm=TRUE)
summary(final)
# Create a new column called “Total” in final that adds the amount of 
# children in 2015 and 2016 together.  In those two years combined, 
# how many people were given popular names?

final$Total <- final$Count.x + final$Count.y
sum(final$Total)
View(final)

# Sort the data by Total.  What are the top 10 most popular names?
top10Results <- head(final[order(-final$Total),], 10)

# The client is expecting a girl!  Omit boys and give the top 10 
# most popular girl’s names.
top10Female <- head(subset(final, Gender != "M", select =c("Name", "Total"))
                    [order(-subset(final, Gender != "M")$Total),], 10)

# Write these top 10 girl names and their Totals to a CSV file.  Leave out the other columns entirely.
write.csv(top10Female, file = "Top10FemaleNames.csv", row.names=FALSE)
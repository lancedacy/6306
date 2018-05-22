# 1a The log of a positive number.
log(5)

# 1b What is the default base for the log function? 10
# Calculate the log of your previous number with a different base.
# Defautl base is 10
log2(5)

#1c The log of a negative number. (explain the answer)
log(-5)

#1d The square-root of a positive number.
sqrt(5)

# 2a Create a vector of 15 standard normal random variables. Calculate its mean and
# SD (Standard Deviation).
x = rnorm(15)
x
mean(x)
sd(x)

# 2b Change the mean to 10 and the SD to 2 and recalculate the vector of 
# 15 random normal variables. Calculate its mean and SD.
# SDs specified in the function?
x = rnorm(15, mean = 10, sd = 2)
x
mean(x)
sd(x)

#2c. Why are the means and SD not exactly the same as the means and SD specified in the function?
# because they are reandom generated sets

#3c. a. The weights of 6 individuals in kg are 60, 72, 57, 90, 95, 72.
#    b. Their heights (in m) are 1.80, 1.85, 1.72, 1.90, 1.74, 1.91.
#    c. Enter these vectors into R.

mydata <- data.frame("Weight" = c(60, 72, 57, 90, 95, 72), "Height" = c(.80, 1.85, 1.72, 1.90, 1.74, 1.91))
mydata

#3d. Create a scatter plot of the data above and interpret it

#Assign the data from the data above to the scatter plot
input <- mydata[,c("Weight","Height")]
print(head(input))

#File name
png(file = "scatterplot.png")

# Plot the chart
plot(x = input$"Weight",y = input$"Height",
     xlab = "Weight",
     ylab = "Height",
     main = "Weight vs Height"
)

# Save the file.
dev.off()

#3e. Calculate the BMI for each individual

mydata$"BMI" <- (mydata$"Weight" / (mydata$"Height" * mydata$"Height"))
mydata

#3f. Calculate the Mean for each individual weight

meanwt <- mean(mydata$Weight)
meanwt

#3g. Subtract the mean from each value of weight.
mydata$"Mean-WT" <- (mydata$"Weight" - meanwt)
mydata

#3h. Sum the result of Mean-WT
sum(mydata$`Mean-WT`)

#4. My data science profile
Lance <- data.frame("Categories" = c("Computer Programming", "Math", "Statistics", 
                                     "Machine Learning", "Domain Expertise", 
                                     "Communication", "Presentation Skills", "Data Visualization"), 
                    "Rank" = c(2,3,2,1,3,4,5,4))

Lance

#4. The bar chart

#File name
png(file ="barchart.png")

barplot(Lance$Rank,names.arg=Lance$Categories,ylab="Ranking",col="blue",
        main="Lance's Profile",border="red", las=2, cex.axis = .50, cex.names = .50)

# Save the file.
dev.off()

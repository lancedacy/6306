#Retrieve the summary of the stackloss dataset
summary(stackloss)

#Retrieve the structure of the stackloss dataset
str(stackloss)


#Assign the data from stackloss to the scatter plot data and verify the data
input <- stackloss[,c("Air.Flow","stack.loss")]
print(head(input))

# Plot the chart
plot(x = input$"Air.Flow",y = input$"stack.loss",
     xlab = "Air Flow",
     ylab = "Stack Loss",
     main = "Air Flow vs Stack Loss"
)
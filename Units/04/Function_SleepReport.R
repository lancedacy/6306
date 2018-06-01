SleepDataFunction <- function(sleepDataURL="http://talklab.psy.gla.ac.uk/L1_labs/lab_1/homework/sleep_data_01.csv", RoundBy = 2) {
  
  library(repmis) #load the rempis library to handle the downloaded data
  sleepData <- source_data(sleepDataURL, sep = ",", header = TRUE) #store the data
  
  # Create the objects that will hold the data manipulation requested
  medianAge <- median(sleepData$Age, na.rm=TRUE)
  rangeDuration <- (max(sleepData$Duration, na.rm=TRUE) - min(sleepData$Duration, na.rm=TRUE))
  meanRSES <- mean(sleepData$RSES, na.rm=TRUE)
  sdRSES <- sd(sleepData$RSES, na.rm=TRUE)
 
  # Create a data.frame object called report
  report <- data.frame(round(medianAge, digits = RoundBy), 
                       round((meanRSES/5), digits = RoundBy), 
                       round((sdRSES/5), digits = RoundBy), 
                       round(rangeDuration, digits = RoundBy))
  
  # Update the data.frame column names to remain consistent
  colnames(report) <- c("MedianAge", "SelfEsteem", "SE_SD", "DurationRange")
  
  # Output the report
  report
}
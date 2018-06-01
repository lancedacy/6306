# Last login: Mon May 28 12:15:20 on console
# MacBook-Pro-15:~ ldacy$ cd /Users/ldacy/Dropbox/Education/MSDS/6306/Units/04 
# MacBook-Pro-15:04 ldacy$ mkdir PDS
# MacBook-Pro-15:04 ldacy$ cd PDS
# MacBook-Pro-15:PDS ldacy$ git clone https://github.com/caesar0301/awesome-public-datasets
# # Cloning into 'awesome-public-datasets'...
# remote: Counting objects: 1475, done.
# remote: Total 1475 (delta 0), reused 0 (delta 0), pack-reused 1475
# Receiving objects: 100% (1475/1475), 561.47 KiB | 206.00 KiB/s, done.
# Resolving deltas: 100% (860/860), done.
# MacBook-Pro-15:PDS ldacy$ 
unzip("PDS/awesome-public-datasets/Datasets/titanic.csv.zip")
df <- read.csv("titanic.csv")

# Simple Bar Plot 

plot(x = df$Sex,
     xlab = "Gender",
     ylab = "Count",
     main = "Titanic Passengers"
)

tapply(df$Age, df$Sex, mean, na.rm=TRUE)
tapply(df$Fare, df$Sex, mean, na.rm=TRUE) 
tapply(df$Survived, df$Sex, mean, na.rm=TRUE) 

# Question 2 Creat a function
"http://talklab.psy.gla.ac.uk/L1_labs/lab_1/homework/sleep_data_01.csv"

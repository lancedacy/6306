#Download data on Financial Regulators 
#stored in a Dropbox Public folder 

#Load repmis 
library(repmis) 

#Place the URL into the object FinURL 
FinURL <- "http://dl.dropbox.com/u/12581470/code/Replicability_code/Financial_Supervision_Governance_Replication/public.fin.msm.model.csv" 

#Download data 
FinRegulatorData <- source_data(FinURL, sep = ",", header = TRUE) 

##Downloading data from: http://bit.ly/14aS5qq 
## 
##SHA-1 hash of the downloaded data file is: ##7fdcb0a9785d52e0f3d450e4bde29dbc4e2b045a 

#Show variables in FinRegulatorData 
names(FinRegulatorData) 

##[1] "idn" "country" "year" "reg_4state"

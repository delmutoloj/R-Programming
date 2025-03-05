install.packages("plyr")

library(plyr)

# Set working directory
setwd("G:/My Drive/USF/R Programming/Week 8 - Strings IO and plyr")

# Name of text file in directory
text_file <- "Assignment 6 Dataset.txt"

# Read the .txt data separating at each comma
studentData <- read.table(text_file, sep = ",", header = T)

# Use ddply to find the find the average grade for each sex.
averageBySex <- ddply(
  studentData,"Sex",transform,Grade.Average=mean(Grade))

# Results
averageBySex

# Write data to a new file, use sep = ","
write.table(averageBySex, "sortedAverage.txt", sep = ",")

# Write data to a new file, use sep = ","
write.table(averageBySex, "sortedAverage.csv", sep = ",")

# Use create a subset of the data using grep to select for names with i
studentDataNew <-  subset(studentData,grepl("[iI]",studentData$Name))

# Results
studentDataNew

# Write data to a new file
write.table(studentDataNew, "onlyIs.txt", sep = ",")

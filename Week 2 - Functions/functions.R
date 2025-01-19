# Working directory
setwd("G:/My Drive/USF/R Programming/Week 2 - Functions")

# Assignment data
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

# myMean Function
# This function accepts a numeric vector and returns the mean by taking the sum
# of the vector divided by the length of the vector.
myMean <- function(assignment2) {
  return(sum(assignment2)/length(assignment2)) }

# Use the myMean function on assignment data
myMean(assignment2)

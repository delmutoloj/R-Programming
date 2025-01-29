#install.packages("reshape2")
#install.packages("ggplot2")
library(reshape2)
library(ggplot2)

# Set working directory
setwd("H:/My Drive/USF/R Programming/Week 3 - Data Frame")

# Poll data names
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Berine")

# ABC poll results
ABC <- c(4, 62, 51, 21, 2, 14, 15)

# CBS poll results
CBS <- c(12, 75, 43, 19, 1, 21, 19)

# Combine poll data into data frame
pollData <- data.frame(Name, ABC, CBS)

# Use reshape2 to transform the data into a long format
pollDataLong <- melt(pollData, 
                     id.vars = "Name", 
                     variable.name = "Poll", 
                     value.name = "Result")

# Use ggplot 2 to create a side by side bar chart
ggplot(pollDataLong, aes(x = Name, y = Result, fill = Poll)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = c("ABC" = "lightblue", "CBS" = "lightgreen")) +
  labs(
    title = "Comparison of ABC and CBS Poll Results",
    x = "Candidate",
    y = "Poll Results",
    fill = "Poll"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

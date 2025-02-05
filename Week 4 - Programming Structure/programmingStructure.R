# Set working directory
setwd("H:/My Drive/USF/R Programming/Week 4 - Programming Structure")

# Patients data frame
patients <- data.frame(
  frequency = c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2),
  bloodPressure = c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176),
  first = c("bad", "bad", "bad", "bad", "good", 
            "good", "good", "good", NA, "bad"),
  second = c("low", "low", "high", "high", "low", 
             "low", "high", "high", "high", "high"),
  finalDecision = c("low", "high", "low", "high", 
                    "low", "high", "low", "high", "high", "high")
)

# Turn chr variables into logical data

# Convert 'first' column: 1 for "bad", 0 for "good"
patients$first <- ifelse(patients$first == "bad", 1, 0)

# Convert 'second' column: 1 for "high", 0 for "low"
patients$second <- ifelse(patients$second == "high", 1, 0)

# Convert 'finalDecision' column: 1 for "high", 0 for "low"
patients$finalDecision <- ifelse(patients$finalDecision == "high", 1, 0)

# Display patient data
print(patients)

# Create a side-by-side box plot (boxplot(x, ...))
boxplot(bloodPressure ~ finalDecision, data = patients,
        main = "Box Plot of Blood Pressure by Final Decision",
        xlab = "Final Decision (0 = Low, 1 = High)",
        ylab = "Blood Pressure",
        col = c("lightblue", "lightgreen"),
        border = "darkblue")

# Calculate max, min, and median for each group
stats <- aggregate(
  bloodPressure ~ finalDecision, data = patients, 
  FUN = function(x) c(min = min(x), median = median(x), max = max(x)))

# Add max, min, and median to the plots
text(x = 1, y = stats$bloodPressure[1, "min"],labels = paste(
  "Min:", stats$bloodPressure[1, "min"]), pos = 3, col = "red")
text(x = 1, y = stats$bloodPressure[1, "median"], labels = paste(
  "Median:", stats$bloodPressure[1, "median"]), pos = 3, col = "blue")
text(x = 1, y = stats$bloodPressure[1, "max"], labels = paste(
  "Max:", stats$bloodPressure[1, "max"]), pos = 3, col = "red")

text(x = 2, y = stats$bloodPressure[2, "min"], labels = paste(
  "Min:", stats$bloodPressure[2, "min"]), pos = 3, col = "red")
text(x = 2, y = stats$bloodPressure[2, "median"], labels = paste(
  "Median:", stats$bloodPressure[2, "median"]), pos = 3, col = "blue")
text(x = 2, y = stats$bloodPressure[2, "max"], labels = paste(
  "Max:", stats$bloodPressure[2, "max"]), pos = 1, col = "red")

# The side-by-side box plot of blood pressure by final decision shows that
# the blood pressure values are much more spread out for a final decision of
# high compared to low. The plot also shows that while the blood pressure
# values for a final decision of high are mostly higher than blood pressure
# values for a decision of low, the minimum blood pressure value for a final
# decision of high is almost as low as the minimum blood pressure value for a 
# final decision of low. I would have expected there to be less overlap
# between low and high final decisions

# Histograms for numeric variables

# Histogram for the frequency variable
hist(patients$frequency,
     main = "Histogram of Frequency",
     xlab = "Frequency",
     ylab = "Count",
     col = "lightblue",
     border = "black",
     breaks = 10)  # Adjust the number of bins

# Histogram for the bloodPressure variable
hist(patients$bloodPressure,
     main = "Histogram of Blood Pressure",
     xlab = "Blood Pressure",
     ylab = "Count",
     col = "lightgreen",
     border = "black",
     breaks = 15)  # Adjust the number of bins

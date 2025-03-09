library(hms)
library(lattice)
library(ggplot2)
library(dplyr)
library(RColorBrewer)

# Set working directory
setwd("G:/My Drive/USF/R Programming/Week 9 - Visualization")

# Read the pizzaplace.csv
pizzaSales <- read.csv("pizzaplace.csv")

### Data cleaning and preparation ###

# Remove id and rownames columns
pizzaSales$id <- NULL
pizzaSales$rownames <- NULL

# Set data column to date
pizzaSales$date <- as.Date(pizzaSales$date)

# Use hms package to set time data type without date
pizzaSales$time <- as_hms(pizzaSales$time)

# Function to set column as a factor
setFactor <- function(data, colname) {
  data[[colname]] <- as.factor(data[[colname]])
  return(data)
}

# List of all columns to convert to factor
factorColumns <- c(
  "name",
  "size",
  "type"
)

# Factor levels
levels(pizzaSales$name)
levels(pizzaSales$size)
levels(pizzaSales$type)

# Loop through the columns and apply the function
for (col in factorColumns) {
  pizzaSales <- setFactor(pizzaSales, col)
}

### Exploratory analysis ###

# Distribution of pizzas by size
table(pizzaSales$size)

# Distribution of pizzas by type
table(pizzaSales$type)

# Distribution of pizzas by name
table(pizzaSales$name)

### 1. Graphic in base R ###

# Create a table of pizza types and sizes
pizzaSizeCounts <- table(pizzaSales$type, pizzaSales$size)


# Pizza types by size bar plot
barplot(pizzaSizeCounts, 
        col = brewer.pal(n = 4, name = "Set2"), 
        legend = rownames(pizzaSizeCounts),
        main = "Pizza Types by Size",
        xlab = "Pizza Size", 
        ylab = "Count",
        ylim = c(0, 20000))

### 2. Graphic using lattice package ###

# Create a frequency table of pizza types
pizzaCounts <- as.data.frame(table(pizzaSales$type))

# Bar chart visualization
barchart(Freq ~ Var1, data = pizzaCounts, 
         col = brewer.pal(n = 4, name = "Set2"),
         xlab = "Pizza Type", ylab = "Count",
         main = "Number of Pizzas per Type")

### 3. ggplot2 visual ###

# Faceted Scatter Plot: Price vs. Size by Type
ggplot(pizzaSales, aes(x = price, y = size, color = type)) +
  geom_point(alpha = 1, size = 3) +                   # Scatter plot points
  facet_wrap(~ type) +                                # Facet by pizza type
  labs(title = "Price vs Size by Pizza Type",         # Title
       x = "Price ($)",                               # X-axis label
       y = "Pizza Size",                              # Y-axis label
       color = "Pizza Type") +                        # Color legend
  theme_minimal() +                                   # Clean theme
  scale_color_brewer(palette = "Set2") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotate x-axis label
2
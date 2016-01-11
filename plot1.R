# Course: Exploratory Data Analysis
# Assignment: Course Project 1
# Plot 1

# Set working directory to the folder of the unzipped dataset file. Change if necessary
setwd(getwd())

# Read dataset
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Subset the dataset from the dates 2007-02-01 and 2007-02-02
power <- transform(power, Date = as.Date(Date, format = "%d/%m/%Y"))
powerSubset <- subset(power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Remove original dataset
rm(power)

# Open file device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Create the plot and send it to the PNG file
hist(powerSubset$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

# Close the file device
dev.off()

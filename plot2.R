# Course: Exploratory Data Analysis
# Assignment: Course Project 1
# Plot 2

# Set working directory to the folder of the unzipped dataset file. Change if necessary
setwd(getwd())

# Read dataset
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Subset the dataset from the dates 2007-02-01 and 2007-02-02
power <- transform(power, Date = as.Date(Date, format = "%d/%m/%Y"))
powerSubset <- subset(power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Remove original dataset
rm(power)

# Add column 'datetime' containing date and time
powerSubset <- transform(powerSubset, datetime = strptime(paste(Date, Time), format("%Y-%m-%d %H:%M:%S")))

# Open file device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Set LC_TIME to make sure weekday names are in English
Sys.setlocale("LC_TIME", "English")

# Create the plot and send it to the PNG file
with(powerSubset, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Close the file device
dev.off()

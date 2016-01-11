# Course: Exploratory Data Analysis
# Assignment: Course Project 1
# Plot 3

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
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# Set LC_TIME to make sure weekday names are in English
Sys.setlocale("LC_TIME", "English")

# Create the plot with data for sub-metering No. 1
with(powerSubset, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))

# Add line for sub-metering No. 2
with(powerSubset, points(datetime, Sub_metering_2, type = "l", col = "red"))

# Add line for sub-metering No. 3
with(powerSubset, points(datetime, Sub_metering_3, type = "l", col = "blue"))

# Add legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the file device
dev.off()

# Course: Exploratory Data Analysis
# Assignment: Course Project 1
# Plot 4

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
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Set LC_TIME to make sure weekday names are in English
Sys.setlocale("LC_TIME", "English")

# Set number of columns and rows
par(mfrow = c(2,2))

# Create first plot
with(powerSubset, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# Create second plot
with(powerSubset, plot(datetime, Voltage, type = "l"))

# Create and annotate third plot
with(powerSubset, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(powerSubset, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(powerSubset, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Create fourth plot
with(powerSubset, plot(datetime, Global_reactive_power, type = "l"))

# Close the file device
dev.off()

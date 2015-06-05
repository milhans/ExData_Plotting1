## Coursera ExDataAnalysis - Project 1 - Jackie Milhans - PLOT1

# Read dataset
dataElectric <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?", stringsAsFactors=FALSE)

# Create datetime variable
dataElectric$DateTime <- paste(dataElectric$Date,dataElectric$Time)
# Convert to datetime class
dataElectric$DateTime <- as.Date(dataElectric$DateTime, format="%d/%m/%Y %H:%M:%S")

library(dplyr)
#Filter out unneeded dates
subsettedElectric <- filter(dataElectric, DateTime >= as.Date("2007-02-01"), DateTime < as.Date("2007-02-03"))

# plot 1
png("plot1.png")
hist(subsettedElectric$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
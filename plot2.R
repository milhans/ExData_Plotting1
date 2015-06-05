## Coursera ExDataAnalysis - Project 1 - Jackie Milhans - PLOT2

# Read dataset
dataElectric <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?", stringsAsFactors=FALSE)

# Create datetime variable
dataElectric$DateTime <- paste(dataElectric$Date,dataElectric$Time)
# Convert to datetime class
dataElectric$DateTime <- as.Date(dataElectric$DateTime, format="%d/%m/%Y %H:%M:%S")

library(dplyr)
#Filter out unneeded dates
subsettedElectric <- filter(dataElectric, DateTime >= as.Date("2007-02-01"), DateTime < as.Date("2007-02-03"))

# plot 2
png("plot2.png")
subsettedElectric$DateTime <- as.POSIXct(paste(subsettedElectric$Date, subsettedElectric$Time),  format="%d/%m/%Y %H:%M:%S")
plot(subsettedElectric$DateTime, subsettedElectric$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
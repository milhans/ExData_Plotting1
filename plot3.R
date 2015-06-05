## Coursera ExDataAnalysis - Project 1 - Jackie Milhans - PLOT3

# Read dataset
dataElectric <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?", stringsAsFactors=FALSE)

# Create datetime variable
dataElectric$DateTime <- paste(dataElectric$Date,dataElectric$Time)
# Convert to datetime class
dataElectric$DateTime <- as.Date(dataElectric$DateTime, format="%d/%m/%Y %H:%M:%S")

library(dplyr)
#Filter out unneeded dates
subsettedElectric <- filter(dataElectric, DateTime >= as.Date("2007-02-01"), DateTime < as.Date("2007-02-03"))

#plot 3
png("plot3.png")
subsettedElectric$DateTime <- as.POSIXct(paste(subsettedElectric$Date, subsettedElectric$Time),  format="%d/%m/%Y %H:%M:%S")
plot(subsettedElectric$DateTime, subsettedElectric$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(subsettedElectric$DateTime,subsettedElectric$Sub_metering_3, col="blue")
lines(subsettedElectric$DateTime,subsettedElectric$Sub_metering_2, col="red")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=c(1,1,1))
dev.off()
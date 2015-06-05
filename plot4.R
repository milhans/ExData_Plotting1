## Coursera ExDataAnalysis - Project 1 - Jackie Milhans - PLOT4

# Read dataset
dataElectric <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?", stringsAsFactors=FALSE)

# Create datetime variable
dataElectric$DateTime <- paste(dataElectric$Date,dataElectric$Time)
# Convert to datetime class
dataElectric$DateTime <- as.Date(dataElectric$DateTime, format="%d/%m/%Y %H:%M:%S")

library(dplyr)
#Filter out unneeded dates
subsettedElectric <- filter(dataElectric, DateTime >= as.Date("2007-02-01"), DateTime < as.Date("2007-02-03"))

#plot 4
png("plot4.png")
par(mfrow=c(2,2),mar=c(4,4,2,1))
subsettedElectric$DateTime <- as.POSIXct(paste(subsettedElectric$Date, subsettedElectric$Time),  format="%d/%m/%Y %H:%M:%S")
with(subsettedElectric,{
  plot(subsettedElectric$DateTime, subsettedElectric$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")
  plot(subsettedElectric$DateTime, subsettedElectric$Voltage,type="l",ylab="Voltage",xlab="datetime")
  plot(subsettedElectric$DateTime, subsettedElectric$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(subsettedElectric$DateTime,subsettedElectric$Sub_metering_3, col="blue")
  lines(subsettedElectric$DateTime,subsettedElectric$Sub_metering_2, col="red")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=c(1,1,1),cex=0.8)
  plot(subsettedElectric$DateTime, subsettedElectric$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()
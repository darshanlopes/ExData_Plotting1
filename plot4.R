## Exploratory Data Analyis - Week 1 - Plot4 Assignment

# Read data into table

dataSource <- "household_power_consumption.txt"
dataTable <- read.table(dataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset the data
subData <- dataTable[dataTable$Date %in% c("1/2/2007","2/2/2007") ,]
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActPower <- as.numeric(subData$Global_active_power)
globalReactPower <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)

subMeter1 <- as.numeric(subData$Sub_metering_1)
subMeter2 <- as.numeric(subData$Sub_metering_2)
subMeter3 <- as.numeric(subData$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(dateTime, globalActPower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")


plot(dateTime, subMeter1, type="l", ylab="Energy Submetering", xlab="")

lines(dateTime, subMeter2, type="l", col="red")
lines(dateTime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateTime, globalReactPower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Turn off device
device_Off <- dev.off()
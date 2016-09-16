## Exploratory Data Analyis - Week 1 - Plot2 Assignment

# Read data into table

dataSource <- "household_power_consumption.txt"
dataTable <- read.table(dataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset the data
subData <- dataTable[dataTable$Date %in% c("1/2/2007","2/2/2007") ,]


dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActPower <- as.numeric(subData$Global_active_power)
png("plot2.png", width=480, height=480)

# plot data
plot(dateTime, globalActPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")


# Turn off device
device_Off <- dev.off()
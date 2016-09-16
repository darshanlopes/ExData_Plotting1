## Exploratory Data Analyis - Week 1 - Plot1 Assignment

# Read data into table
dataSource <- "household_power_consumption.txt"
dataTable <- read.table(dataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset the data
subData <- dataTable[dataTable$Date %in% c("1/2/2007","2/2/2007") ,]

globalActPower <- as.numeric(subData$Global_active_power)

# open device
png("plot1.png", width=480, height=480)

# plot data
hist(globalActPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


# Turn off device
device_Off <- dev.off()
#Data read and store in to data frame
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#filter subset
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#extract required fields
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)


#Crete PNG file
png("plot4.png", width=480, height=480)

#Define Row 2 x Col 2 grid for plots
par(mfrow=c(2,2))

# 1st plot Row = 1 Col = 1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

# 1st plot Row = 1 Col = 2
plot(datetime, voltage, type="l", xlab="", ylab="Voltage")

# 1st plot Row = 2 Col = 1
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# 1st plot Row = 2 Col = 2
plot(datetime, globalReactivePower, type="l", xlab="", ylab="Global Re-active Power")

dev.off()

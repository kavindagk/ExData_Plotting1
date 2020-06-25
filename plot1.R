#Data read and store in to data frame
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#filter subset
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#extract required fields
globalActivePower <- as.numeric(subSetData$Global_active_power)


#Crete PNG file
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

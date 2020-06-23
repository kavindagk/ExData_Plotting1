dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]



#ggplot
ggplot(data=subSetData,aes(as.numeric(Global_active_power))) + geom_histogram(bins = 10)


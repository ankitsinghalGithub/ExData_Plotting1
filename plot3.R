#assign file name
file <- "household_power_consumption.txt"

# read data from file
dataTable <- read.table(file,header=TRUE, na.strings="?", sep=";" )

# convert the Date 
dataTable$Date <- as.Date(dataTable$Date, format="%d/%m/%Y")

# selecting  data from the dates 2007-02-01 and 2007-02-02
filterData <- subset(dataTable, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(filterData$Date), filterData$Time)
datetime1 <- as.POSIXct(datetime)

#ploting
png("plot3.png", width=480, height=480)
plot(datetime1, filterData$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime1, filterData$Sub_metering_2, type="l", col="red")
lines(datetime1, filterData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

#closing device
dev.off()

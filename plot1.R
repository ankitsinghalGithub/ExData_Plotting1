#assign file name
file <- "household_power_consumption.txt"

# read data from file
dataTable <- read.table(file,header=TRUE, na.strings="?", sep=";" )

# convert the Date; time not reqired in this case.
dataTable$Date <- as.Date(dataTable$Date, format="%d/%m/%Y")

# selecting  data from the dates 2007-02-01 and 2007-02-02
filterData <- subset(dataTable, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#ploting
png("plot1.png", width=480, height=480)
hist(filterData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#closing device
dev.off()
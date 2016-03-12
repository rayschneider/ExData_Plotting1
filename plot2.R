## Set your directory to the location of the household_power_consumption.txt file.

directory <- 'CHANGE DIR NAME'

setwd(directory)

## Read data, create and convert DataTime to POSIXlt format.

data <- read.csv('household_power_consumption.txt',header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format= "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.integer(data$Sub_metering_1)
data$Sub_metering_2 <- as.integer(data$Sub_metering_2)
data$Sub_metering_3 <- as.integer(data$Sub_metering_3)

## Plot 2 Global Active Power Line Graph over Time
png('plot2.png', width = 480, height = 480, units = 'px')
plot(data$DateTime, data$Global_active_power, 
     type = "l",
     ylab = 'Global Active Power (kilowatts)',
     xlab = "")
dev.off()
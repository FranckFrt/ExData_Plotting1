
# read data fow zipped txt file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), nrows=69517, sep=";", header=TRUE, dec = ".", na.strings = "?")
unlink(temp)

# convert date and time
data$Time <- strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data = subset(data, Time >= strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S") & Time < strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S"))


# draw plot 4
png(file = "plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with (data, {
  plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(Time, Sub_metering_2, col="red")
  lines(Time, Sub_metering_3, col="blue")
  legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
})
dev.off()



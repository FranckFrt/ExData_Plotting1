
# read data fow zipped txt file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), nrows=69517, sep=";", header=TRUE, dec = ".", na.strings = "?")
unlink(temp)

# convert date and time
data$Time <- strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data = subset(data, Time >= strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S") & Time < strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S"))


# draw plot 2
Sys.setlocale("LC_TIME", "English")
png(file = "plot2.png", width=480, height=480)
with (data, {
  plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
})
dev.off()



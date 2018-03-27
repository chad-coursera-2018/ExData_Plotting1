#set WD source
setwd("C:\\Users\\Chad\\Desktop\\GITTED\\ExData_Plotting1")

## load data (only between 2007-02-01 and 2007-02-02)
data <- read.table("C:\\Users\\Chad\\Desktop\\GITTED\\household_power_consumption.txt", header=T, sep = ";", colClasses = "character", nrows = 70000, na.strings = "?")
data <- rbind(subset(data, Date == "1/2/2007"), subset(data, Date == "2/2/2007"))

## prepare date and time data
datetime <- paste(data$Date, data$Time)
data <- cbind(data, datetime)

## convert time format
data$datetime = strptime(data$datetime, "%d/%m/%Y %H:%M:%S")

## plot

# set layout (2x2 grid)
par(mfrow = c(2,2))

# plot graph 1
with(data, plot(datetime, Global_active_power, ylab = "Global Active Power", xlab = "", type = "l" ))

# plot graph 2
with(data, plot(datetime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l" ))

# plot graph 3 - data, lines, then legend
with(data, plot(datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", lty = 1 ))
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd = c(1.5,1.5,1.5), col = c("black","blue","red"), bty = 'n', cex = 0.5, y.intersp = 0.25, inset = 0.0025)

# plot graph 4
with(data, plot(datetime, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l" ))

# output file
dev.copy(png, file = "plot4.png")
dev.off()


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

# blank
png("plot3.png", width=480, height=480)

# plot each dataset
with(data, plot(datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", lty = 1 ))

# add lines
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")

# add legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd = c(1.5,1.5,1.5), col = c("black","blue","red"))

## output to file
dev.copy(png, file = "plot3.png")
dev.off()


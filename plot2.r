#set WD source
setwd("C:\\Users\\Chad\\Desktop\\GITTED\\ExData_Plotting1")

## load data (only between 2007-02-01 and 2007-02-02)
data <- read.table("C:\\Users\\Chad\\Desktop\\GITTED\\household_power_consumption.txt", header=T, sep = ";", colClasses = "character", nrows = 70000, na.strings = "?")

## prepare row and column layout
data <- rbind(subset(data, Date == "1/2/2007"), subset(data, Date == "2/2/2007"))
datetime <- paste(data$Date, data$Time)
data <- cbind(data, datetime)

## convert time format
data$datetime = strptime(data$datetime, "%d/%m/%Y %H:%M:%S")

# plot
with(data, plot(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l" ))
dev.copy(png, file = "plot2.png")
dev.off()
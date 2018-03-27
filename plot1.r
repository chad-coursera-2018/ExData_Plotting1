#set WD source
setwd("C:\\Users\\Chad\\Desktop\\GITTED\\ExData_Plotting1")

## load data (only between 2007-02-01 and 2007-02-02)
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 "C:\\Users\\Chad\\Desktop\\GITTED\\household_power_consumption.txt"'),header=F, sep=';',as.is=F,na.strings=c('?'),stringsAsFactors=F)

## get headers from original file
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

## plot the data
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## plot
dev.copy(png, file = "plot1.png")
dev.off()

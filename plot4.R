##reading the data from household_power_consumption.txt
DataPower<-read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, dec = ".")
## subsetting the data to the 1/2/2007 and 2/2/2007 periods
SubData<-DataPower[DataPower$Date %in% c("1/2/2007","2/2/2007"),]
# formatting Data and Time in one variable
DateAndTime<-strptime(paste(SubData$Date,SubData$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

#opening a graphic device
png("plot4.png", width = 480, height = 480)
#setting frames
par(mfrow=c(2,2))

# plot 1
plot(DateAndTime,SubData$Global_active_power, ylab = "Global Active Power", xlab="", type = "l")

#plot2
plot(DateAndTime,SubData$Voltage, ylab = "Voltage", xlab="datetime", type = "l")

#plot 3
plot(DateAndTime,SubData$Sub_metering_1, ylab = "Energy sub metering", xlab="", type = "l")
#adding two another lines to plot 3
lines(DateAndTime,SubData$Sub_metering_2, col="red")
lines(DateAndTime,SubData$Sub_metering_3, col="blue")

#adding legend to plot 3
legend(legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),"topright", col = c("black","red","blue"), 
       lty = c(1,1), bty="n")

#plot4
plot(DateAndTime,SubData$Global_active_power, ylab = "Global_reactive_power", xlab="datetime", type = "l")

dev.off()

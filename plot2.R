##reading the data from household_power_consumption.txt
DataPower<-read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, dec = ".")
## subsetting the data to the 1/2/2007 and 2/2/2007 periods
SubData<-DataPower[DataPower$Date %in% c("1/2/2007","2/2/2007"),]
# formatting Data and Time in one variable
DateAndTime<-strptime(paste(SubData$Date,SubData$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")


#opening a graphic device
png("plot2.png", width = 480, height = 480)
#making graph and closing the graphic device
plot(DateAndTime,SubData$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type = "l")
dev.off()

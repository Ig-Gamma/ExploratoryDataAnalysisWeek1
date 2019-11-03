##reading the data from household_power_consumption.txt
DataPower<-read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, dec = ".")
## subsetting the data to the 1/2/2007 and 2/2/2007 periods
SubData<-DataPower[DataPower$Date %in% c("1/2/2007","2/2/2007"),]

#opening a graphic device
png("plot1.png", width = 480, height = 480)
#making graph and closing the graphic device
hist(SubData$Global_active_power,col = "red",main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

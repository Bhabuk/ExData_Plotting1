filecontent<-read.table("household_power_consumption.txt",header = TRUE,sep=";",colClasses = c("character","character",rep("numeric",7)),na="?")
newdata<- subset(filecontent,filecontent$Date %in% c('1/2/2007','2/2/2007'))

DateMerge <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("Plot4.png",width = 480, height = 480,units = "px")

par(mfrow=c(2,2))

plot(DateMerge,newdata$Global_active_power , type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(DateMerge,newdata$Voltage , type="l", xlab="datetime", ylab="Voltage")

plot(DateMerge,newdata$Sub_metering_1 , type="l", xlab="", ylab="Enery sub metering")
lines(DateMerge,newdata$Sub_metering_2, type="l", col="red")
lines(DateMerge,newdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(DateMerge,newdata$Global_reactive_power , type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


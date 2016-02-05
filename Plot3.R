filecontent<-read.table("household_power_consumption.txt",header = TRUE,sep=";",colClasses = c("character","character",rep("numeric",7)),na="?")
newdata<- subset(filecontent,filecontent$Date %in% c('1/2/2007','2/2/2007'))

DateMerge <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("Plot3.png",width = 480, height = 480,units = "px")

plot(DateMerge,newdata$Sub_metering_1 , type="l", xlab="", ylab="Enery sub metering")
lines(DateMerge,newdata$Sub_metering_2, type="l", col="red")
lines(DateMerge,newdata$Sub_metering_3, type="l", col="blue")

dev.off()

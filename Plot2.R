filecontent<-read.table("household_power_consumption.txt",header = TRUE,sep=";",colClasses = c("character","character",rep("numeric",7)),na="?")
newdata<- subset(filecontent,filecontent$Date %in% c('1/2/2007','2/2/2007'))

DateMerge <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("Plot2.png",width = 480, height = 480,units = "px")

plot(DateMerge,newdata$Global_active_power , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

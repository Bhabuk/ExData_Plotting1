filecontent<-read.table("household_power_consumption.txt",header = TRUE,sep=";",colClasses = c("character","character",rep("numeric",7)),na="?")
newdata<- subset(filecontent,filecontent$Date %in% c('1/2/2007','2/2/2007'))

png("Plot1.png",width = 480, height = 480,units = "px")

hist(newdata$Global_active_power, col = "Red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power" )

dev.off()



alldata<-read.csv("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#only dates from 2007-02-01 and 2007-02-02


alldata$Date<-as.Date(alldata$Date,format="%d/%m/%Y")
alldata2<-alldata[alldata$Date=="2007-02-01" | alldata$Date=="2007-02-02",]



png(filename = "plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))
plot(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Global_active_power,xlab="",ylab="Global Active Power",col="black",type="l")
plot(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Voltage,xlab="datetime",ylab="Voltage",col="black",type="l")


plot(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Sub_metering_1,col="black",lty=1.5)
lines(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Sub_metering_2,col="red",lty=1.5)
lines(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Sub_metering_3,col="blue",lty=1.5)
legend("topright",lty=c(1,1),col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",col="black",type="l")

dev.off()
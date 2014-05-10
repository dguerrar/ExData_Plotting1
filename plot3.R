alldata<-read.csv("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#only dates from 2007-02-01 and 2007-02-02


alldata$Date<-as.Date(alldata$Date,format="%d/%m/%Y")
alldata2<-alldata[alldata$Date=="2007-02-01" | alldata$Date=="2007-02-02",]


png(filename = "plot3.png",width = 480, height = 480)


plot(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Sub_metering_1,col="black",lty=1.5)
lines(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Sub_metering_2,col="red",lty=1.5)
lines(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Sub_metering_3,col="blue",lty=1.5)
legend("topright",lty=c(1,1),col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
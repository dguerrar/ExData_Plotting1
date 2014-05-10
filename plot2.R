alldata<-read.csv("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#only dates from 2007-02-01 and 2007-02-02


alldata$Date<-as.Date(alldata$Date,format="%d/%m/%Y")
alldata2<-alldata[alldata$Date=="2007-02-01" | alldata$Date=="2007-02-02",]


png(filename = "plot2.png",width = 480, height = 480)
plot(strptime(paste(alldata2$Date," ",alldata2$Time),format="%Y-%m-%d %H:%M:%S"),alldata2$Global_active_power,xlab="Global Active Power (kilowats)",ylab="Frequency",col="black",type="l")
dev.off()
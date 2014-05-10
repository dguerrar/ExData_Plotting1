alldata<-read.csv("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#only dates from 2007-02-01 and 2007-02-02


alldata$Date<-as.Date(alldata$Date,format="%d/%m/%Y")
alldata2<-alldata[alldata$Date=="2007-02-01" | alldata$Date=="2007-02-02",]


png(filename = "plot1.png",width = 480, height = 480)
hist(alldata2$Global_active_power,main ="Global Active Power",xlab="Global Active Power (kilowats)",ylab="Frequency",col="red")
dev.off()
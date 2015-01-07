hpc <- read.csv("household_power_consumption.txt", sep=";")
hpc <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
hpc$DateTime<-strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
hpc$Sub_metering_1<-as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2<-as.numeric(as.character(hpc$Sub_metering_2))
# 3 - submetering
png(filename="plot3.png",width=480,height=480)
plot(hpc$DateTime,hpc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(hpc$DateTime,hpc$Sub_metering_1,col="black")
lines(hpc$DateTime,hpc$Sub_metering_2,col="red")
lines(hpc$DateTime,hpc$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","blue","red"),legend=names(hpc[7:9]))
dev.off()

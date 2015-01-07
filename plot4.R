hpc <- read.csv("household_power_consumption.txt", sep=";")
hpc <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
hpc$DateTime<-strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
hpc$Global_active_power<-as.numeric(as.character(hpc$Global_active_power))
hpc$Global_reactive_power<-as.numeric(as.character(hpc$Global_reactive_power))
hpc$Voltage<-as.numeric(as.character(hpc$Voltage))
hpc$Sub_metering_1<-as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2<-as.numeric(as.character(hpc$Sub_metering_2))
# 4 - 2 X 2 plots
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
# upper left
plot(hpc$DateTime,hpc$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(hpc$DateTime,hpc$Global_active_power)
# upper right
with(hpc,plot(DateTime,Voltage,type="n"))
with(hpc,lines(DateTime,Voltage))
# lower left
plot(hpc$DateTime,hpc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(hpc$DateTime,hpc$Sub_metering_1,col="black")
lines(hpc$DateTime,hpc$Sub_metering_2,col="red")
lines(hpc$DateTime,hpc$Sub_metering_3,col="blue")
legend("topright",lty=1,bty="n",col=c("black","blue","red"),legend=names(hpc[7:9]))
# lower right
with(hpc,plot(DateTime,Global_reactive_power,type="n"))
with(hpc,lines(DateTime,Global_reactive_power))
dev.off()

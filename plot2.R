hpc <- read.csv("household_power_consumption.txt", sep=";")
hpc <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
hpc$DateTime<-strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
hpc$Global_active_power<-as.numeric(as.character(hpc$Global_active_power))
# 2 - global active power
png(filename="plot2.png",width=480,height=480)
plot(hpc$DateTime,hpc$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(hpc$DateTime,hpc$Global_active_power)
dev.off()

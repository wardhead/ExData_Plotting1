hpc <- read.csv("household_power_consumption.txt", sep=";")
hpc <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
hpc$DateTime<-strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
hpc$Global_active_power<-as.numeric(as.character(hpc$Global_active_power))
# 1 histogram
png(filename="plot1.png",width=480,height=480)
hist(hpc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

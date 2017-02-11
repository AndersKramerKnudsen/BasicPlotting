library(lubridate)

Sys.setlocale(category = "LC_ALL", locale = "english")
setwd("C:\\Users\\ankkn\\Desktop\\R\\kursus\\data_exploration")

data<-read.csv("household_power_consumption.txt",sep=";", header = T)
data<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
data[data=="?"] = NA

date<-as.Date(data$Date, format = "%d/%m/%Y")
time<-hms(data$Time)
gap<-as.numeric(as.character(data$Global_active_power))
grp<-as.numeric(as.character(data$Global_reactive_power))
vol<-as.numeric(as.character(data$Voltage))
gi<-as.numeric(as.character(data$Global_intensity))
sm1<-as.numeric(as.character(data$Sub_metering_1))
sm2<-as.numeric(as.character(data$Sub_metering_2))
sm3<-as.numeric(as.character(data$Sub_metering_3))
datetime<-date+time

data<-cbind(datetime, date, time, gap, grp, vol, gi, sm1, sm2, sm3)

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#plot1
plot(datetime, gap, type="l", xlab = "", ylab = "Global Active Power (Kilowatts)")
#plot2
plot(datetime, vol, type="l", xlab = "datetime", ylab ="Voltage" )
#plot3
plot(datetime, sm1, type="l", xlab = "", ylab = "Energy sub metering")
points(datetime, sm2, type="l", col="red")
points(datetime, sm3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1, bty="n")
#plot4
plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
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

png(filename="plot1.png", width=480, height=480)
hist(gap, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

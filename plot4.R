urlzipfile="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "./data/powerconsumption.zip"

#downloading and preparing data
if(!file.exists("./data")){dir.create("./data")}
download.file(urlzipfile,zipfile)
powerconsumption <- read.table(unzip(zipfile=zipfile),
                               sep=";",na.strings = "?",header=TRUE)
powerconsumption <- subset(powerconsumption,
                           Date=="1/2/2007"| Date=="2/2/2007")
powerconsumption$Date <- as.Date(powerconsumption$Date,format="%d/%m/%Y")
powerconsumption$datetime <- strptime(with(powerconsumption,paste(Date,Time)),
                                      "%Y-%m-%d %H:%M:%S")

#create plots in a png file
png("plot4.png")
par(pch=" ",mfrow=c(2,2), mar=c(4,4,2,2))
#create plot 1
with(powerconsumption,plot(datetime,Global_active_power,
                           xlab="",ylab="Global Active Power"))
with(powerconsumption,lines(datetime,Global_active_power))

#create plot 2
with(powerconsumption,plot(datetime,Voltage,
                           ylab="Voltage"))
with(powerconsumption,lines(datetime,Voltage))

#create plot 3
with(powerconsumption,plot(datetime,Sub_metering_1,
     xlab="",ylab="Energy sub metering"))
with(powerconsumption,lines(datetime,Sub_metering_1))
with(powerconsumption,lines(datetime,Sub_metering_2,col="red"))
with(powerconsumption,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")

#create plot 4
with(powerconsumption,plot(datetime,Global_reactive_power))
with(powerconsumption,lines(datetime,Global_reactive_power))

dev.off()

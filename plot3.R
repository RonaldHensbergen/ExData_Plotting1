urlzipfile="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "./data/powerconsumption.zip"

if(!file.exists("./data")){dir.create("./data")}
download.file(urlzipfile,zipfile)
powerconsumption <- read.table(unzip(zipfile=zipfile),
                               sep=";",na.strings = "?",header=TRUE)
powerconsumption <- subset(powerconsumption,
                           Date=="1/2/2007"| Date=="2/2/2007")
powerconsumption$Date <- as.Date(powerconsumption$Date,format="%d/%m/%Y")
powerconsumption$Datetime <- strptime(with(powerconsumption,paste(Date,Time)),
                                      "%Y-%m-%d %H:%M:%S")

png("plot3.png")
par(pch=" ")
with(powerconsumption,plot(Datetime,Sub_metering_1,
     xlab="",ylab="Energy sub metering"))
with(powerconsumption,lines(Datetime,Sub_metering_1))
with(powerconsumption,lines(Datetime,Sub_metering_2,col="red"))
with(powerconsumption,lines(Datetime,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

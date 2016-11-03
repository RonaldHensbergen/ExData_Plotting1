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

png("plot2.png")
par(pch=" ")
with(powerconsumption,plot(Datetime,Global_active_power,
                           ylab="Global Active Power (kilowatts)",
                           xlab=""))
lines(powerconsumption$Datetime,powerconsumption$Global_active_power)
dev.off()

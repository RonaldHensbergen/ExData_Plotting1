urlzipfile="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "./data/powerconsumption.zip"

if(!file.exists("./data")){dir.create("./data")}
download.file(urlzipfile,zipfile)
powerconsumption<-read.table(unzip(zipfile=zipfile),sep=";",na.strings = "?",header=TRUE)
powerconsumption<-subset(powerconsumption,Date=="1/2/2007"| Date=="2/2/2007")

png("plot1.png")
hist(powerconsumption$Global_active_power,
     col="red",breaks=20,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()

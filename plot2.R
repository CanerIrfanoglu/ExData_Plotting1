temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
library(data.table)
Electricdata <- read.table(unz(temp, "household_power_consumption.txt"),header=TRUE,sep=";",stringsAsFactors=FALSE)
Electricdata2<- subset(Electricdata, Electricdata$Date %in% c("1/2/2007", "2/2/2007"))
unlink(temp)
datesx <- strptime(paste(Electricdata2$Date,Electricdata2$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
activepowa <- as.numeric(Electricdata2$Global_active_power) 
plot(datesx,activepowa, type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png",width=480,height=480,units="px",res=100)
dev.off()

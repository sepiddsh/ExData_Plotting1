temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, method="curl")
data <- read.table(unzip(temp, "household_power_consumption.txt"),sep=";",header=TRUE, na.strings = "?")
unlink(temp)
relevant_data <- data[(data$Date=="1/2/2007") | (data$Date=="2/2/2007"),] 
a <- relevant_data
dates <- a$Date
times <- a$Time
x <- paste(dates, times)
a$datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")
plot(a$datetime,a$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l",col="black")
lines(a$datetime,a$Sub_metering_2,ylab="Energy sub metering",xlab="",type="l",col="red")
lines(a$datetime,a$Sub_metering_3,ylab="Energy sub metering",xlab="",type="l",col="blue")
legend("topright",names(a)[7:9],col=c("black","red","blue"),lwd=1,bty="n")
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
#legend("topright",legend="Sub_metering_1")
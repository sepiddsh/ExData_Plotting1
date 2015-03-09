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
hist(a$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
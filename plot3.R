mydata <- read.csv("./household_power_consumption.txt", sep = ";")
x <- mydata$Date
x <- as.character(x)
relevant <-which(x == "1/2/2007" | x == "2/2/2007")
mydata <- mydata[relevant, ]  ## Data for the relevant period
Global.Active.Power <- as.numeric(as.character(mydata[,3]))
Times <- as.character(mydata$Time)
Dates <- x[relevant]
DateTime <- paste(Dates, Times, sep = "/")
DateTime <- strptime(DateTime, format = "%d/%m/%Y/%H:%M:%S")
Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3))
plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(DateTime, Sub_metering_1, type = "l", col = "black")
lines(DateTime, Sub_metering_2, type = "l", col = "red")
lines(DateTime, Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = c(1,1,1))

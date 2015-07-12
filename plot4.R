png(file = "./plot4.png", width = 480, height = 480)
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
Voltage <- as.numeric(as.character(mydata$Voltage))
Global_reactive_power <- as.numeric(as.character(mydata[,4]))
par(mfrow=c(2,2))

## Top Left Plot
plot(DateTime, 
     Global.Active.Power, 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)", 
     type = "l"
     )

## Top Right Plot
plot(DateTime,
     Voltage,
     xlab = "datetime",
     type = "l"
     )

## Bottom Left Plot
plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(DateTime, Sub_metering_1, type = "l", col = "black")
lines(DateTime, Sub_metering_2, type = "l", col = "red")
lines(DateTime, Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = c(1,1,1),
       bty = "n"
      )

## Bottom Right Plot
plot(DateTime,
     Global_reactive_power,
     xlab = "datetime",
     type = "l"
)
dev.off()

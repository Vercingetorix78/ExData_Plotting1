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
plot(DateTime, 
     Global.Active.Power, 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)", 
     type = "l"
     )

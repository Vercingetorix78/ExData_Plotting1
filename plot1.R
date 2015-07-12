mydata <- read.csv("./household_power_consumption.txt", sep = ";")
x <- mydata$Date
x <- as.character(x)
relevant <-which(x == "1/2/2007" | x == "2/2/2007")
mydata <- mydata[relevant, ]
Global.Active.Power <- as.numeric(as.character(mydata[,3]))
hist(Global.Active.Power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
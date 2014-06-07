data5rows  <- read.table("household_power_consumption.txt", header = TRUE, nrows = 5, sep = ";")
classes  <- sapply(data5rows, class)
names  <- names(data5rows[,3:9])
data  <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", skip = 66636, nrows = 2880, colClasses = classes, na.strings = "?")
DateTime  <- paste(data[,1],data[,2])
DateTime  <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
data = cbind(DateTime,data[,3:9])
names(data)  <- c("DateTime",names)

png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", type = "quartz")
plot(data[,6]~data[,1], type = "l", xlab = "",ylab = "Energy Sub-Metering", ylim = c(0,40));par(new = T);lines(data[,7]~data[,1], type = "l", xlab = "",ylab = "Energy Sub-Metering", ylim = c(0,40), col = "red");lines(data[,8]~data[,1], type = "l", xlab = "",ylab = "Energy Sub-Metering", ylim = c(0,40), col = "blue")
legend("topright", legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), lty = 1, col = c("black","red","blue"))
dev.off()


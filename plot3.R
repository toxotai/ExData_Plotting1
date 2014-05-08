data <- read.table("household_power_consumption.txt",
                   skip = 66637, nrow = 2880, sep = ";", 
                   col.names = colnames(read.table(
                           "household_power_consumption.txt",
                           nrow = 1, header = TRUE, sep=";")))

days <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
plot(days, data$Sub_metering_1, type="n", xlab = "", ylab="Energy Sub Metering")
points(wDays, data$Sub_metering_1, type = "l", col = "black")
points(wDays, data$Sub_metering_2, type = "l", col = "red")
points(wDays, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = "-", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()

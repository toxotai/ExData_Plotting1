data <- read.table("household_power_consumption.txt",
                   skip = 66637, nrow = 2880, sep = ";", 
                   col.names = colnames(read.table(
                           "household_power_consumption.txt",
                           nrow = 1, header = TRUE, sep=";")))

days <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
par(mfrow = c(2,2))
plot(days, data$Global_active_power, type="1", xlab = "", ylab="Global Active Power")

plot(days, data$Voltage, type="1", xlab = "datetime", ylab="Voltage")

plot(days, data$Sub_metering_1, type="n", xlab = "", ylab="Energy Sub Metering")
points(wDays, data$Sub_metering_1, type = "l", col = "black")
points(wDays, data$Sub_metering_2, type = "l", col = "red")
points(wDays, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = "-", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(days, data$Global_reactive_power, type="1", xlab = "datetime", ylab="$Global_reactive_power, ")


dev.copy(png, file = "plot4.png")
dev.off()

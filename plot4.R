data <- read.table("household_power_consumption.txt",
                   skip = 66637, nrow = 2880, sep = ";", 
                   col.names = colnames(read.table(
                           "household_power_consumption.txt",
                           nrow = 1, header = TRUE, sep=";")))

days <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

Sys.setlocale(category = "LC_TIME", locale = "C")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(days, data$Global_active_power, type="l", xlab = "", ylab="Global Active Power")

plot(days, data$Voltage, type="l", xlab = "datetime", ylab="Voltage")

plot(days, data$Sub_metering_1, type="n", xlab = "", ylab="Energy Sub Metering")
points(days, data$Sub_metering_1, type = "l", col = "black")
points(days, data$Sub_metering_2, type = "l", col = "red")
points(days, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty = 1)

plot(days, data$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")

dev.off()

Sys.setlocale(category = "LC_ALL", locale = "")

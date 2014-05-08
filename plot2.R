data <- read.table("household_power_consumption.txt",
                   skip = 66637, nrow = 2880, sep = ";", 
                   col.names = colnames(read.table(
                   "household_power_consumption.txt",
                   nrow = 1, header = TRUE, sep=";")))

wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
plot(wDays, data$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()

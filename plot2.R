data <- read.table("household_power_consumption.txt",
                   skip = 66637, nrow = 2880, sep = ";", 
                   col.names = colnames(read.table(
                   "household_power_consumption.txt",
                   nrow = 1, header = TRUE, sep=";")))

days <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
Sys.setlocale(category = "LC_TIME", locale = "C")

png(filename = "plot2.png", width = 480, height = 480)

plot(days, data$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")

dev.off()

Sys.setlocale(category = "LC_ALL", locale = "")

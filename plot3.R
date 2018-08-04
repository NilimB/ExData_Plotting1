rm(list = ls())
# Data preprocessing
dataEpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dataEpc$Date <- as.Date(dataEpc$Date, format = "%d/%m/%Y")
dataEpc <- subset(dataEpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
dataEpc$datetime <- strptime(paste(dataEpc$Date, dataEpc$Time), "%Y-%m-%d %H:%M:%S")

# Plot 3
dataEpc$datetime <- as.POSIXct(dataEpc$datetime)
png("plot3.png", width=480, height=480)
plot(dataEpc$datetime, dataEpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dataEpc$datetime, dataEpc$Sub_metering_2,  col = "Red")
lines(dataEpc$datetime, dataEpc$Sub_metering_3,  col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

rm(list = ls())
# Data preprocessing
dataEpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dataEpc$Date <- as.Date(dataEpc$Date, format = "%d/%m/%Y")
dataEpc <- subset(dataEpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
dataEpc$datetime <- strptime(paste(dataEpc$Date, dataEpc$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2
dataEpc$datetime <- as.POSIXct(dataEpc$datetime)
globalActivePower <- as.numeric(dataEpc$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dataEpc$datetime, globalActivePower, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

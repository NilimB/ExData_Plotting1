rm(list = ls())
# Data preprocessing
setwd("C:/Users/borah/Desktop/Data Science/John Hopkins University/Exploratory Data Analysis/week1/Project")
epc <- "household_power_consumption.txt"
dataEpc <- read.table(epc, header = TRUE, sep = ";", na.strings = "?")
dataEpc$Date <- as.Date(dataEpc$Date, format = "%d/%m/%Y")
dataEpc <- subset(dataEpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


# Plot 1
globalActivePower <- as.numeric(dataEpc$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

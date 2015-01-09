##Loading the data

##nrows = 2 days * 24 hours/day * 60 times/hour = 2880
data <- read.table(file = "./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2880, skip = 66636)
##assign the colnames for data
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
##convert the Date/Time variables to Date/Time classes
data <- transform(data, datetime = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))


##Making plots: plot3

##construct the plot
with(data, {
plot(datetime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering") ##the type of plot: lines
lines(datetime, Sub_metering_2, col = "red")  ##add the lines: Sub_mertering_2
lines(datetime, Sub_metering_3, col = "blue")  ##add the lines: Sub_mertering_3
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))  ##add the legend
})  
##save the plot to "plot3.png"
dev.copy(png, file = "plot3.png")
dev.off()
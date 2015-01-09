##Loading the data

##nrows = 2 days * 24 hours/day * 60 times/hour = 2880
data <- read.table(file = "./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2880, skip = 66636)
##assign the colnames for data
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
##convert the Date/Time variables to Date/Time classes
data <- transform(data, datetime = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))



##Making plots: plot2

##construct the plot
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)"))  ##the type of plot: lines
##save the plot to "plot2.png"
dev.copy(png, file = "plot2.png")
dev.off()
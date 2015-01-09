##Loading the data

##nrows = 2 days * 24 hours/day * 60 times/hour = 2880
data <- read.table(file = "./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2880, skip = 66636)
##assign the colnames for data
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
##convert the Date/Time variables to Date/Time classes
data <- transform(data, datetime = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))


##Making plots: plot1

##construct the plot
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(Kilowatts)")
##save the plots to "plot1.png"
dev.copy(png, file = "plot1.png")
dev.off()
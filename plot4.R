data <- read.csv("household_power_consumption.txt",sep=";", colClasses = "character", na.strings = "?")

filter_data <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]

filter_data$DateTime <- strptime(paste(filter_data$Date, filter_data$Time, sep=" "),
                                 format = "%d/%m/%Y %H:%M:%S")



png(filename="plot4.png", width = 480, height=480)

par(mfrow=c(2,2))

# Top Left
plot(filter_data$DateTime, 
     filter_data$Global_active_power,
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

# Top Right
plot(filter_data$DateTime, 
     filter_data$Voltage,
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

# Bottom Left
plot(filter_data$DateTime, 
     filter_data$Sub_metering_1,
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")

lines(filter_data$DateTime, 
      filter_data$Sub_metering_2,
      type = "l", col="red")

lines(filter_data$DateTime, 
      filter_data$Sub_metering_3,
      type = "l", col="blue")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = 1)



# Bottom Right
plot(filter_data$DateTime, 
     filter_data$Global_reactive_power,
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()


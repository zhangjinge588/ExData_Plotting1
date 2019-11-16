data <- read.csv("household_power_consumption.txt",sep=";", colClasses = "character", na.strings = "?")

filter_data <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]

filter_data$DateTime <- strptime(paste(filter_data$Date, filter_data$Time, sep=" "),
                                 format = "%d/%m/%Y %H:%M:%S")


png(filename="plot2.png", width = 480, height=480)

plot(filter_data$DateTime, 
     filter_data$Global_active_power,
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()


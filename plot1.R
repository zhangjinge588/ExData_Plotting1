data <- read.csv("household_power_consumption.txt",sep=";", colClasses = "character", na.strings = "?")

filter_data <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]


png(filename="plot1.png", width = 480, height=480)
hist(as.numeric(filter_data$Global_active_power),
     col='red', 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

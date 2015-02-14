date_format <- "%d/%m/%Y"

data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE)


data$DateAsDate <- strptime(data$Date, date_format)
from_date <- strptime("31/1/2007", date_format)
to_date <- strptime("3/2/2007", date_format)
filtered_data <- data[data$DateAsDate > from_date & data$DateAsDate < to_date,]


date_time_format <- "%d/%m/%Y %H:%M:%S"

filtered_data$CalculatedDateTime <- strptime(paste(filtered_data$Date, ' ', filtered_data$Time), date_time_format)

filtered_data$Global_active_power <- as.numeric(filtered_data$Global_active_power)
filtered_data$Global_reactive_power <- as.numeric(filtered_data$Global_reactive_power)
filtered_data$Sub_metering_1 <- as.numeric(filtered_data$Sub_metering_1)
filtered_data$Sub_metering_2 <- as.numeric(filtered_data$Sub_metering_2)
filtered_data$Sub_metering_3 <- as.numeric(filtered_data$Sub_metering_3)
filtered_data$Voltage <- as.numeric(filtered_data$Voltage)


# plot 4
png(filename = "plot4.png")
par(mfrow=c(2,2))

# first
plot(filtered_data$CalculatedDateTime, filtered_data$Global_active_power, type = 'l', ylab = 'Global Active Power', xlab = '')


# second
plot(filtered_data$CalculatedDateTime, filtered_data$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')


# third

plot(filtered_data$CalculatedDateTime, filtered_data$Sub_metering_1, type = 'l', xlab = '', ylab = "Energy sub metering")
lines(filtered_data$CalculatedDateTime, filtered_data$Sub_metering_2, type = 'l', col = "red")
lines(filtered_data$CalculatedDateTime, filtered_data$Sub_metering_3, type = 'l', col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c('black','red','blue'), lty = c(1,1,1), box.lwd = 0)

# forth
plot(filtered_data$CalculatedDateTime, filtered_data$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()
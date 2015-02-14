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


# plot 3
png(filename = "plot3.png")
plot(filtered_data$CalculatedDateTime, filtered_data$Sub_metering_1, type = 'l', xlab = '', ylab = "Energy sub metering")
lines(filtered_data$CalculatedDateTime, filtered_data$Sub_metering_2, type = 'l', col = "red")
lines(filtered_data$CalculatedDateTime, filtered_data$Sub_metering_3, type = 'l', col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c('black','red','blue'), lty = c(1,1,1))
dev.off()

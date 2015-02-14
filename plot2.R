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


# Sys.setlocale("LC_TIME", "en_US.utf8")


# plot 2
png(filename = "plot2.png")
plot(filtered_data$CalculatedDateTime, filtered_data$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()


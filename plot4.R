###     PLOT 4

#Set directory and read data
setwd("./exdata_data_household_power_consumption")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors=FALSE, na.strings = "?")

#Keep only dates from 2007-02-01 and 2007-02-02
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Format datetime variable
subset_data$datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot 4
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(subset_data, plot(datetime, Global_active_power, xlab = " ", ylab = "Global active power", type = "l"))

with(subset_data, plot(datetime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))

with(subset_data, {
  plot(datetime, Sub_metering_1, xlab = " ", ylab = "Energy sub metering", type = "l")
  lines(datetime, Sub_metering_2, type = "l", col="red")
  lines(datetime, Sub_metering_3, type = "l", col="blue")
})
legend("topright", col = c("Black", "Red", "Blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

with(subset_data, plot(datetime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l"))

dev.off()
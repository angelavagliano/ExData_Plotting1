###     PLOT 2

#Set directory and read data
setwd("./exdata_data_household_power_consumption")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors=FALSE, na.strings = "?")

#Keep only dates from 2007-02-01 and 2007-02-02
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Format datetime variable
subset_data$datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot 2
png("plot2.png", width = 480, height = 480)
with(subset_data, plot(datetime, Global_active_power, xlab = " ", ylab = "Global_ active_power (kilowatts)", type = "l"))
dev.off()
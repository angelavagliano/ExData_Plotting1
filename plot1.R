###     PLOT 1 

#Set directory and read data
setwd("./exdata_data_household_power_consumption")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors=FALSE, na.strings = "?")

#Keep only dates from 2007-02-01 and 2007-02-02
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#set Data variable as date type
subset_data$Date <- as.Date(subset_data$Date, format="%d/%m/%Y")

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power, xlab = "Global Active Power (kilowatts", ylab = "Frequency", col = "red", main = "Global Active Power")
dev.off()
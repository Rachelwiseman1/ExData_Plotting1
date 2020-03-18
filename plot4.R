# Read in data from working directory

#setwd("your location here")

# read text file
txtfile <- "household_power_consumption.txt"
data <- read.table(txtfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset for chosen days
power_consumption <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# create vector of dates and times
datetime <- strptime(paste(power_consumption$Date, power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# create vector of global active power
Global_active_power <- as.numeric(power_consumption$Global_active_power)

#create vector for each sub meter
sub1 <- as.numeric(power_consumption$Sub_metering_1)
sub2 <- as.numeric(power_consumption$Sub_metering_2)
sub3 <- as.numeric(power_consumption$Sub_metering_3)

# create vector of global reactive power
Global_reactive_power <- as.numeric(power_consumption$Global_reactive_power)

# create vector of voltage
Voltage <- as.numeric(power_consumption$Voltage)

#produce and export PNG file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
# Read in data from working directory

#setwd("your location here")

# read text file
txtfile <- "household_power_consumption.txt"
data <- read.table(txtfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset for chosen days
power_consumption <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# create vector of dates and times
Date_Time <- strptime(paste(power_consumption$Date, power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# create vector of global active power
Global_active_power <- as.numeric(power_consumption$Global_active_power)

#create vector for each sub meter
sub1 <- as.numeric(power_consumption$Sub_metering_1)
sub2 <- as.numeric(power_consumption$Sub_metering_2)
sub3 <- as.numeric(power_consumption$Sub_metering_3)

#produce and export PNG file
png("plot3.png", width=480, height=480)
plot(Date_Time, sub1, type="l", ylab="Energy Sub metering", xlab="")
lines(Date_Time, sub2, type="l", col="red")
lines(Date_Time, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()
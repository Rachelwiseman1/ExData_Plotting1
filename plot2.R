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

#produce and export PNG file
png("plot2.png", width=480, height=480)
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
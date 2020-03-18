# Read in data from working directory

#setwd("your location here")

power_consumption<-read.csv('household_power_consumption.txt',header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
power_consumption$Date<-as.Date(power_consumption$Date,tryFormats = c("%d-%m-%Y", "%d/%m/%Y"))
power_consumption_Feb<-subset(power_consumption,power_consumption$Date=="2007-02-01"|power_consumption$Date=="2007-02-02")

# plot 1


data<-as.numeric(power_consumption_Feb$Global_active_power)
png("plot1.png",width=480,height=480)
hist(data,col="red",main="Global Active Power",xlab="Global active Power (kilowatts)",ylab="Frequency")
dev.off()



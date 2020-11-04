# reading data
file <- read.table('D:/Coursera/household_power_consumption.txt',header = TRUE, sep = ';')

#filtering data in 2007-02-01 and 2007-02-02
target <- file[file$Date %in% c('1/2/2007','2/2/2007'),]

#modifying data class
TimeDate <- strptime(paste(target$Date, target$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(target$Global_active_power)
vol <- as.numeric(target$Voltage)
energy1_black <- as.numeric(target$Sub_metering_1)
energy2_red <- as.numeric(target$Sub_metering_2)
energy3_blue <- as.numeric(target$Sub_metering_3)
reactive <- as.numeric(target$Global_reactive_power)

#creating the plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(TimeDate, Global_active_power, type="l",xlab='', ylab="Global Active Power")

plot(TimeDate, vol, type="l",xlab='datetime', ylab="Voltage")

plot(TimeDate,energy1_black, type='l',xlab = '', ylab = 'Energy sub metering')
lines(TimeDate, energy2_red, col='red')
lines(TimeDate, energy3_blue, col='blue')
legend("topright", c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col=c('black','red','blue'), bty="n")

plot(TimeDate, reactive, type="l",xlab='datetime', ylab="Global_reactive_power")

dev.off()
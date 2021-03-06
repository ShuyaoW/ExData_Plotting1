# reading data
file <- read.table('D:/Coursera/household_power_consumption.txt',header = TRUE, sep = ';')

#filtering data in 2007-02-01 and 2007-02-02
target <- file[file$Date %in% c('1/2/2007','2/2/2007'),]

#modifying data class
TimeDate <- strptime(paste(target$Date, target$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(target$Global_active_power)

#creating the plot
png("plot2.png", width=480, height=480)
plot(TimeDate, Global_active_power, type="l",xlab='', ylab="Global Active Power (kilowatts)")
dev.off()
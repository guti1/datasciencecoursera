
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
pwr_cons <- read.csv(unz(temp, "household_power_consumption.txt"), header=T, sep=";")
unlink(temp)




head(pwr_cons)
str(pwr_cons)

pwr_cons$Date <- as.Date(pwr_cons$Date, "%d/%m/%Y") 
pwr_cons$Global_active_power <- as.numeric(as.character(pwr_cons$Global_active_power))
pwr_cons$Global_reactive_power <- as.numeric(as.character(pwr_cons$Global_reactive_power))
pwr_cons$Voltage <- as.numeric(as.character(pwr_cons$Voltage))
pwr_cons$Global_intensity <- as.numeric(as.character(pwr_cons$Global_intensity))
pwr_cons$Sub_metering_1 <- as.numeric(as.character(pwr_cons$Sub_metering_1))
pwr_cons$Sub_metering_2 <- as.numeric(as.character(pwr_cons$Sub_metering_2))
pwr_cons$Sub_metering_3 <- as.numeric(as.character(pwr_cons$Sub_metering_3))
pwr_cons$temp <- paste(pwr_cons$Date, pwr_cons$Time, sep=" ")
pwr_cons$datetime <-   strptime(pwr_cons$temp, format="%Y-%m-%d %H:%M:%S")


pwr_cons2 <- pwr_cons[pwr_cons$Date==as.Date("2007-02-01", "%Y-%m-%d")|
                        pwr_cons$Date==as.Date("2007-02-02", "%Y-%m-%d"),]


png( 'plot3.png',
     width = 480, 
     height = 480, 
     units = "px")


plot(pwr_cons2$datetime, pwr_cons2$Sub_metering_1, type='l', ylab='Energy sub metering', xlab='')
lines(pwr_cons2$datetime, pwr_cons2$Sub_metering_2, type='l', col='red')
lines(pwr_cons2$datetime, pwr_cons2$Sub_metering_3, type='l', col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty=1)


dev.off()






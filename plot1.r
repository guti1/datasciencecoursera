

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



pwr_cons2 <- pwr_cons[pwr_cons$Date==as.Date("2007-02-01", "%Y-%m-%d")|
                        pwr_cons$Date==as.Date("2007-02-02", "%Y-%m-%d"),]

plot1 <- hist(pwr_cons2$Global_active_power, col='red', main='Global Active Power', 
              xlab='Global Active Power (kilowatts)' )


png( 'plot1.png',
     width = 480, 
     height = 480, 
     units = "px")
plot(plot1, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)', bg='white')
dev.off()

summary(pwr_cons2)

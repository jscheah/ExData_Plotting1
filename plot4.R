library(dplyr)

#Assume data is copied to data/household_power_consumption.txt
data <- read.table("data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data_df<-tbl_df(data)

#Only get data points for 2007-02-01 and 2007-02-02
filteredData<-filter(data_df, Date <= as.Date("2007-02-02"),  Date >= as.Date("2007-02-01"))

library(datasets)

png(filename = "plot4.png")
par(mfrow = c(2,2))

attach(filteredData)

plot(DateTime,Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

plot(DateTime, Voltage, type="l", ylab = "Volatage", xlab="datetime")

plot(DateTime,Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(DateTime,Sub_metering_2, col="red")  
lines(DateTime,Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(DateTime, Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()


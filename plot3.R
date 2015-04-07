library(dplyr)

#Assume data is copied to data/household_power_consumption.txt
data <- read.table("data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data_df<-tbl_df(data)

#Only get data points for 2007-02-01 and 2007-02-02
filteredData<-filter(data_df, Date <= as.Date("2007-02-02"),  Date >= as.Date("2007-02-01"))

library(datasets)

png(filename = "plot3.png")
plot3<-with(filteredData, plot(DateTime,Sub_metering_1, type="l", ylab = "Energy sub metering", xlab=""))
with(filteredData, lines(DateTime,Sub_metering_2, col="red"))
with(filteredData, lines(DateTime,Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1), col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()


library(dplyr)

#Assume data is copied to data/household_power_consumption.txt
data <- read.table("data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data_df<-tbl_df(data)

#Only get data points for 2007-02-01 and 2007-02-02
filteredData<-filter(data_df, Date <= as.Date("2007-02-02"),  Date >= as.Date("2007-02-01"))

library(datasets)

png(filename = "plot2.png")
plot2<-with(filteredData, plot(DateTime,Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab=""))
dev.off()
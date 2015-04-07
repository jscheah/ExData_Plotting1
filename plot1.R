library(dplyr)

#Assume data is copied to data/household_power_consumption.txt
data <- read.table("data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data_df<-tbl_df(data)

filteredData<-filter(data_df, Date <= as.Date("2007-02-02"),  Date >= as.Date("2007-02-01"))

library(datasets)

png(filename = "plot1.png")
plot1Hist<-hist(filteredData$Global_active_power, )
plot(plot1Hist, col="red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.off()
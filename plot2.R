download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
"electric_power_consumption.zip")
unzip("electric_power_consumption.zip")
household_power_consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                                          stringsAsFactors = FALSE)
subset_data <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]
png("plot2.png", width=480, height=480)
library(datasets)
plot2 <- function() {
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
with(subset_data, plot(datetime, as.numeric(Global_active_power), main="", xlab="", ylab="", type="l" ))
title(ylab = "Global Active Power (kilowatts)")
}
plot2()
#title(ylab = "Frequency")
dev.off()
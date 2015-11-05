download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
"electric_power_consumption.zip")
unzip("electric_power_consumption.zip")
household_power_consumption <- read.table("household_power_consumption.txt",
                                          header=TRUE, sep=";",
                                          stringsAsFactors = FALSE)
subset_data <- household_power_consumption[household_power_consumption$Date %in%
                                             c("1/2/2007", "2/2/2007"),]

png("plot4.png", width=480, height=480)
library(datasets)
par(mfrow=c(2,2))
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S") 
with(subset_data, plot(datetime, as.numeric(Global_active_power), main="",
                       xlab="", ylab="", type="l" ))
title(ylab = "Global Active Power")

with(subset_data, plot(datetime, as.numeric(Voltage), main="", xlab="", ylab="",
                       type="l" ))
title(ylab = "Voltage")
title(xlab = "datetime")

with(subset_data, plot(datetime, as.numeric(Sub_metering_1), main="", xlab="",
                       ylab="", type="l" ))
lines(datetime, subset_data$Sub_metering_2, col="red")
lines(datetime, subset_data$Sub_metering_3, col="blue")
title(ylab = "Energy sub metering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=1, col=c("black", "red", "blue"), bty="n")


with(subset_data, plot(datetime, as.numeric(Global_reactive_power), main="",
                       xlab="", ylab="", type="l" ))
title(ylab = "global_reactive_poser")
title(xlab = "datetime")
#title(ylab = "Frequency")
dev.off()
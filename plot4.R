## Loading the useful library
library(data.table)

## Reading the data, extracting the rows for the 1/02/2007 and 2/02/2007
hpc <- fread("household_power_consumption.txt",sep=";",na.strings="?")
hpc <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))

## Converting Date and Time 
hpc[,Date:=as.IDate(Date, format = "%d/%m/%Y")]
hpc[,Time:=as.ITime(Time, format = "%H:%M:%S")]

## Adding a column with the Date and Time format
hpc[, DateTime:=as.POSIXct(Time, tz = "GMT", date = Date)]

## Ploting
png("plot4.png", bg = "transparent")
par(mfcol = c(2,2))

# Top Left
with(hpc, plot(DateTime, Global_reactive_power, 
					ylab = "Global_reactive_power",
					main = "",
					xlab = "datetime",
					type = "l"))

# Bottom left
with(hpc, plot(DateTime, Sub_metering_1, 
					ylab = "Energy sub metering",
					main = "",
					xlab = "",
					type = "l",
					col = "black")
	)
par(new=TRUE)
with(hpc, points(DateTime, Sub_metering_2, 
					type = "l",
					col = "red")
	)
par(new=TRUE)
with(hpc, points(DateTime, Sub_metering_3, 
					type = "l",
					col = "blue")
	)
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Top right 
with(hpc, plot(DateTime, Voltage, 
					ylab = "Voltage",
					main = "",
					xlab = "datetime",
					type = "l"))

# Bottom Right
with(hpc, plot(DateTime, Voltage, 
					ylab = "Voltage",
					main = "",
					xlab = "datetime",
					type = "l"))

dev.off()




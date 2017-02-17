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
png("plot2.png", bg = "transparent")
with(hpc, plot(DateTime, Global_active_power, 
					ylab = "Global Active Power (killowats)",
					main = "",
					xlab = "",
					type = "l"))
dev.off()
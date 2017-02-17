## Loading the useful library
library(data.table)

## Reading the data, extracting the rows for the 1/02/2007 and 2/02/2007
hpc <- fread("household_power_consumption.txt",sep=";",na.strings="?")
hpc <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))

## Ploting the histogram
png("plot1.png", bg = "transparent")
with(hpc,hist(Global_active_power,
					breaks=12, 
					col="red",
					main="Global Active Power",
					xlab="Global Active Power (killowatts)"))
dev.off()
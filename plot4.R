## EXPLORATORY DATA ANALYSIS - Coursera course - Project Week 1 ##

#create the third Plot ------------------------------------------
#..working with data.table is easier for me..
if (!require("data.table")) install.packages("data.table")
library(data.table)

#load data
electicPC <- as.data.table(read.table(file = "household_power_consumption.txt",
												  header = TRUE, sep = ";", quote = "", dec = "."))

#Date in Date-format in new Variable "Date.as.Date
electicPC[, Date.as.Date := as.Date(Date, format = "%d/%m/%Y")]

#Subset the dates 2007-02-01 and 2007-02-02
electicPC_01 <- electicPC[Date.as.Date == "2007-02-01"]
electicPC_02 <- electicPC[Date.as.Date == "2007-02-02"]
sub_electicPC <- rbind(electicPC_01, electicPC_02)

#Date and Time as POSIXct
sub_electicPC[, DateTime := as.POSIXct(paste0(Date.as.Date, " ", Time))]

#plotting (plot4)
plot.new()
par(mfrow = c(2,2))
#lefttop:
plot(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Global_active_power)), 
	  ylab = "Global Active Power",
	  xlab = "",
	  type = "n")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Global_active_power)))

#righttop:
plot(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Voltage)), 
	  ylab = "Voltage",
	  xlab = "datetime",
	  type = "n")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Voltage)))

#bottomleft:
plot(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Sub_metering_1)), 
	  ylab = "Energy sub metering",
	  xlab = "",
	  type = "n")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Sub_metering_1)), col = "black")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Sub_metering_2)), col = "red")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Sub_metering_3)), col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
		 legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
		 bty = "n")

#bottomright:
plot(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Global_reactive_power)), 
	  ylab = "Global_reactive_power",
	  xlab = "datetime",
	  type = "n")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Global_reactive_power)))



#save as png
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))
plot(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Global_active_power)), 
	  ylab = "Global Active Power",
	  xlab = "",
	  type = "n")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Global_active_power)))
plot(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Voltage)), 
	  ylab = "Voltage",
	  xlab = "datetime",
	  type = "n")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Voltage)))
plot(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Sub_metering_1)), 
	  ylab = "Energy sub metering",
	  xlab = "",
	  type = "n")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Sub_metering_1)), col = "black")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Sub_metering_2)), col = "red")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Sub_metering_3)), col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
		 legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
		 bty = "n")
plot(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Global_reactive_power)), 
	  ylab = "Global_reactive_power",
	  xlab = "datetime",
	  type = "n")
lines(sub_electicPC$DateTime, as.numeric(as.character(sub_electicPC$Global_reactive_power)))

dev.off()

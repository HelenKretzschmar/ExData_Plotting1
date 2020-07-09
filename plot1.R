## EXPLORATORY DATA ANALYSIS - Coursera course - Project Week 1 ##

#create the first Plot ------------------------------------------
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




#plotting (plot1)
hist(as.numeric(as.character(sub_electicPC$Global_active_power)), col = "red",
	  xlab = "Global Active Power (kilowatts)", 
	  main = "Global Active Power")


#save as png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(as.character(sub_electicPC$Global_active_power)), col = "red",
	  xlab = "Global Active Power (kilowatts)", 
	  main = "Global Active Power")
dev.off()



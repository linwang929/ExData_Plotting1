## read the data from the dates from 2007-02-01 to 2007-02-02
## the numbers of rows to skip and to read were from running the script Exploratory.R
## Note that in this dataset the separator is semicolon ";"
## Note that in this dataset missing values are coded as question mark "?"
## as.is = TRUE can prevent read.table() from the conversion of character variables (Date and Time) to factors
power2dFeb2007 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE, na.strings = "?",
                             skip = 66636, nrows = 2880)
## Give the right column names to the table
names(power2dFeb2007) <- read.table("household_power_consumption.txt", sep = ";", as.is = TRUE, nrows = 1)
## Merge the date and time into one variable, and convert it into POSIXlt class for subsequent manipulation
DateTime <- paste(power2dFeb2007$Date, power2dFeb2007$Time)
DateTime <- as.POSIXlt(DateTime, format = "%d/%m/%Y %H:%M:%S") 
## Add a column with the DateTime to the data frame
power2dFeb2007$DateTime <- DateTime
## Open png graphic device in the destination directory with specified resolution
png("./ExData_Plotting1/Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))  ## create a panel of two by two 
## Figure 1 (topleft) is the same with Plot 2
plot(power2dFeb2007$DateTime, power2dFeb2007$Global_active_power, xlab = NA, ylab = "Global Active Power", type = "n")
lines(power2dFeb2007$DateTime, power2dFeb2007$Global_active_power)
## Figure 2 (topright) is a line plot of Voltage against time
plot(power2dFeb2007$DateTime, power2dFeb2007$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(power2dFeb2007$DateTime, power2dFeb2007$Voltage)
## Figure 3 (bottomleft) is the same with Plot 3
plot(power2dFeb2007$DateTime, power2dFeb2007$Sub_metering_1, xlab = NA, ylab = "Energy sub metering", type = "n")
lines(power2dFeb2007$DateTime, power2dFeb2007$Sub_metering_1)
lines(power2dFeb2007$DateTime, power2dFeb2007$Sub_metering_2, col = "red")
lines(power2dFeb2007$DateTime, power2dFeb2007$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), 
       bty = "n", lty = "solid")
## Figure 4 (bottomright) is a line plot of Global Reactive Power against time
plot(power2dFeb2007$DateTime, power2dFeb2007$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(power2dFeb2007$DateTime, power2dFeb2007$Global_reactive_power)
dev.off()
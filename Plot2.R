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
png("./ExData_Plotting1/Plot2.png", width = 480, height = 480)
## Make the line plot by initializing an empty scatter plot first and adding a line
plot(power2dFeb2007$DateTime, power2dFeb2007$Global_active_power, xlab = NA, ylab = "Global Active Power (kilowatts)", type = "n")
lines(power2dFeb2007$DateTime, power2dFeb2007$Global_active_power, lwd = 1.5)
dev.off()
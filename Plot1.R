## read the data from the dates from 2007-02-01 to 2007-02-02
## the numbers of rows to skip and to read were from running the script Exploratory.R
## Note that in this dataset the separator is semicolon ";"
## Note that in this dataset missing values are coded as question mark "?"
## as.is = TRUE can prevent read.table() from the conversion of character variables (Date and Time) to factors
power2dFeb2007 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE, na.strings = "?",
                                skip = 66636, nrows = 2880)
## Give the right column names to the table
names(power2dFeb2007) <- read.table("household_power_consumption.txt", sep = ";", as.is = TRUE, nrows = 1)
## Open png graphic device in the destination directory with specified resolution, and plot the histogram
png("./ExData_Plotting1/Plot1.png", width = 480, height = 480)
hist(power2dFeb2007$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
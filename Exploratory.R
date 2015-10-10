## Run this script before all the other scripts for plotting for exploratory purposes.
## It calculates how many rows to skip and to read when reading data from the dates 2007-02-01 to 2007-02-02

## This script first reads the complete txt file into R, and then finds out the structure of the data
## Note that in this dataset the separator is semicolon ";"
## Note that in this dataset missing values are coded as question mark "?"
## as.is = TRUE can prevent read.table() from the conversion of character variables (Date and Time) to factors
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE, na.strings = "?")
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
str(power_consumption)
## Number of rows to skip equals rows with dates earlier than 2007-02-01
rows_skip <- sum((power_consumption[power_consumption$Date < as.Date("2007-02-01"), "Date"]) < as.Date("2007-02-01"))
## Number of rows to read equals number of rows with dates earlier than or the same as 2007-02-02, minus number of rows to skip
rows_read <- sum((power_consumption[power_consumption$Date <= as.Date("2007-02-02"), "Date"]) <= as.Date("2007-02-02")) - rows_skip
cat("number of rows to skip:", rows_skip)
cat("number of rows to read:", rows_read)
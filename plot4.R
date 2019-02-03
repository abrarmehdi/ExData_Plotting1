# Reading Data File
powerData <- read.table("..//Data Set//household_power_consumption.txt", header = TRUE, sep = ";")

# Extracting Two Days Data
twoDaysData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]

# Converting Global Active Power values to numeric
twoDaysData$Global_active_power <- as.numeric(as.character(twoDaysData$Global_active_power))

# Creating TimeStamp by combining Date and Time
x <- strptime(as.character(paste(twoDaysData$Date,twoDaysData$Time, sep=" ")), "%d/%m/%Y%n%T")

# Creating PNG file
png(filename = "plot4.png", width = 480, height = 480)

# Assigning 2 by 2 Plot
par(mfrow=c(2,2))

# Creating Global Active Power Plot
with(twoDaysData, plot(x, twoDaysData$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Creating Voltage Plot
with(twoDaysData, plot(x, twoDaysData$Voltage, type="l", xlab = "", ylab = "Voltage"))

# Creating Energy Sub Metering Plot
with(twoDaysData, plot(x, twoDaysData$Sub_metering_1, type="l", xlab = "", ylab = "Energy Sub Metering"))

# Adding Sub Metering 2 Plot
lines(x, twoDaysData$Sub_metering_2, col = "Red")

# Adding Sub Metering 3 Plot
lines(x, twoDaysData$Sub_metering_3, col = "Blue")

# Adding Legends to Energy Sub Metering Plot
legend("topright", 30, legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),col=c("Black", "Red", "Blue"), lty = 1, cex=0.8)

# Creaing Global Reactive Power Plot
with(twoDaysData, plot(x, twoDaysData$Global_reactive_power, type="l", xlab = "", ylab = "Global Reactive Power"))

# Closing Device 
dev.off()

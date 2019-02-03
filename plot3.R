# Reading Data File
powerData <- read.table("..//Data Set//household_power_consumption.txt", header = TRUE, sep = ";")

# Extracting Two Days Data
twoDaysData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]

# Creating PNG file
png(filename = "plot3.png", width = 480, height = 480)

# Creating TimeStamp by combining Date and Time
x <- strptime(as.character(paste(twoDaysData$Date,twoDaysData$Time, sep=" ")), "%d/%m/%Y%n%T")

# Creating Plot
with(twoDaysData, plot(x, twoDaysData$Sub_metering_1, type="l", xlab = "", ylab = "Energy Sub Metering"))

# Adding Second Plot
lines(x, twoDaysData$Sub_metering_2, col = "Red")

# Adding Thrid Plot
lines(x, twoDaysData$Sub_metering_3, col = "Blue")

# Adding Legends
legend("topright", 30, legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),col=c("Black", "Red", "Blue"), lty = 1, cex=0.8)

# Closing Device
dev.off()

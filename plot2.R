# Reading Data File
powerData <- read.table("..//Data Set//household_power_consumption.txt", header = TRUE, sep = ";")

# Extracting Two Days Data
twoDaysData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]

# Converting Global Active Power values to numeric
twoDaysData$Global_active_power <- as.numeric(as.character(twoDaysData$Global_active_power))

# Creating PNG file
png(filename = "plot2.png", width = 480, height = 480)

# Creating Time by combining Date and Time
x <- strptime(as.character(paste(twoDaysData$Date,twoDaysData$Time, sep=" ")), "%d/%m/%Y%n%T")

# Creating Plot
with(twoDaysData, plot(x, twoDaysData$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Closing Device
dev.off()

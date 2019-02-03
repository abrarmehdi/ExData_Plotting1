# Reading Data File
powerData <- read.table("..//Data Set//household_power_consumption.txt", header = TRUE, sep = ";")

# Extracting Two Days Data
twoDaysData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]

# Converting Global Active Power values to numeric
twoDaysData$Global_active_power <- as.numeric(as.character(twoDaysData$Global_active_power))

# Creating PNG file
png(filename = "plot1.png", width = 480, height = 480)

# Creating Histogram
with(twoDaysData, hist(twoDaysData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="Red", main = "Global Active Power",xlim = c(0,8), ylim = c(0,1200)))

# Closing Device
dev.off()

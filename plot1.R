powerData <- read.table("..//Data Set//household_power_consumption.txt", header = TRUE, sep = ";")
twoDaysData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]
twoDaysData$Global_active_power <- as.numeric(as.character(twoDaysData$Global_active_power))
png(filename = "plot1.png", width = 480, height = 480)
with(twoDaysData, hist(twoDaysData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="Red", main = "Global Active Power",xlim = c(0,8), ylim = c(0,1200)))
dev.off()
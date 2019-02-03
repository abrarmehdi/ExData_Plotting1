powerData <- read.table("..//Data Set//household_power_consumption.txt", header = TRUE, sep = ";")
twoDaysData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]
twoDaysData$Global_active_power <- as.numeric(as.character(twoDaysData$Global_active_power))
png(filename = "plot2.png", width = 480, height = 480)
with(twoDaysData, plot(strptime(as.character(paste(twoDaysData$Date,twoDaysData$Time, sep=" ")), "%d/%m/%Y%n%T"), twoDaysData$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
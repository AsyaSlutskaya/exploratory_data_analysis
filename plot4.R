#getting the dataset

df <- read.table("/Users/Asya/Downloads/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
df_part <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df_time <-strptime(paste(df_part$Date, df_part$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
df_part <- cbind(df_time, df_part)

#writing in the file

png("plot4.png", width = 480, height = 480, units='px')

#creating plot4

colorlines <- c("black","red","blue")
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colorlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(df_part$df_time, df_part$Global_active_power, type = "l", col = "green", xlab = "", ylab = "Global Active Power")
plot(df_part$df_time, df_part$Voltage, type = "l", col = "orange", xlab = "datetime", ylab = "Voltage")
plot(df_part$df_time, df_part$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(df_part$df_time, df_part$Sub_metering_2, type = "l", col = "red")
lines(df_part$df_time, df_part$Sub_metering_3, type = "l", col = "blue")
legend("topright", bty = "n", legend = labels, lty = 1, col = colorlines)
plot(df_part$df_time, df_part$Global_reactive_power, type = "l", col = "blue", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()
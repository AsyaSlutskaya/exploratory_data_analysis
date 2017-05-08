#getting the dataset

df <- read.table("/Users/Asya/Downloads/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
df_part <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df_time <-strptime(paste(df_part$Date, df_part$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
df_part <- cbind(df_time, df_part)

#writing in the file

png("plot3.png", width = 480, height = 480, units='px')

#creating plot3

colorlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(df_part$df_time, df_part$Sub_metering_1, type = "l", col = colorlines[1], xlab = "", ylab = "Energy sub metering")

lines(df_part$df_time, df_part$Sub_metering_2, col = colorlines[2])
lines(df_part$df_time, df_part$Sub_metering_3, col = colorlines[3])

legend("topright", legend = labels, col = colorlines, lty = "solid")

dev.off()
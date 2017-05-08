#getting the dataset

df <- read.table("/Users/Asya/Downloads/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
df_part <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df_time <-strptime(paste(df_part$Date, df_part$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
df_part <- cbind(df_time, df_part)

#writing in the file

png("plot2.png", width = 480, height = 480, units = 'px')

#creating plot2

plot2 <- plot(df_part$df_time, df_part$Global_active_power, type="l", col="black", 
              xlab = "", ylab="Global Active Power (kilowatts)")

dev.off()


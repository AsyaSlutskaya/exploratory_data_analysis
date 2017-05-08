#getting the dataset

df <- read.table("/Users/Asya/Downloads/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
df_part <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df_time <-strptime(paste(df_part$Date, df_part$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
df_part <- cbind(df_time, df_part)

#writing in the file

png("plot1.png", width = 480, height = 480, units = 'px')

#creating plot1

plot1 <- hist(df_part$Global_active_power, col = "red", main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)")

dev.off()
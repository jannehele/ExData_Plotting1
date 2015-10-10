#
# Read data, assumption is that data file is stored to working directory
dat <- data.frame()
dat <- read.table("./household_power_consumption.txt",header=TRUE, sep= ";", na.strings ="?")
#convert the date field format
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
#
# take only two days from dataset
dat1 <-subset(dat,(dat$Date == as.Date("2007/02/01")))
dat2 <-subset(dat,(dat$Date == as.Date("2007/02/02")))
# combine those two days as single new data frame
data <- rbind(dat1,dat2)
#create timestamp field in POSIX format
data$Time2 <- paste(data$Date, data$Time)
data$Time3 <- strptime(data$Time2,"%Y-%m-%d %H:%M:%S")
#
#launch graphics device and print the graph to .png file
#NoTE Finland locals are used, that is reason weekdays look strange in the picture (to = Thu, etc.)
#
png(file= "plot4.png")
par(mfrow= c(2,2))
plot(data$Time3, data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(data$Time3, data$Voltage,type="l", ylab="Voltage", xlab="datetime")
#
plot(data$Time3, data$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
lines(data$Time3, data$Sub_metering_2,type="l", col="red")
lines(data$Time3, data$Sub_metering_3,type="l", col="blue")
# Add legends
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Time3, data$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime")
# 
dev.off()
#Plot4 complets here

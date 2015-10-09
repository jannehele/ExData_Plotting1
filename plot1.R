#
# Read data
dat <- data.frame()
dat <- read.table("./Ex_data_plotting1/household_power_consumption.txt",header=TRUE, sep= ";", na.strings ="?")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat$Time <- strptime(dat$Time,"%H:%M:%S")
# take only two days from dataset
dat1 <-subset(dat,(dat$Date == as.Date("2007/02/01")))
dat2 <-subset(dat,(dat$Date == as.Date("2007/02/02")))
# combine those two days as single data frame
data <- rbind(dat1,dat2)
#launch graphics device and print the graph to .png file
png(file= "plot1.png")
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main= "Global Active Power")
dev.off()
#Plot1 complets here

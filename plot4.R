# Loading the full dataset
dataOriginal  <- read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)
names(dataOriginal)

# Subsetting the dataset
projectData <- subset(dataOriginal,Date=="1/2/2007" | Date=="2/2/2007")
head(projectData)

# Converting the Date and Time variables
projectData$Date <- as.Date(projectData$Date, format="%d/%m/%Y") #change the format of the variable "Date"
Datetime <- paste(projectData$Date,projectData$Time)
projectData$DateTime <- as.POSIXct(Datetime)


# Constructing the plot 4
par(mfcol=c(2,2))

projectData$Global_active_power <- as.numeric(projectData$Global_active_power)
plot(projectData$Global_active_power~projectData$DateTime,xlab="", ylab = "Global Active Power",type="l")

with(projectData,plot(Sub_metering_1~DateTime,type="l",xlab="",ylab = "Energy sub metering "))
lines(projectData$Sub_metering_2~projectData$DateTime,col="red")
lines(projectData$Sub_metering_3~projectData$DateTime,col="blue")
legend("topright",lty = 1,lwd = 2,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(projectData$Voltage~projectData$DateTime,xlab="datetime", ylab = "Voltage",type="l")

plot(projectData$Global_reactive_power~projectData$DateTime,xlab="datetime", ylab = "Global_reactive_power",type="l")


# Saving plot 4
dev.copy(png, file="plot4.png",width=480,height=480)
dev.off()

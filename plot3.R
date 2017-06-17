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

# Constructing the plot 3
with(projectData,plot(Sub_metering_1~DateTime,type="l",xlab="",ylab = "Energy sub metering "))
lines(projectData$Sub_metering_2~projectData$DateTime,col="red")
lines(projectData$Sub_metering_3~projectData$DateTime,col="blue")
legend("topright",lty = 1,lwd = 2,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Saving plot 3
dev.copy(png, file="plot3.png",width=480,height=480)
dev.off()

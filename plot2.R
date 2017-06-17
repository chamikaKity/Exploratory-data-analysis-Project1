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

# Constructing the plot 2
projectData$Global_active_power <- as.numeric(projectData$Global_active_power)
plot(projectData$Global_active_power~projectData$DateTime,xlab="", ylab = "Global Active Power (kilowatts)",type="l")

# Saving plot 2
dev.copy(png, file="plot2.png",width=480,height=480)
dev.off()

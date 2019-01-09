library(dplyr)

###################################
## Getting and cleaning the data
###################################

## Getting the data from the txt file
all_data <- read.table("../household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   stringsAsFactors=FALSE, 
                   dec="."
)

## Selecting the lines between the 2 dates 1/2/2007 and 2/2/2007
subSetData <- all_data[all_data$Date %in% c("1/2/2007","2/2/2007") ,]

## Selecting and transforming to numeric the variable to be plotted
data_x <- strptime(paste(subSetData$Date,subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
data_y1 <- as.numeric(subSetData$Sub_metering_1)
data_y2 <- as.numeric(subSetData$Sub_metering_2)
data_y3 <- as.numeric(subSetData$Sub_metering_3)


##########################
## Creating the Plot
##########################

## init the image file
png("plot3.png", width=480, height=480)
## create the first variable
plot(
  data_x,
  data_y1,
  ylab = "Energy sub metering",
  xlab = "",
  type = "l"
)
## create the second variable
lines(data_x, data_y2, col = "red") 
## create the third variable
lines(data_x, data_y3, col = "blue")
## Adding a legend
legend("topright", 
       col = c("black", "blue", "red"), 
       lty=c(1,1,1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
## Saving the image file
dev.off()

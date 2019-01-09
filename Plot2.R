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
data_y <- as.numeric(subSetData$Global_active_power)


##########################
## Creating the Plot
##########################

png("plot2.png", width=480, height=480)
plot(
  data_x,
  data_y,
  ylab = "Global Active Power (kilowatts)",
  xlab = "",
  type = "l"
)
dev.off()

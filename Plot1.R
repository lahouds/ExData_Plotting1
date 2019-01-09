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

## Selecting and transforming to numeric the variable to be plotter
data <- as.numeric(subSetData$Global_active_power)



##########################
## Creating the Plot
##########################

png("plot1.png", width=480, height=480)
hist(
  data, 
  col = "red", 
  main= "Global Active Power",
  xlab = "Global Active Power (kilowatts)", 
  ylab = "Frequency",
  breaks = 15
)
dev.off()

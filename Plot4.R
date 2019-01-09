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
## Same data for the x axis for all 4 plots
plot_x <- strptime(paste(subSetData$Date,subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
## Plot 1 Y axis data 
plot1_y <- as.numeric(subSetData$Global_active_power)
## Plot 2 Y axis data 
plot2_y <- as.numeric(subSetData$Voltage)
## Plot 3 Y axis data 
plot3_y1 <- as.numeric(subSetData$Sub_metering_1)
plot3_y2 <- as.numeric(subSetData$Sub_metering_2)
plot3_y3 <- as.numeric(subSetData$Sub_metering_3)
## Plot 4 Y axis data 
plot4_y <- as.numeric(subSetData$Global_reactive_power)



##########################
## Creating the Plots
##########################

png("plot4.png", width=480, height=480)
## Create 2x2 plotting devices 
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
## First plot
plot(
  data_x,
  plot1_y,
  ylab = "Global Active Power (kilowatts)",
  xlab = "",
  type = "l"
)
## Second plot
plot(
  data_x,
  plot2_y,
  ylab = "Voltage",
  xlab = "datetime",
  type = "l"
)
## Third plot
plot(
  data_x,
  plot3_y1,
  ylab = "Energy sub metering",
  xlab = "",
  type = "l"
)
    ## create the second variable
    lines(data_x, plot3_y2, col = "red") 
    ## create the third variable
    lines(data_x, plot3_y3, col = "blue")
    ## Adding a legend
    legend("topright", 
           col = c("black", "blue", "red"), 
           lty=c(1,1,1), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty = "n"
    )
## Fourth plot
plot(
  data_x,
  plot4_y,
  ylab = "Global_reactive_power",
  xlab = "datetime",
  type = "l"
)
dev.off()

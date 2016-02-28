#Create four plots for Assignment data for Plot#4
plot4 <- function() {
  rowcount=100000
  #Read data
  data <- read.csv("household_power_consumption.txt", sep=";", 
                   header=TRUE, na.strings="?", stringsAsFactors=FALSE) 
  #data <- read.csv("household_power_consumption.txt", sep=";", 
                  # header=TRUE, na.strings="?", nrows=rowcount, stringsAsFactors=FALSE) 
  
  #Create a new data frame with limited data to just 3 weekdays
  newDate = (paste(data$Date,data$Time))
  data$fulldate <- as.POSIXct(strptime(newDate, "%d/%m/%Y %H:%M:%S"))
  data$weekday = as.factor(weekdays(as.Date(data$Date)))
  limitData <- filter(data, Date=="21/12/2006" | Date=="22/12/2006")
  
  #Set the png file name
  png(file = "plot4.png")
  
  #Plot the appropriate line graphs
  par(mfrow = c(2,2), mar=c(5,4,2,1))
  
  with(limitData, plot(
    fulldate, Global_active_power, type = "l", pch = 12, xlab="", ylab="Global Active Power"
  ))
  
  with(limitData, plot(
    fulldate, Voltage, type = "l", pch = 12, xlab="", ylab="Voltage"
  ))

  plot(limitData$fulldate,limitData$Sub_metering_1,type="l",col="red", xlab="", ylab="Energy Sub Metering")
  lines(limitData$fulldate,limitData$Sub_metering_2,col="green")
  lines(limitData$fulldate,limitData$Sub_metering_3,col="blue")
  legend("topright", legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), col=c("red", "green", "blue"), pch=1, cex = 0.75) # optional legend  
  
  with(limitData, plot(
    fulldate, Global_reactive_power, type = "l", pch = 12, xlab="", ylab="Global_reactive_power"
  ))
  
  dev.off()
  
  return(limitData)
  
}
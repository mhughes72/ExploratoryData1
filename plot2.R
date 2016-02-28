#Create histogram for Plot#1
plot2 <- function() {
  rowcount=100000
  #Read data
  data <- read.csv("household_power_consumption.txt", sep=";", 
                   header=TRUE, na.strings="?", stringsAsFactors=FALSE) 

  #Create a new data frame with limited data to just 3 weekdays
  newDate = (paste(data$Date,data$Time))
  data$fulldate <- as.POSIXct(strptime(newDate, "%d/%m/%Y %H:%M:%S"))
  data$weekday = as.factor(weekdays(as.Date(data$Date)))
  limitData <- filter(data, Date=="21/12/2006" | Date=="22/12/2006")

  #Set the png file name
  png(file = "plot2.png")
  
  #Plot the appropriate line graphs
    with(limitData, plot(
      fulldate, Global_active_power, main = "Plot 2", type = "l", pch = 12, xlab="", ylab="Global Active Power (kilowatts)"
    ))

    dev.off()
  return(limitData)
  
}
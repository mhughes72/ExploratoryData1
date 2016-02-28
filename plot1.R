#Create histogram for Plot#1
plot1 <- function() {
  rowcount=2000
  #Read data
  data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

  #Set the png file name
  png(file = "plot1.png")
  
  #Create and define Histogram
  myhist = hist(
    data$Global_active_power, 
    col="red", 
    border="black", 
    ylab="Frequency", 
    xlab="Global Active Power (kilowats)", 
    oma=c(5,5,5,5), 
    main="Global Active Power"
    )
  
  
  dev.off()
  #Return Histogram
  return(data)
  
}
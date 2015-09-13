plot3 <- function() {
    # Read data from file
    consumption.data <- get.data("~/coursera/exploratory_analysis/project1/ExData_Plotting1/")
    
    # Merge date and time fields to create DateTime
    consumption.data <- get.dateTime(consumption.data)
    
    # Set up png() and draw plot
    png(file="plot3.png",width=480,height=480)
    with(consumption.data, plot(DateTime,Sub_metering_1,type="n",yaxp=c(0,30,3),
                                xlab="",ylab="Energy sub metering"))
    with(consumption.data, lines(DateTime,Sub_metering_1))
    with(consumption.data, lines(DateTime,Sub_metering_2,col="red"))
    with(consumption.data, lines(DateTime,Sub_metering_3,col="blue"))
    legend("topright",lty=1, col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8)
    dev.off()
}



get.data <- function(dir) {
    setwd(dir)
    d <- read.table("household_power_consumption.txt", sep=";", header=TRUE,na.strings="?")
    return(subset(d, Date %in% c("1/2/2007","2/2/2007")))
}

get.dateTime <- function(cdata) {
    cdata$DateTime <- with(cdata, paste(Date,Time))
    cdata$DateTime <- strptime(cdata$DateTime, format="%d/%m/%Y %H:%M:%S")
    return(cdata)
}
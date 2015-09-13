plot4 <- function() {
    # Read data from file
    consumption.data <- get.data("~/coursera/exploratory_analysis/project1/ExData_Plotting1/")
    
    # Add DateTime field by merging Date and Time
    consumption.data <- get.dateTime(consumption.data)
    
    # Set up png device and plot dimensions
    png(file="plot4.png",width=480,height=480)
    par(mfrow=c(2,2))
    
    # Draw each plot in order
    draw_subplot1(consumption.data)
    draw_subplot2(consumption.data)
    draw_subplot3(consumption.data)
    draw_subplot4(consumption.data)
    
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

draw_subplot1 <- function(sdata) {
    with(sdata, plot(DateTime,Global_active_power,type="n",
                                xlab="",ylab="Global Active Power"))
    with(sdata,lines(DateTime,Global_active_power, col="black"))
    par(fg="black")
}



draw_subplot2 <- function(sdata) {
    with(sdata, plot(DateTime,Voltage,type="n",xlab="datetime",ylab="Voltage"))
    with(sdata, lines(DateTime,Voltage,col="black"))
}

draw_subplot3 <- function(sdata) {
    with(sdata, plot(DateTime,Sub_metering_1,type="n",yaxp=c(0,30,3),
                     xlab="",ylab="Energy sub metering"))
    legend("topright",lty=1, col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
    with(sdata, lines(DateTime,Sub_metering_1))
    with(sdata, lines(DateTime,Sub_metering_2,col="red"))
    with(sdata, lines(DateTime,Sub_metering_3,col="blue"))
    
}

draw_subplot4 <- function(sdata) {
    with(sdata, plot(DateTime,Global_reactive_power, xlab="datetime", type="n"))
    with(sdata, lines(DateTime,Global_reactive_power, col="black"))
}
plot2 <- function() {
    # Load data from file
    consumption.data <- get.data("~/coursera/exploratory_analysis/project1/ExData_Plotting1/")
    
    # Combine Date and Time fields and process them with strptime
    consumption.data <- get.dateTime(consumption.data)
    
    # Draw plot to file
    png(file="plot2.png",width=480,height=480)
    with(consumption.data, plot(DateTime,Global_active_power,type="n",
                                xlab="",ylab="Global Active Power (kilowatts)"))
    with(consumption.data,lines(DateTime,Global_active_power, col="black"))
    par(fg="black")
    dev.off()
}

get.dateTime <- function(d) {
    f  <- d$Global_active_power
    d$Global_active_power <- as.numeric(levels(f))[f]
    d$DateTime <- with(d, paste(Date,Time))
    d$DateTime <- strptime(d$DateTime, format="%d/%m/%Y %H:%M:%S")
    return(d)
}

get.data <- function(dir) {
    setwd(dir)
    d <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
    return(subset(d, Date %in% c("1/2/2007","2/2/2007")))
}
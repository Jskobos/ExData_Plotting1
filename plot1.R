plot1 <- function() {
    # Read data from file
    consumption.data <- get.data("~/coursera/exploratory_analysis/project1/ExData_Plotting1/")
    
    # Convert global power to numeric (was factor)
    f <- consumption.data$Global_active_power
    global.active.power <- as.numeric(levels(f))[f]
    
    # Set up png device and draw plot
    png(file="plot1.png",width=480,height=480)
    hist(global.active.power, main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
    dev.off()
}

get.data <- function(dir) {
    # Read data from file and subset by day
    setwd(dir)
    d <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
    
    # Return 2-day subset of data
    return(subset(d, Date %in% c("1/2/2007","2/2/2007")))
}
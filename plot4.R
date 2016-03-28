library(reshape)
library(sqldf)
library(ggplot2)
library(lattice)
library(gridBase)
library(scales)
setwd("C:/Users/JAI/Downloads/Cousera Data Science Specialization/4. Exploratory Data Analysis/week1/exdata-data-household_power_consumption/")
data  <- read.csv("household_power_consumption.txt",header = T, stringsAsFactors = FALSE,sep = ";")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
table(is.na(data1))
str(data1)

for(i in 3:8){
  data1[[i]] <- as.numeric(data1[[i]])
}
str(data1)
data1$datetime <- as.POSIXct(paste(data1$Date,data1$Time))
names(data1)
data2 <- data1[c(10,7,8,9)]
data_plot <- melt(data2,id = c("datetime"))

png("plot4.png",height = 480, width = 480)

par(mfrow = c(2,2))
hist(data1$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = "red")
plot(data1$datetime,data1$Global_active_power, type="n",ylab = "Global Active Power (kilowatts)")
lines(data1$datetime,data1$Global_active_power)
plot(data1$datetime,data1$Global_reactive_power, type="n",ylab = "Global_reactive_power")
lines(data1$datetime,data1$Global_reactive_power)
plot.new()
grid_plot <- baseViewports()
pushViewport(grid_plot$figure) 
gp1 <-plotViewport(c(1.8,1,0,1)) 
S <- ggplot(data_plot,aes(datetime,value,colour = variable))+geom_line()+ylab( "Energy sub metering")+xlab(NULL)+theme(legend.position = "top") + scale_x_date(labels = date_format("%a"))
print(S,vp=gp1)
dev.off()

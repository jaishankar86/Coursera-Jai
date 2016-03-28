library(reshape)
library(sqldf)
library(ggplot2)
library(lattice)
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

png("plot3.png",height = 480, width = 480)
ggplot(data_plot,aes(datetime,value,colour = variable))+geom_line()+ylab( "Energy sub metering")+xlab(NULL)+theme(legend.position = "top")
dev.off()


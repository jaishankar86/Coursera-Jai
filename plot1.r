library(sqldf)
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

png("plot1.png",height = 480, width = 480)
hist(data1$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = "red")
dev.off()

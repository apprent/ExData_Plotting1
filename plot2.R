## 读入数据
wholeData <- read.csv2("household_power_consumption.txt",header=TRUE,dec=".",
                       na.strings="?",colClasses=c("character","character",
                                                   rep("numeric", 7)))
## 取出要用的行
useData <- subset(wholeData,Date=="1/2/2007" | Date=="2/2/2007")
## 释放原始数据
rm(wholeData)
## 处理datetime
useData <- within(useData,datetime <- as.POSIXlt(paste(Date,Time),
                                                 format = "%d/%m/%Y %T"))
## 删除原始日期时间变量
useData <- subset(useData, select = -c(Date,Time))

## 绘图
yname <- "Global Active Power (kilowatts)"
png(filename="plot2.png")
with(useData,
     plot(datetime, Global_active_power, type = "l", xlab = "", ylab = yname)
     )
dev.off()
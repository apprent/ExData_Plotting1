## ��������
wholeData <- read.csv2("household_power_consumption.txt",header=TRUE,dec=".",
                       na.strings="?",colClasses=c("character","character",
                                                   rep("numeric", 7)))
## ȡ��Ҫ�õ���
useData <- subset(wholeData,Date=="1/2/2007" | Date=="2/2/2007")
## �ͷ�ԭʼ����
rm(wholeData)
## ����datetime
useData <- within(useData,datetime <- as.POSIXlt(paste(Date,Time),
                                                 format = "%d/%m/%Y %T"))
## ɾ��ԭʼ����ʱ�����
useData <- subset(useData, select = -c(Date,Time))

## ��ͼ
yname <- "Energy sub metering"
png(filename="plot3.png")
with(useData, {
        plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = yname)
        lines(datetime, Sub_metering_2, type = "l", col = "red")
        lines(datetime, Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = 1, col = c("black","red","blue"),
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
} )
dev.off()
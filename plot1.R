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
xname <- "Global Active Power"
png(filename="plot1.png")
hist(useData$Global_active_power, main = xname,
     xlab = paste(xname,"(kilowatts)"), col = "red")
dev.off()


#set wd to file on PC, locate file
setwd("C:/Users/Administrator/Desktop")
getwd()


#read table into R, convert to data frame, set factors to columns
DataFile<- "./household_power_consumption.txt"

consumption<-read.table(DataFile,header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Create a working subset of the required data set. 
SubSetDates <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

#Check Dimensions of subset
dim(SubSetDates)

#Get and set dataset to numerical values for fisrt plot
GlobalActivePower <- as.numeric(SubSetDates$Global_active_power)

#Set plot size
png(filename="plot1.png", width=480, height=480, units="px", bg="transparent")

#Plot chart
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",breaks = 12, ylim = c(0, 1200))
dev.off() 

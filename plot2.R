

#load all data
data<-read.table('household_power_consumption.txt',header = TRUE, sep = ";",stringsAsFactors = FALSE);

#extract data from 1.2.2007-2.2.2007
date<-data[ ,1];
first_day<-(date=='1/2/2007');
DATA<-data[first_day, ];
second_day<-(date=='2/2/2007');
DATA<-rbind(DATA,data[second_day, ]);
rm(data,date,first_day,second_day)

#remove all rows with "?"
DATA<-subset(DATA, Global_active_power != "?" & 
               Global_reactive_power != "?" & 
               Voltage != "?" & 
               Global_intensity != "?" &
               Sub_metering_1 != "?" & 
               Sub_metering_2 != "?" &
               Sub_metering_3 != "?");


png(filename="plot2.png",
    width = 480, height = 480)
plot(1:2880,DATA[ ,3],xaxt = "n",type="l",col = "black", xlab="",ylab = "Global Active Power (kilowatts)")

day<-DATA[ ,1];
day[day=='1/2/2007']<-'Thu';
day[day=='2/2/2007']<-'Fri';

axis(1, at=c(1,nrow(DATA)/2,nrow(DATA)),labels=c("Thu","Fri","Sat"))

dev.off()
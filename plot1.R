
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


png(filename="plot1.png",
    width = 480, height = 480)
hist(as.numeric(DATA[ ,3]),xlim=c(0,6),col='red',main="Global Active Power",
     ylab="Frequency" ,xlab="Global Active Power (kilowatts)" )
dev.off()

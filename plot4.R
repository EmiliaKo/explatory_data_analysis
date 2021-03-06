
data<-read.table('household_power_consumption.txt',header = TRUE, sep = ";",stringsAsFactors = FALSE);
date<-data[ ,1];

first_day<-(date=='1/2/2007');
DATA<-data[first_day, ];

second_day<-(date=='2/2/2007');
DATA<-rbind(DATA,data[second_day, ]);
rm(data)

DATA<-subset(DATA, Global_active_power != "?" & 
               Global_reactive_power != "?" & 
               Voltage != "?" & 
               Global_intensity != "?" &
               Sub_metering_1 != "?" & 
               Sub_metering_2 != "?" &
               Sub_metering_3 != "?");


png(filename="plot4.png",
    width = 480, height = 480)
# divide figure windows
par(mfrow = c(2, 2))

#global active power
plot(1:2880,as.numeric(DATA[ ,3]),xaxt = "n",type="l",col = "black", 
     xlab="",ylab = "Global Active Power")
day<-DATA[ ,1];
day[day=='1/2/2007']<-'Thu';
day[day=='2/2/2007']<-'Fri';
axis(1, at=c(1,nrow(DATA)/2,nrow(DATA)),labels=c("Thu","Fri","Sat"))


#voltage
plot(1:2880,as.numeric(DATA[ ,5]),xaxt = "n",type="l",col = "black", 
     xlab="datetime",ylab = "Voltage")
day<-DATA[ ,1];
day[day=='1/2/2007']<-'Thu';
day[day=='2/2/2007']<-'Fri';
axis(1, at=c(1,nrow(DATA)/2,nrow(DATA)),labels=c("Thu","Fri","Sat"))

#sub metering
plot(1:2880,as.numeric(DATA[ ,7]),xaxt = "n",type="l",col = "black", xlab="",ylab = "Energy sub metering")

lines(as.numeric(DATA[ ,8]), type="l", col="red")
lines(as.numeric(DATA[ ,9]), type="l", col="blue")
day<-DATA[ ,1];
day[day=='1/2/2007']<-'Thu';
day[day=='2/2/2007']<-'Fri';
axis(1, at=c(1,nrow(DATA)/2,nrow(DATA)),labels=c("Thu","Fri","Sat"))

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, col=c("black","red","blue"), 
       lty=1, lwd=2,bty="n");

#gloabal reactive energy
plot(1:2880,as.numeric(DATA[ ,4]),xaxt = "n",type="l",col = "black", 
     xlab="datetime",ylab = "Global Active Power")
day<-DATA[ ,1];
day[day=='1/2/2007']<-'Thu';
day[day=='2/2/2007']<-'Fri';
axis(1, at=c(1,nrow(DATA)/2,nrow(DATA)),labels=c("Thu","Fri","Sat"))



dev.off()
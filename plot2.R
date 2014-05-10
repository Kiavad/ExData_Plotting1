Power=read.table("C:/Data Science/ExplorData/exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

PowerConsumption <- subset(Power, as.Date(Power$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))



DateTimeFunction=function(x,y) {paste(x,y,sep=" ")}

PowerConsumption$Date_Time1=mapply(DateTimeFunction,PowerConsumption$Date,PowerConsumption$Time)
PowerConsumption$Date_Time=strptime(PowerConsumption$Date_Time1,format="%d/%m/%Y %H:%M:%S")


PowerConsumption$Global_active_power=as.numeric(PowerConsumption$Global_active_power)


png(file="plot2.png",width=480,height=480)
plot(PowerConsumption$Date_Time,PowerConsumption$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

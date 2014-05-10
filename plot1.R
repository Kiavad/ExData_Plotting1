PowerConsumption=read.table("C:/Data Science/ExplorData/exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

PowerConsumption$Date=strptime(PowerConsumption$Date, format="%d/%m/%Y")
PowerConsumption=subset(PowerConsumption,PowerConsumption$Date>as.POSIXlt("2007-01-31") & PowerConsumption$Date<as.POSIXlt("2007-02-03"))
PowerConsumption$Global_active_power=as.numeric(PowerConsumption$Global_active_power)


png(file="plot1.png",width=480,height=480)
hist(PowerConsumption$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

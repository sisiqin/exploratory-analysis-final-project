## read the data 
scc <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/Source_Classification_Code.rds")
Sum <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/summarySCC_PM25.rds")
head(scc, skip = 20)
str(scc)
head(Sum)
str(Sum)
table(Sum$year)

##Q1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
##for each of the years 1999, 2002, 2005, and 2008.
png("plot1.png", width=1040, height=480)
Pm25.1999 <- subset(Sum, year == 1999)
dim(Pm25.1999)
range(Pm25.1999$Emissions)
Pm25.2002 <- subset(Sum, year == 2002)
dim(Pm25.2002)
Pm25.2005 <- subset(Sum, year == 2005)
Pm25.2008 <- subset(Sum, year == 2008)
plot.pm25 <- plot(rep(1999, 1108469), Pm25.1999$Emissions, xlim = c(1998, 2010))
points(rep(2002, 1698677), Pm25.2002$Emissions)
points(rep(2005, 1713850), Pm25.2005$Emissions)
points(rep(2008, 1976655), Pm25.2008$Emissions)
dev.off()
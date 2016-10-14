## read the data 
scc <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/Source_Classification_Code.rds")
Sum <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/summarySCC_PM25.rds")
head(scc, skip = 20)
str(scc)
head(Sum)
str(Sum)
table(Sum$year)

##5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
png("plot5.png", width=1040, height=480)
BaltiOnRoad <- subset(Balti, type == "ON-ROAD")
SumBaltiOnRoad <- aggregate(Emissions ~ year, BaltiOnRoad, sum)
g5<- ggplot(SumBaltiOnRoad, aes(x = year, y = Emissions)) + geom_line() + ggtitle("Changes of Motor Vehicle Sources in Baltimore City from 1999 - 2008")
g5
dev.off()
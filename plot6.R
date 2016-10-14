## read the data 
scc <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/Source_Classification_Code.rds")
Sum <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/summarySCC_PM25.rds")
head(scc, skip = 20)
str(scc)
head(Sum)
str(Sum)
table(Sum$year)

## 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from 
## motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽").
## Which city has seen greater changes over time in motor vehicle emissions?
png("plot6.png", width=1040, height=480)
LAOnRoad <- subset(Sum, fips == "06037" & type == "ON-ROAD")
SumLAOnRoad <- aggregate(Emissions ~ year, LAOnRoad, sum)
SumLAOnRoad <- cbind(SumLAOnRoad, rep("LA", 4))
SumBaltiOnRoad <- cbind(SumBaltiOnRoad, rep("Blatimore", 4))
names(SumLAOnRoad)[names(SumLAOnRoad) == 'rep("LA", 4)'] <- "city"
names(SumBaltiOnRoad)[names(SumBaltiOnRoad) == 'rep("Blatimore", 4)'] <- "city"
together <- rbind(SumBaltiOnRoad, SumLAOnRoad)
g6 <- ggplot(together, aes(x = year, y = Emissions))
g6 <- g6 + facet_grid(. ~ city)
g6 <- g6 + geom_bar(stat = "density") +  ggtitle('Total Emissions from motor vehicle in Baltimore vs. Los Angeles, 1999-2008')

dev.off()
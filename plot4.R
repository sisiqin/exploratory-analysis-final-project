## read the data 
scc <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/Source_Classification_Code.rds")
Sum <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/summarySCC_PM25.rds")
head(scc, skip = 20)
str(scc)
head(Sum)
str(Sum)
table(Sum$year)

## 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
png("plot4.png", width=1040, height=480)
CoalRelated <- subset(scc, EI.Sector == "Fuel Comb - Electric Generation - Coal")
CoalRelatedSCC <- CoalRelated$SCC
CoalData <- subset(Sum, SCC %in% CoalRelatedSCC)
CoalSum <- aggregate(Emissions ~ year, CoalData, sum)
g4 <- ggplot(CoalSum, aes(x = year, y = Emissions)) + geom_line() + ggtitle("Changes of Coal Related Sources from 1999 - 2008")
g4
dev.off()
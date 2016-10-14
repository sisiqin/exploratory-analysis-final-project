## read the data 
scc <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/Source_Classification_Code.rds")
Sum <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/summarySCC_PM25.rds")
head(scc, skip = 20)
str(scc)
head(Sum)
str(Sum)
table(Sum$year)

## 3. Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.s q
png("plot3.png", width=1040, height=480)
table(Balti$type)
library(ggplot2)
Balti_Year <- aggregate(Emissions ~ year + type, Balti, sum)
g3 <- ggplot(Balti_Year, aes(x = year, y = Emissions, color = type)) + geom_line()
g3
dev.off()
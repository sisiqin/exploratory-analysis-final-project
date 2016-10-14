## read the data 
scc <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/Source_Classification_Code.rds")
Sum <- readRDS("/Users/sissiqin/Desktop/Rfiles/exdata-data-NEI_data/summarySCC_PM25.rds")
head(scc, skip = 20)
str(scc)
head(Sum)
str(Sum)
table(Sum$year)

##2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
##(𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this q
png("plot2.png", width=1040, height=480)
barplot(height = Sum$Emissions, names.arg = Sum$year)
Balti <- subset(Sum, fips == "24510")
table(Balti$year)
range(Balti$Emissions)
summary(Balti$Emissions)
quantile(Balti$Emissions, prob = c(0.3, 0.98))
with(Balti, plot(year, Emissions, ylim = c(0, 30)))
model <- lm(Emissions ~ year, Balti)
abline(model, lwd = 2)
dev.off()
setwd("~/Desktop") # sets Desktop as working directory 

# assigns url to fetch data set, creates Data folder in wd and downloads data set to Data foder

fileUrl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
if (!file.exists("./Data")) {
        dir.create ("./Data")
}
download.file (fileUrl, destfile="./Data/electric.zip", method = "curl")

unzip(zipfile="./Data/electric.zip",exdir="./Data") # unzips dataset

# creates table from dataset
table1 <- read.table("./Data/household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, sep=";", dec=".", quote="\"", na.strings="NA")
# subsets the observations we want to analyze
subSet <- table1[table1$Date %in% c("1/2/2007","2/2/2007") ,]

# removes table that we are not going to use anymore
rm(table1)

# converts data selection for plotting to a numeric vector
x <- as.numeric (subSet$Global_active_power)

# asings graphic device for copying plot, creates file and adjusts copy parameters
dev.copy (png, width=480, height=480, file="./Data/plot1.png")
# creates plot
hist(x, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red", border="black", ylim = c(0,1200))
# closes graphic device
dev.off()

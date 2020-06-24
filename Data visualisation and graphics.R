#get dataset
getwd()
setwd("C:/Users/admin/Desktop")
getwd()

#Install and load packages
install.packages("tibble")
library(tibble)
install.packages("dplyr")
library(dpylr)
install.packages("reshape2")
library(reshape2)
install.packages("tidyr")
library(tidyr)
install.packages("ggplot2")
library(ggplot2)

#Exercise 1: Making simple plots in base R

#a.)Load behaviour data
Catfish_April<- read.csv(file="Catfish_2.csv", header = TRUE)
head(Catfish_April)
str(Catfish_April)

#create a histogram
hist(Catfish_April$Weight)	

#Add colour and change numeber of bins to 50
hist(Catfish_April$Weight, col="yellow", breaks = 50)	

#b.)Add a density curve
hist(Catfish_April$Weight, col="yellow", breaks = 50, freq = FALSE)

#Add	a	blue	density	line	
lines(density(Catfish_April$Weight), col="blue", lwd=1.5)

#c.)Make	a	scatterplot
plot(Catfish_April$Length,Catfish_April$Weight,xlab = "Length	(cm)", ylab = "Weight	(g)")	

#Exercise 2: Multi-panel	figures

#Make	a	subset
par(mfrow = c(1,3))

#Create a boxplot reported on Overall 
boxplot(Catfish_April[Catfish_April$Month == "April",])$Weight~Catfish_April[Catfish_April$Month == "April",]$Temperature,data = Catfish_April,xlab = "Temperature",ylab = "Weight(g)",names = c("Low","High"),col = c("white",	"lightgrey", ylim = c(50,100), main = "Overall")

#Create a boxplot reported on Silurus.glanis 
boxplot(Catfish_April[Catfish_April$Month == "April" & Catfish_April$Species == "Silurus.glanis",])$Weight~Catfish_April[Catfish_April$Month == "April" & Catfish_April$Species=="Silurus.glanis",]$Temperature,data = Catfish_April,xlab ="Temperature",ylab = "Weight(g)",names = c("Low","High"),col = c("white","lightgrey", ylim = c(50,100), main = "Silurus.glanis")

#Create a boxplot reported on Silurus.asotus
boxplot(Catfish_April[Catfish_April$Month == "April" & Catfish_April$Species == "Silurus.asotus",])$Weight~Catfish_April[Catfish_April$Month == "April" & Catfish_April$Species=="Silurus.asotus",]$Temperature,data = Catfish_April,xlab ="Temperature",ylab = "Weight(g)",names = c("Low","High"),col = c("white","lightgrey", ylim = c(50,100), main = "Silurus.asotus")

#Exercise 3: Graphics	with	ggplot2

# Load packages ggplot2 to creating graphics
library(ggplot2)

#Create a graphics plot with using geom_point and the	point	size	is	set	to	2,
ggplot(Catfish_April,aes(Length, Weight) + geom_point(aes(colour = Species,shape = Species), size = 2)
       
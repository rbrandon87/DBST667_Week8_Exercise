#Week 8 Exercise - Clustering
#Brandon Russell - DBST667
#Install and Load necessary packages
library("cluster")
library("ggplot2")
library("tidyr")
#Verify working directory
getwd()
#Part 2b - Load dataset
vehicle <- read.csv("vehicle.csv", header = TRUE, sep = ",")
#Part 2bi - Make a copy of the dataset
myvehicle <- vehicle
str(myvehicle)
#Part 2bii - Remove "class" variable
myvehicle$Class <- NULL
str(myvehicle)
#Part 2biii - scale function
myvehicle <- scale(myvehicle)
hist(vehicle$RADIUS.RATIO)
hist(myvehicle[,4])

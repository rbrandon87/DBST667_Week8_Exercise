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
str(vehicle)
#Part 2bi - Make a copy of the dataset
myvehicle <- vehicle
str(myvehicle)
#Part 2bii - Remove "class" variable
myvehicle$Class <- NULL
str(myvehicle)
#Part 2biii - scale function
myvehicle <- scale(myvehicle)
summary(vehicle)
summary(myvehicle)
#Part 2biv - Additional preprocessing
#Verify no empty fields
apply(myvehicle, 2, function (myvehicle) sum(is.na(myvehicle)))
#Part 2ci - Run clustering
set.seed(12345)
kc<-kmeans(myvehicle, 4)
#Part 2cii - kc output
kc
#Part 2ciii - iter output
kc$iter
#Part 2di - cross-tab table
table(vehicle$Class)
table(vehicle$Class, kc$cluster)
#Part 2ei - Visualize the cluster
#clusplot(kc)
clusplot(myvehicle, kc$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
#Part 2fi - Compare different k runs
kc
kc$tot.withinss
kc$betweenss
kc$iter
kc<-kmeans(myvehicle, 3)
kc
kc$tot.withinss
kc$betweenss
kc$iter
kc<-kmeans(myvehicle, 2)
kc
kc$tot.withinss
kc$betweenss
kc$iter
kc<-kmeans(myvehicle, 1)
kc
kc$tot.withinss
kc$betweenss
kc$iter

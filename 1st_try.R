# first trys in creating a data set & plotting a graph 

# show path
getwd()
# change path 
setwd("/Users/Ronjamac/Documents/Studium_Geographie/Master_EAGLE/R")
# create a dataset 
prec_avg <-c(56,56,50,53,69,83,83,80,62,55,60,63)
# plot the data and make it fancy :)
plot(prec_avg,
     # point type
     pch=18,
     # magnify symbols and texts
     cex=1.5,
     # color
     col="steelblue4")
# smoothed line connecting the points
lines(lowess(prec_avg,f=.2))

# try different plots
boxplot(prec_avg)
scatter.smooth(prec_avg)

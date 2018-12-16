# Steigerwald 

# install packages
install.packages("RCurl")
library("RCurl")

# import data direclty from github
df<-read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")

write.table(df,file = "Steigerwald_tab.xls") # just a half-baked try, doesn't look very amazing in excel
summary(df)
head(df)
tail(df)
str(df)
dim(df)
class(df)
levels(df)
names(df)

# select one column in different ways 
df$LUCAS_LC
df[,"LUCAS_LC"]
df[,3]
# select Sentinel data
names(df) # to figure the column numbers...
df$S2.1 # one band 
df[,4:13] # all Sentinel bands
df[,length(df)]# select the last column 
df[,length(df)-1] # select the last secind column 
df[1:10,] # select all columns, but only the first ten rows 
df[,c(3,14)] #select column LUCAS_LC and STRM
df["L7.ndvi" >0.5,]

# Data frame to Spatial data frame
spdf.obj<-df
names(spdf.obj)
summary(df)
library(sp)
coordinates(spdf.obj)<-~x+y # define the the columns with coordinates
proj4string(spdf.obj) <- CRS("+init=epsg:25832")  # define the coordinate system, which need to be known by you
class(spdf.obj) # to check weather it really is a spatial data frame

install.packages("rgdal")
library(rgdal)
library(sp)
writeOGR(spdf.obj,"sample_point_with_data.shp",driver="ESRI Shapefile","data") # we are in Kazakhstan??
writeOGR(spdf.obj[,c("LCname","L8.ndvi")],"sample_point_with_ndvi.shp",driver="ESRI Shapefile","data")

# too complicated
spdf.obj[,4:13]
spdf_sen.obj <- spdf.obj[,4:13]
writeOGR(spdf_sen.obj,"sample_point_with_data_sentinel.shp",driver="ESRI Shapefile","data")


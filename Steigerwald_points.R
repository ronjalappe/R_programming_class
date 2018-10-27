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
df$S2.1 # one band 
df[,4:13] # all Sentinel bands
df[,length(df)]# select the last column 
df[,length(df)-1] # select the last secind column 
df[1:10,] # select all column, btu only the first ten rows 
df[,c(3,14)] #select solumn LUCAS_LC and STRM 
df[,df$LUCAS_LC,df$SRTM] # !!! how does it work this way?? not like this? 





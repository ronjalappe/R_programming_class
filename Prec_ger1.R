# Precipitation Germany

# install packages first
install.packages("raster")
# load them
library(raster)
# get data of german boundaries
germany<-getData("GADM",country="DEU",level=2)
# plot german boundaries
plot(germany)
# get precipitation data 
prec<-getData("worldclim",var="prec",res=10,lon=10,lat=51)
plot(prec)
# crop (stutzen, zuschneiden) precipitation data to the extent of germany 
prec_ger1<-crop(prec,germany)
plot(prec_ger1)
# mask (verbergen) precipitation to shape of germany
prec_ger2<-mask(prec_ger1,germany)
plot(prec_ger2)
# spplot-command (what does it do??)
spplot(prec_ger2)


# extract precipitation average of germany
prec_avg<-cellStats(prec_ger2,stat="mean")
summary(prec_avg)

#---------------------------------------------------------------------------
# back to precipitation example! (task of 2nd lesson)
# how to just extract the value of July?
prec_ger2
prec_ger2[7] # that's not exactly the solution, but a good try ;) 
prec_avg[7] # yey. 78.7mm
# how to plot April to September?
prec_avg[4:9]
prec_avg[2]-prec_avg[1] # subscract the Jan from the Feb prec
sum(prec_avg) # sum of precipitation... etc. 




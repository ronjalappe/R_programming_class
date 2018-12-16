#### getSpatialData
#### lecture with Jacob/ 04.12.18
dev.off()
library(raster)
library(getSpatialData)
library(sf)
library(sp)

# choose an area of interest 
set_aoi() 
view_aoi()

# get Sentinel Data
login_CopHub(username = "ronja") #asks for password or define 'password'
query <- getSentinel_query(c("2018-07-01","2018-09-01"),platform="Sentinel-2")
View(query)

# filter only Level 2A and cloudcover http://localhost:11595/session/viewhtml5ba0596096ea/index.html?viewer_pane=1#
query.filter <- query[query$processinglevel=="Level-1C",]
query.filter <- query.filter[as.numeric(query.filter$cloudcoverpercentage)< 10,]

getSentinel_preview(query.filter[15,]) #15

dir.arc <- "/Users/Ronjamac/Pictures/satellites/Kyrgyzstan" # insert path to store the files 
dir.create(dir.arc)
set_archive(dir.arc)
getSentinel_data(query.filter[15,]) # or whatever scene I selected 

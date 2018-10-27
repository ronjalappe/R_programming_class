# Integration of a random table 

# check on which path you're working, and change it if neccessary
getwd()
# [1] "/Users/Ronjamac/Documents/Studium_Geographie/Master_EAGLE/R"
x<-read.table("ran_tab_elements.csv",header=F,sep=";")
summary(x)
# or:
x1<-read.csv("ran_tab_elements.csv",header = T,sep = ",")
summary(x1)

# well, I could integrate my random excel table, but still I have problems displaying it properly 

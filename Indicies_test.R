# Indexing - Matrix

# indexing means to address only a certain part of your data 
# are vector is a sequence of data elements of the same type NOT spatial data!
# some general tries
c<-c(2,4,6,8) # creation of a vector
x<-seq(1,100,by=2.5) #sequence from 1-100 at every 2.5th step
x #show values
x[5] #extract fith position
x[4:11] #extract fith and 11th position 
x[length(x)] #extract last position
x[-2] #extract all but one
x>20 #query (Abfrage) all numbers above 20
(x<=10)|(x>=30) #...
x[x<10|x>30] #actual data below 10 and above 30

#some stats
sum(x)
summary(x)
cumsum(x) #cummulative sum 
sort(x,decreasing=T) #sort
rev(x) #revert order

# generate a matrix
m1<-matrix(c(4,5,3,7,2,9),nrow=2)
m1
m2<-matrix(
  c(2,4,6,3,7,8,4,6,5,2,6,5),
  nrow = 3,
  ncol = 4,
  byrow=F)
m2  

# matrix out of a vector
# create a vector with 80 entries based on normally distributed data
numbers_1<-rnorm(80,mean = 0,sd=1)
# pupulate data with vector data in 20 rows and 4 columns 
mat_1<-matrix(numbers_1,nrow = 20,ncol = 4)
mat_1
# convert it into a datafram 
df_1<-data.frame(mat_1)
# assign column names 
names(df_1)<-c("var1","var2","var3","var4")
head(df_1)
summary(df_1)  

# Data frame 
# generate a dataframe with 2 columns
test<-data.frame(A=c(1,2,4),B=c("aB1","aB2","aB4"))
test[,1]
test[,"A"]
write.table(test,file="Indicies_test.xls") #sieht noch nicht so aus, wie ne Tabelle aussehen sollte..
#...

# More complex data frames
df_1<-data.frame(plot="location_name_1",measure1=runif(100)*1000,measure2=round(runif(100)*100), value=rnorm(100,2,1),ID=rep(LETTERS,100))
df_2<-data.frame(plot="location_name_2", measure1=runif(50)*100, measure2=round(runif(10)*10), value=rnorm(50),ID=rep(LETTERS,50))
rbind(df_1,df_2)
df<-(rbind(df_1,df_2))
summary(df) #summary stats
df  
str(df) #structure of data frame
mode(df) #storage mode of object 
head(df) #return first (or last) part of an object 
# plot only data frame only for measure 1 and 2
df[,c('plot','measure1','measure2')]
# plot measure 1 and 2 only for line 66 and 70
df[66:70,c('plot','measure1','measure2')]
x1<-df[,c('plot','measure1','measure2')]
plot(x1)
boxplot(x1)

#task-2
#prediction using unsupervised ML
#predict the optimum number of clusters and represent it visually
data<- read.csv("D:\\aastha\\sparks\\iris.csv")
summary(data)

#plot the data
x<- data$SepalLengthCm
y<- data$SepalWidthCm
library(ggplot2)
ggplot(data,aes(x=SepalLengthCm, y=SepalWidthCm, col=Species))+ geom_point()
ggplot(data,aes(x=PetalLengthCm, y=PetalWidthCm, col=Species))+ geom_point()

#finding the number of clusters
data1<- data[,2:5]
tot_wss=c()
for (i in 1:15){
  p<-kmeans(data1, centers=i)
  tot_wss[i]=p$tot.withinss
}
plot(x=1:15, y=tot_wss,type='b', xlab='Number of Clusters', ylab='Within groups')

#appling k-means cluster
data2<- data.frame(x,y)
p<-kmeans(data2, centers=3)
plot(x,y,col=p$cluster, pch=19)
points(p$centers, col=1:3, pch=4, cex=3, lwd=4)


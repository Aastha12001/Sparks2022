#task-6
#prediction using decision tree algorithm
#create the decision tree classifier and visualize it graphically
data<- read.csv("D:\\aastha\\sparks\\iris.csv")
data$Id=NULL
str(data) #view the structure

#making a model
library(rpart)
dtree<- rpart(Species ~., data=data, minsplit=2, minbucket=1,cp=-1)

#visualize the tree
install.packages('rpart.plot')
library(rpart.plot)
rpart.plot(dtree, extra = 2)

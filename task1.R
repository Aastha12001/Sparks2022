#task-1
#prediction using supervised ML
#to predict the percentage of an student based on the no.of study hours 
library(readxl)
dataset<-read_excel("D:\\aastha\\sparks\\data1.xlsx")
dataset=as.data.frame(dataset) #convert our data into data frame

#loading library
install.packages('rpart')
library(rpart)
install.packages('caTools')
library(caTools)
library(dplyr)

#creating train and test sets
split_val<- sample.split(dataset$Scores, SplitRatio = 0.8)
train_sample<- subset(dataset, split_val == T) #80% of data in training sample
test_sample<- subset(dataset, split_val==F) #20% of data in test sample

#creating the appropriate linear model
plot(dataset)
x<- dataset$Hours #independent variable
y<- dataset$Scores #dependent variable 
model<- lm(y~x, train_sample) #predict y variable using x variable
print(summary(model))
result<- predict(object=model, newdata=test_sample)
z<- data.frame(pred=result, actual=dataset$Scores)
mse<- sqrt(mean((z$actual-z$pred)^2)) #mean square error
a<- data.frame(x=9.25)
final_result<- predict(model,a)


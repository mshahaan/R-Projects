library(rpart)
library(rpart.plot)
library(DMwR)

#Loading Training Data
#Dataset citibike.train
data = read.csv(file = file.choose(), header = T, sep = ",", 
                stringsAsFactors = F)

#Cross Validation
sample = sample.int(n = nrow(data), size = floor(.50*nrow(data)), replace = F)
train = data[sample, ]
test = data[sample, ]

model1 = rpart(tripduration~birth.year, data=train, minsplit=1, minbucket=1, cp=0.001)
model1
rpart.plot(model1)

#10000A Data Load
dA = read.csv(file = file.choose(), header = T, sep = ",", 
              stringsAsFactors = F)
dAW = read.csv(file = file.choose(), header = T, sep = ",", 
               stringsAsFactors = F)

#10000A Prediction and Errors
pred1 = predict(model1, dA)
pred1
DMwR::regr.eval(pred1,dAW$tripduration)

#10000B Predictions

train2 = merge(train, dAW,all.x=T)

model2 = rpart(tripduration~birth.year, data=train2, minsplit=1, minbucket=1, cp=0.001)

#10000B Data Load
dB = read.csv(file = file.choose(), header = T, sep = ",", 
              stringsAsFactors = F)

#10000B Prediction and Errors
pred2 = predict(model2, dB)

output = data.frame(Predictions = pred2)
write.csv(output, row.names = FALSE, file="C:/Users/bshah/OneDrive/Documents/RWorkspace/PredB.csv")
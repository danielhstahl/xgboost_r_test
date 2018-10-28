require(caret)
require(Matrix)
require(dplyr)
source('./src/utils.R')
dropColumns=function(data, columnsToDrop){
  data[ , !(names(data) %in% columnsToDrop)]
}

convertFactors=function(data, columnsToConvert){
  for(column in columnsToConvert){
    data[[column]]=as.factor(data[[column]])
  }
  return(data)
}
convertTarget=function(data, target, valueTree){
  data[[target]]=if_else(data[[target]]==valueTree, 1, 0)
  return(data)
}
columnsToDrop=c("Product_Category_2", "Product_Category_3", "User_ID", "Product_ID")
columnsToConvertToFactor=c("Age", "Occupation", "City_Category", "Stay_In_Current_City_Years", "Product_Category_1")

loadData=function(){
  cleanDataSet=read.csv("./data/BlackFriday.csv") 
}

cleanData=function(data){
 data %>%
    dropColumns(columnsToDrop) %>%
    convertFactors(columnsToConvertToFactor) 
}

updateTarget=function(data, target){
  data %>% convertTarget("Gender", POSITIVE_FACTOR)
}

convertToMatrix=function(data, target, xlev=NULL){
  list(
    features=sparse.model.matrix(
      as.formula(paste0(target, "~ .")), 
      data = data, 
      xlev=xlev
    )[, -1], 
    target=data[[target]]
  )
}

getFactorLevels=function(data){
  lapply(data[, sapply(data, is.factor), drop=F], function(field){
    levels(field)
  })
}

getTrainTest=function(features, target, p=.6){
  trainIndex <- c(createDataPartition(
    target, p = p, 
    list = FALSE, 
    times = 1
  ))
  train=list(features=features[trainIndex, ], target=target[trainIndex])
  test=list(features=features[-trainIndex, ], target=target[-trainIndex])
  list(train=train, test=test)
}




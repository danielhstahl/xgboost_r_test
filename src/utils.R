require(e1071)
require(dplyr)
require(xgboost)
POSITIVE_FACTOR="F" #this is a "1"
NEGATIVE_FACTOR="M" #this is a "0"
convertNumToString=function(nums){
  if_else(nums==1, POSITIVE_FACTOR, NEGATIVE_FACTOR)
}
convertProbabilitiesToBinary=function(probabilities, threshold){
  as.numeric(probabilities>threshold)
}
confusionMatrixRaw=function(predict, actual){
  confusionMatrix(
    as.factor(convertNumToString(predict)), 
    as.factor(convertNumToString(actual)),
    positive=POSITIVE_FACTOR
  )
}

plotImportance=function(model, featureNames){
  importance <- xgb.importance(feature_names = featureNames, model = model)
  xgb.plot.importance(importance_matrix = importance)
}

generateConfusionMatrixByThreshold=function(model, features, target){
  predictions=model %>% predict(test$features)
  function(threshold){
    confusionMatrixRaw(
      predictions %>% convertProbabilitiesToBinary(threshold), 
      test$target
    )
  }
}
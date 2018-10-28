require(plumber)
require(Matrix)
source('./src/data_prep.R')
load('./data/model.rdata') #loads "model"
load('./data/levels.rdata') #loads "levels"

#* Return prediction given new data
#* @param data JSON array of new attributes
#* @post /classify
function(data){
  hasOneRow=F
  if(nrow(data)==1){
    hasOneRow=T
    data=rbind(data, data)#trick to creating a full matrix instead of a vector
  }
  newData=data %>% cleanData() %>% convertToMatrix("", xlev=levels)
  results=predict(model, newData$features)
  if(hasOneRow){
    return(results[1])
  } 
  else{
    return(results)
  }
  
}
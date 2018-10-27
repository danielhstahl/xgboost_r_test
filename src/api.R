require(plumber)
source('./src/data_prep.R')
load('./data/model.rdata')

#* Return prediction given new data
#* @param data JSON array of new attributes
#* @post /classify
function(data){
  newData=data %>% cleanData() %>% convertToMatrix("")
  print(newData)
  predict(model, newData)
}
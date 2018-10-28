
#!bin/bash

#single entry
curl -X POST --data "{\"data\":[{\"Age\":\"0-17\",\"Occupation\":\"10\",\"City_Category\":\"A\",\"Stay_In_Current_City_Years\":\"2\",\"Marital_Status\":0,\"Product_Category_1\":3,\"Purchase\":8370}]}" "http://localhost:8000/classify"

#multiple entries
curl -X POST --data "{\"data\":[{\"Age\":\"0-17\",\"Occupation\":\"10\",\"City_Category\":\"A\",\"Stay_In_Current_City_Years\":\"2\",\"Marital_Status\":0,\"Product_Category_1\":3,\"Purchase\":8370}, {\"Age\":\"26-35\",\"Occupation\":\"20\",\"City_Category\":\"A\",\"Stay_In_Current_City_Years\":\"1\",\"Marital_Status\":1,\"Product_Category_1\":8,\"Purchase\":7871}]}" "http://localhost:8000/classify"
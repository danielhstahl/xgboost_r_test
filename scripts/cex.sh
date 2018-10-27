
#!bin/bash
curl -X POST --data "{\"data\":[{\"Age\":\"0-17\",\"Occupation\":\"10\",\"City_Category\":\"A\",\"Stay_In_Current_City_Years\":\"2\",\"Marital_Status\":0,\"Product_Category_1\":3,\"Purchase\":8370}]}" "http://localhost:8000/classify"
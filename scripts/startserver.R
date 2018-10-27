require(plumber)
r <- plumb("./src/api.R")
r$run(port=8000)
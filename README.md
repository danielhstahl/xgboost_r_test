## Samples and tests for XGBoost

This repository provides code and examples for using XGBoost in R


## Installation

Run `Rscript ./scripts/packages.R` to install the packages required.  Only works on linux (and maybe MacOS)

To train the model and create the documentation, run `Rscript ./scripts/compilemarkdown.R`.  Note, you may have to add the following path to your `~/.bashrc` if you have RStudio: `export RSTUDIO_PANDOC=/usr/lib/rstudio/bin/pandoc`

## API

To start the API server, run `Rscript ./scripts/startserver.R`

To test the API server, run `./scripts/cex.sh`


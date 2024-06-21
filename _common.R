
# Setup packages ----

# -- can't do this b/c this file will be loaded at the beginning of each chapter... 

### This is the list of packages used in this book but not loaded until they are needed
list.of.packages <- c(# data wrangling
                      "palmerpenguins","dplyr", 
                      # plotting
                      "sjPlot", "ggplot2", "corrplot", 
                      # Tables
                      "kableExtra", "gtsummary", 
                      # missing data
                      "mice", "VIM", 
                      # MLM
                      "rstanarm", "lme4", 
                      # modeling and output
                      "performance"
                      )

# archive
# c("ggplot2", "Rcpp", "rstanarm", "lme4", "mice", "VIM", 
#                       "pander", "kableExtra",
#                       "corrplot", "psych", "ggfortify", "GPArotation", 
#                       "sjPlot", "gridExtra", "knitr", 
#                       "ggmap", "spdep", "housingData", "Hmisc", "waffle", 
#                       "ROCR", "caret", "ggjoy", 
#                       "ggdist", "glmmTMB", "ggpubr", 
#                       "stargazer", "missForest", "forestplot", "tidyr", "factoextra", 
#                       "performance", "broom", "dotwhisker", "survey", "marginaleffects",
#                       "gtsummary", 
#                       "sjPlot", "mice", "palmerpenguins")

# issues with MKMisk requiring 'limma' which is in bioconductor
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages>0)){install.packages(new.packages)}


# Load packages that are used frequently ----

library(ggplot2)
library(dplyr)
library(sjPlot)
library(ggpubr)
library(gtsummary)


# Set plot themes ----

theme_set(theme_bw())


# Loading Datasets ----

depress <- read.delim("data/depress_081217.txt")
names(depress) <- tolower(names(depress))

pen <- palmerpenguins::penguins

load("data/addhealth_clean.Rdata")
addhealth$smoke <- ifelse(addhealth$eversmoke_c=="Smoker", 1, 0)

fev <- read.delim("data/Lung_081217.txt", sep="\t", header=TRUE)


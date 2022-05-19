# This Rfile extracts the
# variable names and labels
# and places them within a csv
# for the SAMDHA

setwd("C:/Users/phsta/Documents/Psych_Hosp")

load("Data/tedsd_puf_2019.RData")
psych_data <- df
rm(df)

var_labels <- lapply(psych_data, attr, "label")

replace_nulls <- function(x){
  x[sapply(x, is.null)] <- NA
  return(x)
}

var_labels <- replace_nulls(var_labels)

psych_names <- t(data.frame(var_labels))

write.csv(psych_names, file = "tedsd_puf_2019_varnames.csv")

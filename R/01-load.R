library(readr)

raw_tr <- read_csv("data/cs-training.csv")
raw_tr <- raw_tr[,-1]

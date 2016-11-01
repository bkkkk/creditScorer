library(readr)

raw_tr <- read_csv("data/cs-training.csv")
raw_tr <- raw_tr[,-1]

raw_te <- read_csv("data/cs-test.csv")
raw_te <- raw_te[,-1]

library(rpart)
library(readr)
library(caret)
library(dplyr)
library(ggplot2)


clean_data <- function(data) {
  select(data, -X1)
}

training <- read_csv("~/Dropbox/projects/09-dev/credit-score/data/cs-training.csv")
training <- clean_data(training)

test <- read_csv("~/Dropbox/projects/09-dev/credit-score/data/cs-test.csv")
test <- clean_data(test)


training %>%
  mutate(SeriousDlqin2yrs = as.factor(SeriousDlqin2yrs)) %>%
  ggplot(aes(NumberOfOpenCreditLinesAndLoans, age, color = SeriousDlqin2yrs)) + geom_point()


training %>%
  mutate(SeriousDlqin2yrs = as.factor(SeriousDlqin2yrs)) %>%
  ggplot(aes(age, fill = SeriousDlqin2yrs)) + geom_histogram(position = "dodge")

model <- training %>%
  preProcess()

featurePlot(x = training[,2:10],
            y = training$SeriousDlqin2yrs)

model <- rpart(SeriousDlqin2yrs~., data = training)



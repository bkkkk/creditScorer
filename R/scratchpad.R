library(dplyr)
library(ggplot2)
library(scales)
library(tidyr)
library(rpart)
library(caret)
library(hrbrmisc)

source("R/01-load.R") # raw_tr
source("R/02-clean.R") # clean_tr
source("R/03-fixBad.R") # imputed_tr

## TODO:: Look into this!!

clean_tr %>%
  ggplot(aes(unsecuredUtil, fill = seriousDlqin)) + geom_histogram() +
  scale_fill_brewer(name = "Delinquent Past Due", type = "qual", palette = "Set1") +
  theme_hrbrmstr() + theme(legend.position = "bottom") +
  scale_x_continuous(labels = percent, limits = c(0, 1.5)) +
  labs(title = "Credit Balance over Credit Limit",
       subtitle = "Total balance on personal lines of credit over credit limit",
       caption = "source: www.kaggle.com",
       x = "Percentage of Credit Limit",
       y = "")

##

clean_tr %>%
  filter(age != 0) %>%
  group_by(age) %>%
  summarize(
    pastDue90 = mean(pastDue90),
    pastDue60 = mean(pastDue60),
    pastDue30 = mean(pastDue30)) %>%
  gather("pastDue", "n", 2:4) %>%
  ggplot(aes(age)) +
  geom_point(aes(y = n, color = pastDue)) +
  scale_color_brewer(name = "Delinquent Past Due", type = "qual", palette = "Set1") +
  theme_hrbrmstr() + theme(legend.position = "bottom") +
  labs(title = "Times Past Due",
       subtitle = "30, 60, 90+ Days",
       caption = "source: www.kaggle.com",
       x = "Times Past Due",
       y = "")


## MACHINE LEARNING
fitControl <- trainControl("repeatedcv", number = 5, repeats = 5)

clean_tr <-
  clean_tr %>%
  select(
    -monthlyIncome,
    -nDependents
  )

randomForest(formula = seriousDlqin ~ ., data = clean_tr, sampsize = 10000)

rfFit1 <- train(
  seriousDlqin ~ ., data = clean_tr,
  method = "rf",
  trControl = fitControl,

)

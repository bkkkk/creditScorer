library(dplyr)

source("R/func-NA.R")


#' Replace status code values with median measures in pastDue30
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
clean_credit_score_pastDue30 <- function(data) {
  x <- replace_with_na(data$pastDue30, c(96, 98))
  re <- median(x, na.rm = T)
  x <- replace_na_with(x, re)

  return(mutate(data, pastDue30 = x))
}


#' Replace status code values with median measures in pastDue60
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
clean_credit_score_pastDue60 <- function(data) {
  x <- replace_with_na(data$pastDue60, c(96, 98))
  re <- median(x, na.rm = T)
  x <- replace_na_with(x, re)

  return(mutate(data, pastDue60 = x))
}


#' Replace status code values with median measures in pastDue90
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
clean_credit_score_pastDue90 <- function(data) {
  x <- replace_with_na(data$pastDue90, c(96, 98))
  re <- median(x, na.rm = T)
  x <- replace_na_with(x, re)

  return(mutate(data, pastDue90 = x))
}


#' Clean column names and set response variable as factor
#'
#' @param data raw data read from CSV
#'
#' @return data frame with renamed columns and response variable as a factor
#' @export
clean_credit_score_data <- function(data) {
  data <- rename(
    data,
    seriousDlqin = SeriousDlqin2yrs,
    age = age,
    nDependents = NumberOfDependents,
    monthlyIncome = MonthlyIncome,
    debtRatio = DebtRatio,
    unsecuredUtil = RevolvingUtilizationOfUnsecuredLines,
    pastDue30 = `NumberOfTime30-59DaysPastDueNotWorse`,
    pastDue60 = `NumberOfTime60-89DaysPastDueNotWorse`,
    pastDue90 = NumberOfTimes90DaysLate,
    nCreditsAndLoans = NumberOfOpenCreditLinesAndLoans,
    nEstateLoansOrLines = NumberRealEstateLoansOrLines
  )
  data <- mutate(data, seriousDlqin = as.factor(seriousDlqin))

  return(data)
}


#' Deal with observation with age = 0
#'
#' Replaces age = 0 with median of age distribution
#'
#' @param data data frame containing tidy credit data
#'
#' @return data frame with corrected age observation
#' @export
clean_credit_score_age <- function(data) {
  data$age <- replace_with_na(data$age, 0)
  re <- median(data$age)
  data$age <- replace_na_with(data$age, re)

  return(data)
}

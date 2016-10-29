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

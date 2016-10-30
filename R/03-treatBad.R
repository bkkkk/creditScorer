source("R/func-clean.R")

imputed_tr <- clean_credit_score_age(clean_tr)
imputed_tr <- clean_credit_score_pastDue30(imputed_tr)
imputed_tr <- clean_credit_score_pastDue60(imputed_tr)
imputed_tr <- clean_credit_score_pastDue90(imputed_tr)

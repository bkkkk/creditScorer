source("R/func-clean.R")

imputed_tr <- clean_credit_score_age(clean_tr)
imputed_tr <- clean_credit_score_pastDue30(imputed_tr)
imputed_tr <- clean_credit_score_pastDue60(imputed_tr)
imputed_tr <- clean_credit_score_pastDue90(imputed_tr)
imputed_tr <- na.omit(imputed_tr)

imputed_te <- clean_credit_score_age(clean_te)
imputed_te <- clean_credit_score_pastDue30(imputed_te)
imputed_te <- clean_credit_score_pastDue60(imputed_te)
imputed_te <- clean_credit_score_pastDue90(imputed_te)
imputed_te <- na.omit(imputed_te)

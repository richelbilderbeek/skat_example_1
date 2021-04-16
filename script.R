# Do a SKAT analysis from the SKAT example
# Adapted from doc
library(SKAT)

# Use Tidyverse-proof variable names
data(SKAT.example)
d <- SKAT.example
rm(SKAT.example)

# Can use tibbles with named columns, so my mom can understand the data better
t_covariates <- tibble::as_tibble(d$X)
names(t_covariates) <- c("is_rocket", "speed")
d$X <- t_covariates

# Linear null model based on continuous traits
linear_null_model_continuous <- SKAT_Null_Model(
  data = d,
  formula = y.c ~ 1,
  out_type = "C" # continuous
)
# p-value: 0.01874576
SKAT(Z = d$Z, linear_null_model_continuous)$p.value

linear_null_model_dichotomous <- SKAT_Null_Model(
  data = d,
  formula = y.b ~ 1,
  out_type = "D" # dichotomous
)
# p-value: 0.1145585
SKAT(Z = d$Z, linear_null_model_dichotomous)$p.value


#' Returns a vector of whether a column in a dataframe contains
#' NAs or not
#'
#' @param df data frame
#'
#' @return named vector with boolean values
#' @export
nacols <- function(df) {
  unlist(lapply(df, function(x) any(is.na(x))))
}


#' Names of columns in dataframe which contain NA elements
#'
#' @param df a data frame
#'
#' @return character vector with column names which contain NAs
#' @export
nacols_name <- function(df) {
  colnames(df)[nacols(df)]
}


#' Get percentage of items in vector which are NA
#'
#' @param col vector column
#'
#' @return numeric value of the percentage of items in col which are NA
#' @export
nacol_percent <- function(col) {
  100 * sum(is.na(col)) / length(col)
}


#' Replace all NAs in x with a value
#'
#' @param x vector containing NAs
#' @param fill value with which to replace NAs
#'
#' @return original vector NAs substituted by fill value
#' @export
replace_na_with <- function(x, fill = 0) {
  x[is.na(x)] <- fill
  x
}


#' Replace certain values in vector with NA
#'
#' This can be used when dealing with encoded status values in
#' collected data.
#'
#' @param x vector
#' @param replace vector of values to be replaced with NA
#'
#' @return vector containing NAs instead of replaced values
#' @export
replace_with_na <- function(x, replace) {
  ifelse(x %in% replace, NA, x)
}

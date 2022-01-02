#' All India PIN Codes Directory with Latitude and Longitude Details (Updated: December 2021)
#'
#' This package contains geographic details about all PIN codes in India.
#'
#' @format A tibble with 243 rows and 10 variables:
#' \describe{
#'   \item{Circle}{chr Name of the Postal Circle}
#'   \item{Region}{chr Name of the Postal Region} 
#'   \item{Division}{chr Name of the Postal Division}
#'   \item{Office}{chr Name of Postal Office}
#'   \item{PIN}{int Six-digit PIN Code}
#'   \item{District}{chr Name of the District}
#'   \item{State}{chr Name of the State}
#'   \item{Latitude}{dbl Latitude}
#'   \item{Longitude}{dbl Longitude}
#' }
#' @source \url{https://www.indiapost.gov.in/vas/pages/findpincode.aspx}
"IndiaPIN"
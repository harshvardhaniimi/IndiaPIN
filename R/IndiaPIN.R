#' All India PIN Codes Directory with Latitude and Longitude Details (Updated: December 2021)
#'
#' This dataset contains geographic details about all PIN codes in India.
#'
#' @format A tibble with 19,300 rows and 9 variables:
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
#' @source Department of Posts, Ministry of Communications, Government of India. URL: \url{https://www.indiapost.gov.in/vas/pages/findpincode.aspx}.
#' Wrangled for this package by Harshvardhan (\url{https://harsh17.in/}). 
"IndiaPIN"
#' COVID19 in Europe
#'
#' A subset of data from the ECDC about COVID19 cases and related deaths in different European countries
#' Report .
#'
#' @format ## `covid19`
#' A data frame with 28729 rows and 11 columns:
#' \describe{
#'   \item{dateRep}{Date}
#'   \item{day, month, year}{Date indicators}
#'   \item{cases}{Documented COVID19 cases}
#'   \item{deaths}{COVID19 related deaths}
#'   \item{countriesAndTerritories}{Country name}
#'   \item{geoId, countryterritoryCode}{Codes to indicate country}
#'   \item{popData2020}{Eurostat 2020 data}
#'   \item{continentExp}{Continent}
#' }
#' @source <https://opendata.ecdc.europa.eu/covid19/nationalcasedeath_eueea_daily_ei/csv>
"covid19"

#' PDB file containing the information about 3COB (kinesin)
#' PDB 3cob, kinesin
#'
#' @format PDB format
#' A list with 28729 rows and 11 columns:
#'
#' @source <https://www.rcsb.org/structure/3COB>
"kinesin"

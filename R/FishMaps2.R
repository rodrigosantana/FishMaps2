#' @title Proportional symbol mapping for fishery data in batch mode
#'
#' @description Proportional symbol mapping for fishery data in batch mode (ggplot2 version)
#'
#' @docType package
#' @name FishMaps2
NULL

#' @title Blue marlin capture
#' @name dat.bum
#'
#' @description Blue marlin capture by the long-line fleet in Atlantic
#' Ocean
#'
#' @format A data frame with 496 rows and 4 variables:
#' \itemize{
#'   \item Quarter: quarter of the year
#'   \item Lat: latitude centered in the middle of 5x5 squares
#'   \item Lon: longitude centered in the middle of 5x5 squares
#'   \item BUM: blue marlin capture
#' }
#'
#' @docType data
#' @keywords datasets
#' @usage data(dat.bum)
#' @source Based in ICCAT public databases
NULL

#' @title White marlin capture
#' @name dat.whm
#'
#' @description White marlin capture by the long-line fleet in Atlantic
#' Ocean
#'
#' @format A data frame with 496 rows and 4 variables:
#' \itemize{
#'   \item Quarter: quarter of the year
#'   \item Lat: latitude centered in the middle of 5x5 squares
#'   \item Lon: longitude centered in the middle of 5x5 squares
#'   \item WHM: white marlin capture
#' }
#'
#' @docType data
#' @keywords datasets
#' @usage data(dat.whm)
#' @source Based in ICCAT public databases
NULL

#' @title White marlin and blue marlin capture
#' @name dat.whm.bum
#'
#' @description White marlin and blue marlin capture by the long-line
#' fleet in Atlantic Ocean. (These are the same data contained in
#' \code{dat.whm} and \code{dat.bum} separately).
#'
#' @format A data frame with 496 rows and 4 variables:
#' \itemize{
#'   \item Quarter: quarter of the year
#'   \item Lat: latitude centered in the middle of 5x5 squares
#'   \item Lon: longitude centered in the middle of 5x5 squares
#'   \item WHM: white marlin capture
#'   \item BUM: blue marlin capture
#' }
#'
#' @docType data
#' @keywords datasets
#' @usage data(dat.whm.bum)
#' @source Based in ICCAT public databases
NULL

#' @title Teste dataset
#' @name dat.lat
#'
#' @description Teste dataset. PLEASE include more information.
#'
#' @format A data frame with 496 rows and 4 variables:
#' \itemize{
#'   \item Quarter: quarter of the year
#'   \item Lat: latitude centered in the middle of 5x5 squares
#'   \item Lon: longitude centered in the middle of 5x5 squares
#'   \item Catch: some catch
#' }
#'
#' @docType data
#' @keywords datasets
#' @usage data(dat.lat)
#' @source Based in ICCAT public databases
NULL

#' @title Teste dataset
#' @name dat.lat.y
#'
#' @description Teste dataset. PLEASE include more information.
#'
#' @format A data frame with 6557 rows and 5 variables:
#' \itemize{
#'   \item Year: year
#'   \item Quarter: quarter of the year
#'   \item Lat: latitude centered in the middle of 5x5 squares
#'   \item Lon: longitude centered in the middle of 5x5 squares
#'   \item Catch: some catch
#' }
#'
#' @docType data
#' @keywords datasets
#' @usage data(dat.lat.y)
#' @source Based in ICCAT public databases
NULL

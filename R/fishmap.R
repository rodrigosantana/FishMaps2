#' @title Plots fishery data into maps
#' @name fishmap
#'
#' @description Plots georeferenced fishery data (catch, effort, CPUE,
#' ...) into maps. This description needs to be expanded.
#'
#' @param x A vector of coordinates (longitude)
#' @param y A vector of coordinates (latitude)
#' @param fill A numeric vector with data to fill in the map
#' @param facetplot wtf
#' @param dat The data frame containing the data
#' @param basemap The map datbase (from package \code{mapdata})
#' @param xlim,ylim X (longitude) and Y (latitude) limits of the map
#' @param col.grd The color of the grid
#' @param bathymetry A logical indicating if bathymetry lines should be
#' included
#' @param ... Other arguments passed to \code{map}
#'
#' @return A map with data
#'
#' @examples
#' 1 + 1
#'
#' @import ggplot2 maps mapdata marelac
#' @export
tilemap <- function(x, y, fill, facetplot, dat, basemap, xlim, ylim, col.grd,
                    bathymetry, ...){
  if(is.null(facetplot)) {
      if(bathymetry) {
          add <- isobathy(database = bathymetry[[1]])
          mm <- map_data(basemap)
          ggplot(dat, aes_string(x = x, y = y)) +
              geom_tile(aes_string(fill = fill)) +
              scale_fill_gradient(low = col.grd[1], high = col.grd[2]) +
              geom_polygon(data = mm, aes(x = long, y = lat,
                                          group = group)) +
              geom_contour(data = add, aes(x = lon, y = lat, z = prof),
                           alpha = .2, breaks = bathymetry[[2]]) +
              coord_fixed(xlim = xlim, ylim = ylim) +
              xlab(expression(paste("Longitude ", "(", degree, ")"))) +
              ylab(expression(paste("Latitude ", "(", degree, ")")))
      } else {
          mm <- map_data(basemap)
          ggplot(dat, aes_string(x = x, y = y)) +
              geom_tile(aes_string(fill = fill)) +
              scale_fill_gradient(low = col.grd[1], high = col.grd[2]) +
              geom_polygon(data = mm, aes(x = long, y = lat, group = group)) +
              coord_fixed(xlim = xlim, ylim = ylim) +
              xlab(expression(paste("Longitude ", "(", degree, ")"))) +
              ylab(expression(paste("Latitude ", "(", degree, ")")))
      }
  } else {
      if(bathymetry) {
          add <- isobath(database = bathymetry[[1]])
          mm <- map_data(basemap)
          ggplot(dat, aes_string(x = x, y = y)) +
              facet_wrap(as.formula(facetplot), ncol = 2) +
              geom_tile(aes_string(fill = fill)) +
              scale_fill_gradient(low = col.grd[1], high = col.grd[2]) +
              geom_polygon(data = mm, aes(x = long, y = lat,
                                          group = group)) +
              geom_contour(data = add, aes(x = lon, y = lat, z = prof),
                           alpha = .2, breaks = bathymetry[[2]]) +
              coord_fixed(xlim = xlim, ylim = ylim) +
              xlab(expression(paste("Longitude ", "(", degree, ")"))) +
              ylab(expression(paste("Latitude ", "(", degree, ")")))
      } else {
          mm <- map_data(basemap)
          ggplot(dat, aes_string(x = x, y = y)) +
              facet_wrap(as.formula(facetplot), ncol = 2) +
              geom_tile(aes_string(fill = fill)) +
              scale_fill_gradient(low = col.grd[1], high = col.grd[2]) +
              geom_polygon(data = mm, aes(x = long, y = lat, group = group)) +
              coord_fixed(xlim = xlim, ylim = ylim) +
              xlab(expression(paste("Longitude ", "(", degree, ")"))) +
              ylab(expression(paste("Latitude ", "(", degree, ")")))
      }
  }
}

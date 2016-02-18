#' @title Plots fishery data into maps
#' @name tilemap
#'
#' @description Plots georeferenced fishery data (catch, effort, CPUE,
#' ...) into maps. This description needs to be expanded.
#'
#' @param x A vector of coordinates (longitude)
#' @param y A vector of coordinates (latitude)
#' @param z A numeric vector with data to fill in the map
#' @param data The data frame containing the data
#' @param facet wtf
#' @param xlim,ylim X (longitude) and Y (latitude) limits of the map
#' @param col.fill The color of the grid
#' @param database The map datbase (from package \code{mapdata})
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
tilemap <- function(x, y, z, data, facet = NULL, xlim, ylim,
                    col.fill = c("gray70", "gray10"),
                    database = c("world", "worldHires"),
                    bathymetry = FALSE, ...){
    ## Choose database
    database <- match.arg(database)
    switch(database,
           world = database <- map_data("world"),
           worldHires = database <- map_data("worldHires"))
    if(is.null(facet)) {
        if(bathymetry) {
            add <- isobathy(database = marelac::Bathymetry)
            mm <- database
            ggplot(data = data, aes_string(x = x, y = y)) +
                geom_tile(data = data, aes_string(fill = z)) +
                scale_fill_gradient("", low = col.fill[1], high = col.fill[2]) +
                geom_polygon(data = mm, aes_string(x = "long", y = "lat",
                                                   group = "group")) +
                geom_contour(data = add, aes_string(x = "lon", y = "lat", z = "prof"),
                             alpha = .2, breaks = seq(0, -7000, -1000)) +
                coord_fixed(xlim = xlim, ylim = ylim) +
                xlab(expression(paste("Longitude ", "(", degree, ")"))) +
                ylab(expression(paste("Latitude ", "(", degree, ")")))
        } else {
            mm <- database
            ggplot(data = data, aes_string(x = x, y = y)) +
                geom_tile(data = data, aes_string(fill = z)) +
                scale_fill_gradient("", low = col.fill[1], high = col.fill[2]) +
                geom_polygon(data = mm, aes_string(x = "long", y = "lat", group = "group")) +
                coord_fixed(xlim = xlim, ylim = ylim) +
                xlab(expression(paste("Longitude ", "(", degree, ")"))) +
                ylab(expression(paste("Latitude ", "(", degree, ")")))
        }
    } else {
        if(bathymetry) {
            add <- isobathy(database = marelac::Bathymetry)
            mm <- database
            ggplot(data = data, aes_string(x = x, y = y)) +
                facet_wrap(as.formula(facet), ncol = 2) +
                geom_tile(data = data, aes_string(fill = z)) +
                scale_fill_gradient("", low = col.fill[1], high = col.fill[2]) +
                geom_polygon(data = mm, aes_string(x = "long", y = "lat",
                                                   group = "group")) +
                geom_contour(data = add, aes_string(x = "lon", y = "lat", z = "prof"),
                             alpha = .2, breaks = seq(0, -7000, -1000)) +
                coord_fixed(xlim = xlim, ylim = ylim) +
                xlab(expression(paste("Longitude ", "(", degree, ")"))) +
                ylab(expression(paste("Latitude ", "(", degree, ")")))
        } else {
            mm <- database
            ggplot(data = data, aes_string(x = x, y = y)) +
                facet_wrap(as.formula(facet), ncol = 2) +
                geom_tile(data = data, aes_string(fill = z)) +
                scale_fill_gradient("", low = col.fill[1], high = col.fill[2]) +
                geom_polygon(data = mm, aes_string(x = "long", y = "lat", group = "group")) +
                coord_fixed(xlim = xlim, ylim = ylim) +
                xlab(expression(paste("Longitude ", "(", degree, ")"))) +
                ylab(expression(paste("Latitude ", "(", degree, ")")))
      }
    }
}

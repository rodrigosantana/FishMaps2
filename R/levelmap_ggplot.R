levelmap_ggplot <- function(x, y, fill, facetplot, dat, basemap, xlim, ylim, col.grd, 
                     bathymetry, ...){
  require(maps)
  require(mapdata)
  require(ggplot2)
  require(marelac)
  if(is.null(facetplot)) {
    if(bathymetry) {
        ## Função para converter a base de dados batimétricos.
        # mudei alguns nomes pra nao confundir com os que ja tinham
        isobath <- function(iso){
          temp <- expand.grid(iso$x, iso$y)
          temp2 <- data.frame(matrix(unlist(iso$z)))
          res <- data.frame(lat = temp[,2], lon = temp[,1], prof = temp2[,1])
          res <- subset(res, subset = prof <= 0)
          return(res)
        }
        data(Bathymetry)
        add <- isobath(Bathymetry)
        mm <- map_data(basemap)
        ggplot(dat, aes_string(x = x, y = y)) +
          geom_tile(aes_string(fill = fill)) +
          scale_fill_gradient(low = col.grd[1], high = col.grd[2]) +
          geom_polygon(data = mm, aes(x = long, y = lat, group = group)) +
          geom_contour(data = add, aes(x = lon, y = lat, z = prof), alpha = .2) +
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
      ## Função para converter a base de dados batimétricos.
      # mudei alguns nomes pra nao confundir com os que ja tinham
      isobath <- function(iso){
        temp <- expand.grid(iso$x, iso$y)
        temp2 <- data.frame(matrix(unlist(iso$z)))
        res <- data.frame(lat = temp[,2], lon = temp[,1], prof = temp2[,1])
        res <- subset(res, subset = prof <= 0)
        return(res)
      }
      data(Bathymetry)
      add <- isobath(Bathymetry)
      mm <- map_data(basemap)
      ggplot(dat, aes_string(x = x, y = y)) +
        facet_wrap(as.formula(facetplot), ncol = 2) +
        geom_tile(aes_string(fill = fill)) +
        scale_fill_gradient(low = col.grd[1], high = col.grd[2]) +
        geom_polygon(data = mm, aes(x = long, y = lat, group = group)) +
        geom_contour(data = add, aes(x = lon, y = lat, z = prof), alpha = .2) +
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

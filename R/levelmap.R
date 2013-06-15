levelmap <- function(x, data, xlim, ylim, lev, jump,
                     key.space = "right",
                     database = "world",
                     bathymetry = FALSE, ...){
    ## Base de dados para os mapas
    mm <- maps::map(database = database, plot = FALSE, fill = TRUE)
    ## Define os ranges do mapa, e os labels para colocar nos graficos
    labsx <- seq(min(xlim), max(xlim), jump)
    labsxc <- as.character(labsx)
    labsxc[seq(2, length(labsxc), 2)] <- ""
    labsy <- seq(min(ylim), max(ylim), jump)
    labsyc <- as.character(labsy)
    labsyc[seq(2, length(labsyc), 2)] <- ""
    ## Define as classes
    ## obj <- paste(all.vars(match.call())[4], all.vars(x)[1], sep = "$")
    ## lev <- pretty(eval(obj), n)
    ## Função para plotar valores zero
    panel.zero.points <- function(x, y, z, subscripts, ...){
        require("grid", quietly = TRUE)
        x <- as.numeric(x)[subscripts]
        y <- as.numeric(y)[subscripts]
        z <- as.numeric(z)[subscripts]
        for(i in seq(along = z)){
            if(z[i] == 0L){
                grid.points(x = x[i], y = y[i], pch = 3,
                            size = unit(1, "native"))
            } else{
                grid.points(x = x[i], y = y[i], pch = "")
            }
        }
    }
    ## Função para plotar NA's
    panel.na.points <- function(x, y, z, subscripts, ...){
        require("grid", quietly = TRUE)
        x <- as.numeric(x)[subscripts]
        y <- as.numeric(y)[subscripts]
        z <- as.numeric(z)[subscripts]
        for(i in seq(along = z)){
            if(is.na(z[i])) {
                grid.points(x = x[i], y = y[i], pch = "-")
            } else if(z[i] == 0L) {
                grid.points(x = x[i], y = y[i], pch = "+")
            } else {
                grid.points(x = x[i], y = y[i], pch = "")
            }
        }
    }
    ## Função para converter a base de dados batimétricos.
    isobath <- function(x, ...){
        temp <- expand.grid(x$x, x$y)
        temp2 <- data.frame(matrix(unlist(x$z)))
        add <- data.frame(x = temp[,1], y = temp[,2], z = temp2[,1])
    }
    ## levelmap com levelplot
    ## Base de dados de batimetrias - lembrando que é requisito do
    ## FishMaps2 o pacote marelac!!
    if(bathymetry == TRUE) {
        data(Bathymetry)
        # OBSERVACÃO: tem que rodar o add na mão, dentro da função não
        # esta workando. Não sei pq!! Roda a function isobath antes!
        add <- isobath(Bathymetry)
        p <- levelplot(x, data, ..., mm = mm, aspect = "iso",
                       as.table = TRUE, xlim = xlim, ylim = ylim,
                       xlab = expression(paste("Longitude ", "(", degree, ")")),
                       ylab = expression(paste("Latitude ", "(", degree, ")")),
                       scales = list(x = list(at = labsx, labels = labsxc),
                           y = list(at = labsy, labels = labsyc)),
                       strip = strip.custom(bg = "lightgrey"),
                       at = lev, colorkey = list(space = key.space),
                       col.regions = grey.colors(length(lev)-1,
                           start = 0.7, end = 0.1),
                       par.settings = list(layout.heights =
                           list(top.padding = 0, bottom.padding = 0)),
                       panel = function(x, y, z, mm, ...){
                           panel.levelplot(x, y, z, ...)
                           panel.grid(h = -length(labsx), v = -length(labsy), ...)
                           panel.polygon(mm$x, mm$y, border = "black",
                                         col = "snow")
                           panel.na.points(x, y, z, ...)
                       })
        p <- p + layer(
            panel.contourplot(x = add$x, y = add$y, z = add$z,
                              at = seq(0, -8000, -1000),
                              col = "gray10", lty = "dashed",
                              contour = TRUE, subscripts = TRUE,
                              xlim = xlim, ylim = ylim, region =
                              FALSE, labels = list(labels = TRUE, col =
                                         "gray10", cex = 0.5), label.style =
                              "flat"), data = add)
    } else {
        p <- levelplot(x, data, ..., mm = mm, aspect = "iso",
                       as.table = TRUE, xlim = xlim, ylim = ylim,
                       xlab = expression(paste("Longitude ", "(", degree, ")")),
                       ylab = expression(paste("Latitude ", "(", degree, ")")),
                       scales = list(x = list(at = labsx, labels = labsxc),
                           y = list(at = labsy, labels = labsyc)),
                       strip = strip.custom(bg = "lightgrey"),
                       at = lev, colorkey = list(space = key.space),
                       col.regions = grey.colors(length(lev)-1,
                           start = 0.7, end = 0.1),
                       par.settings = list(layout.heights = list(top.padding = 0,
                                               bottom.padding = 0)),
                       panel = function(x, y, z, mm, ...){
                           panel.levelplot(x, y, z, ...)
                           panel.grid(h = -length(labsx), v = -length(labsy), ...)
                           panel.polygon(mm$x, mm$y, border = "black", col =
                                         "snow")
                           panel.na.points(x, y, z, ...)
                       })
    }
    print(p)
}

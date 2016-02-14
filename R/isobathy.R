##' @title Title
##'
##' @description Texto.
##'
##' @param database param
##' @return return
##' @author Rodrigo Sant'Ana
isobathy <- function(database) {
    iso <- database
    temp <- expand.grid(iso$x, iso$y)
    temp2 <- data.frame(matrix(unlist(iso$z)))
    res <- data.frame(lat = temp[,2], lon = temp[,1], prof = temp2[,1])
    res <- res[res$prof <= 0, ]
    return(res)
}

##======================================================================
## This is the main development file for FishMaps2. Everything here is
## experimental and is used for tests and examples.
##======================================================================

## testando a funcao tilemap
args(tilemap)

##----------------------------------------------------------------------
## Bait Boat
##----------------------------------------------------------------------

tilemap(x = "lon", y = "lat", z = "cpue", data = BB.data.y,
        xlim = c(-60, -40), ylim = c(-35, -20),
        database = "world")

ggplot(data = BB.data.y, aes_string(x = "lon", y = "lat")) +
    geom_tile(data = BB.data.y, aes_string(fill = "cpue")) +
    scale_fill_gradient("", low = col.fill[1], high = col.fill[2]) +
    geom_polygon(data = mm, aes_string(x = "long", y = "lat", group = "group")) +
    coord_fixed(xlim = xlim, ylim = ylim) +
    xlab(expression(paste("Longitude ", "(", degree, ")"))) +
    ylab(expression(paste("Latitude ", "(", degree, ")")))


tilemap(x = "lon", y = "lat", z = "cpue",
        facet = "~quarter", data = BB.data.yq,
        xlim = c(-60, -40), ylim = c(-35, -20),
        database = "world")

tilemap(x = "lon", y = "lat", z = "cpue",
        data = BB.data.y, bathymetry = TRUE,
        xlim = c(-60, -40), ylim = c(-35, -20),
        database = "world")

tilemap(x = "lon", y = "lat", z = "cpue",
        facet = "~quarter", data = BB.data.yq,
        xlim = c(-60, -40), ylim = c(-35, -20),
        database = "world", bathymetry = TRUE)

## BB YEAR with ZERO
str(BB.data.y)
set.seed(1982)
idx <- sample(nrow(BB.data.y), size = 8)
bait.boat.y0 <- BB.data.y
bait.boat.y0$cpue[idx] <- 0
tilemap(x = "lon", y = "lat", z = "cpue", data = bait.boat.y0,
        xlim = c(-60, -40), ylim = c(-35, -20),
        database = "world")

## BB YEAR with ZERO and NA
bait.boat.y0na <- bait.boat.y0
## -25.5/-45.5 (2001)
bait.boat.y0na$cpue[9] <- NA
## -23.5/-41.5 (2002)
bait.boat.y0na$cpue[28] <- NA
tilemap(x = "lon", y = "lat", z = "cpue", data = bait.boat.y0na,
        xlim = c(-60, -40), ylim = c(-35, -20),
        database = "world")

## Para comparar os quadrados com zero e NA
tilemap(x = "lon", y = "lat", z = "cpue", data = bait.boat.y0,
        xlim = c(-60, -40), ylim = c(-35, -20),
        database = "world", facet = "~year")
dev.new()
tilemap(x = "lon", y = "lat", z = "cpue", data = bait.boat.y0na,
        xlim = c(-60, -40), ylim = c(-35, -20),
        database = "world", facet = "~year")

## BB YEAR-QUARTER with ZERO
str(BB.data.yq)
set.seed(1982)
idx <- sample(nrow(BB.data.yq), size = 18)
bait.boat.yq0 <- BB.data.yq
bait.boat.yq0$cpue[idx] <- 0
levelmap(cpue ~ lon + lat | year + quarter, data = bait.boat.yq0,
         xlim = c(-60, -40), ylim = c(-35, -20),
         key.space = "right", database = "world",
         breaks = pretty(bait.boat.yq0$cpue), square = 1)

## BB YEAR-QUARTER with ZERO and NA
bait.boat.yq0na <- bait.boat.yq0
## -32.5/-50.5 (2001/2)
bait.boat.yq0na$cpue[34] <- NA
## -23.5/-41.5 (2002/1)
bait.boat.yq0na$cpue[61] <- NA
levelmap(cpue ~ lon + lat | year + quarter, data = bait.boat.yq0na,
         xlim = c(-60, -40), ylim = c(-35, -20),
         key.space = "right", database = "world",
         breaks = pretty(bait.boat.yq0na$cpue), square = 1)
##----------------------------------------------------------------------

##----------------------------------------------------------------------
## Long Line
##----------------------------------------------------------------------

tilemap(x = "lon", y = "lat", z = "cpue", data = LL.data.y,
         xlim = c(-60, -20), ylim = c(-50, -10),
        database = "world")

tilemap(x = "lon", y = "lat", z = "cpue", data = LL.data.yq,
         xlim = c(-60, -20), ylim = c(-50, -10),
        database = "world", facet = "~quarter")

tilemap(x = "lon", y = "lat", z = "cpue", data = LL.data.y,
         xlim = c(-60, -20), ylim = c(-50, -10),
        database = "world", bathymetry = TRUE)

tilemap(x = "lon", y = "lat", z = "cpue", data = LL.data.yq,
         xlim = c(-60, -20), ylim = c(-50, -10),
        database = "world", facet = "~quarter",
        bathymetry = TRUE)

## LL YEAR
levelmap(cpue ~ lon + lat | year, data = LL.data.y,
         xlim = c(-60, -20), ylim = c(-50, -10),
         key.space = "right", database = "world",
         breaks = pretty(LL.data.y$cpue), square = 5)

## LL YEAR with ZERO
str(LL.data.y)
set.seed(1982)
idx <- sample(nrow(LL.data.y), size = 8)
long.line.y0 <- LL.data.y
long.line.y0$cpue[idx] <- 0
levelmap(cpue ~ lon + lat | year, data = long.line.y0,
         xlim = c(-60, -20), ylim = c(-50, -10),
         key.space = "right", database = "world",
         breaks = pretty(long.line.y0$cpue), square = 5)

## LL YEAR with ZERO and NA
long.line.y0na <- long.line.y0
## -27.5/-37.5 (2002)
long.line.y0na$cpue[26] <- NA
## -37.5/-32.5 (2005)
long.line.y0na$cpue[72] <- NA
levelmap(cpue ~ lon + lat | year, data = long.line.y0na,
         xlim = c(-60, -20), ylim = c(-50, -10),
         key.space = "right", database = "world",
         breaks = pretty(long.line.y0na$cpue), square = 5)

## LL YEAR-QUARTER
levelmap(cpue ~ lon + lat | year + quarter, data = LL.data.yq,
         xlim = c(-60, -20), ylim = c(-50, -10),
         key.space = "right", database = "world",
         breaks = pretty(LL.data.yq$cpue), square = 5)

## LL YEAR-QUARTER with ZERO
str(LL.data.yq)
set.seed(1982)
idx <- sample(nrow(LL.data.yq), size = 18)
long.line.yq0 <- LL.data.yq
long.line.yq0$cpue[idx] <- 0 # alguns ficaram escondidos
levelmap(cpue ~ lon + lat | year + quarter, data = long.line.yq0,
         xlim = c(-60, -20), ylim = c(-50, -10),
         key.space = "right", database = "world",
         breaks = pretty(long.line.yq0$cpue), square = 5)

## LL YEAR-QUARTER with ZERO and NA
long.line.yq0na <- long.line.yq0
## -32.5/-47.5 (2002/3)
long.line.yq0na$cpue[64] <- NA
## -32.5/-32.5 (2005/1)
long.line.yq0na$cpue[154] <- NA
levelmap(cpue ~ lon + lat | year + quarter, data = long.line.yq0na,
         xlim = c(-60, -20), ylim = c(-50, -10),
         key.space = "right", database = "world",
         breaks = pretty(long.line.yq0na$cpue), square = 5)
##----------------------------------------------------------------------


##----------------------------------------------------------------------
## Base de dados para o mapa
library(maps)
library(mapdata)
mm <- map("world", plot = FALSE, fill = TRUE)
##----------------------------------------------------------------------

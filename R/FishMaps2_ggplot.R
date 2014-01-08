## Loading function
source("levelmap_ggplot.R")
## Loading data
dados <- read.table("../data/mapa.bum.csv", sep = ",", dec = ".", header = TRUE)
## Exclude trash column from data
dados <- dados[,2:5]
## Plot map facet by Quarter without isobaths
levelmap(dat = dados, x = 'Lon3', y = 'Lat3', fill = 'x', facet = '~Quarter', 
         basemap = 'world', xlim = c(-120,120), ylim = c(50, -90), 
         col.grd = c('gray', 'red'), bathymetry = FALSE)
## Plot map without segregation and isobaths         
levelmap(dat = dados, x = 'Lon3', y = 'Lat3', fill = 'x', facet = NULL, 
         basemap = 'world', xlim = c(-120,120), ylim = c(50, -90), 
         col.grd = c('gray', 'red'), bathymetry = FALSE)         
## Plot map segregated by Quarter with isobaths
levelmap(dat = dados, x = 'Lon3', y = 'Lat3', fill = 'x', facet = '~Quarter', 
         basemap = 'world', xlim = c(-120,120), ylim = c(50, -90), 
         col.grd = c('gray', 'red'), bathymetry = TRUE)
## Plot map without segregation and with isobaths         
levelmap(dat = dados, x = 'Lon3', y = 'Lat3', fill = 'x', facet = NULL, 
         basemap = 'world', xlim = c(-120,120), ylim = c(50, -90), 
         col.grd = c('gray', 'red'), bathymetry = TRUE)

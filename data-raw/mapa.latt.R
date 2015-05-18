##======================================================================
## Convertendo os arquivos csv em rda para poder colocar no pacote
dir("data/")
# dat.lat.y
dat.lat.y <- read.table("data/mapa.latt.csv", sep = ",", dec = ".", header = TRUE)
str(dat.lat.y)
dat.lat.y <- dat.lat.y[,-1]
names(dat.lat.y) <- c("Year", "Quarter", "Lat", "Lon", "Catch")
str(dat.lat.y)
save("dat.lat.y", file = "data/dat.lat.y.rda")

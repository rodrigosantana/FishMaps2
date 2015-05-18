##======================================================================
## Convertendo os arquivos csv em rda para poder colocar no pacote
dir("data/")
# dat.lat
dat.lat <- read.table("data/mapa.latt.q.csv", sep = ",", dec = ".", header = TRUE)
str(dat.lat)
dat.lat <- dat.lat[,-1]
names(dat.lat) <- c("Quarter", "Lat", "Lon", "Catch")
str(dat.lat)
save("dat.lat", file = "data/dat.lat.rda")

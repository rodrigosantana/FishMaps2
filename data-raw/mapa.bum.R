##======================================================================
## Convertendo os arquivos csv em rda para poder colocar no pacote
dir("data/")
# dat.bum
dat.bum <- read.table("data/mapa.bum.csv", sep = ",", dec = ".", header = TRUE)
str(dat.bum)
dat.bum <- dat.bum[,-1]
names(dat.bum) <- c("Quarter", "Lat", "Lon", "BUM")
str(dat.bum)
save("dat.bum", file = "data/dat.bum.rda")

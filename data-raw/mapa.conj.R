##======================================================================
## Convertendo os arquivos csv em rda para poder colocar no pacote
dir("data/")
# dat.whm.bum
dat.whm.bum <- read.table("data/mapa.conj.csv", sep = ",", dec = ".", header = TRUE)
str(dat.whm.bum)
dat.whm.bum <- dat.whm.bum[,-1]
names(dat.whm.bum) <- c("Quarter", "Lat", "Lon", "WHM", "BUM")
str(dat.whm.bum)
save("dat.whm.bum", file = "data/dat.whm.bum.rda")

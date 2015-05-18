##======================================================================
## Convertendo os arquivos csv em rda para poder colocar no pacote
dir("data/")
# dat.whm
dat.whm <- read.table("data/mapa.whm.csv", sep = ",", dec = ".", header = TRUE)
str(dat.whm)
dat.whm <- dat.whm[,-1]
names(dat.whm) <- c("Quarter", "Lat", "Lon", "WHM")
str(dat.whm)
save("dat.whm", file = "data/dat.whm.rda")

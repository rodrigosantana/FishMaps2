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
# dat.whm
dat.whm <- read.table("data/mapa.whm.csv", sep = ",", dec = ".", header = TRUE)
str(dat.whm)
dat.whm <- dat.whm[,-1]
names(dat.whm) <- c("Quarter", "Lat", "Lon", "WHM")
str(dat.whm)
save("dat.whm", file = "data/dat.whm.rda")
# dat.whm.bum
dat.whm.bum <- read.table("data/mapa.conj.csv", sep = ",", dec = ".", header = TRUE)
str(dat.whm.bum)
dat.whm.bum <- dat.whm.bum[,-1]
names(dat.whm.bum) <- c("Quarter", "Lat", "Lon", "WHM", "BUM")
str(dat.whm.bum)
save("dat.whm.bum", file = "data/dat.whm.bum.rda")
# dat.lat
dat.lat <- read.table("data/mapa.latt.q.csv", sep = ",", dec = ".", header = TRUE)
str(dat.lat)
dat.lat <- dat.lat[,-1]
names(dat.lat) <- c("Quarter", "Lat", "Lon", "Catch")
str(dat.lat)
save("dat.lat", file = "data/dat.lat.rda")
# dat.lat.y
dat.lat.y <- read.table("data/mapa.latt.csv", sep = ",", dec = ".", header = TRUE)
str(dat.lat.y)
dat.lat.y <- dat.lat.y[,-1]
names(dat.lat.y) <- c("Year", "Quarter", "Lat", "Lon", "Catch")
str(dat.lat.y)
save("dat.lat.y", file = "data/dat.lat.y.rda")
##======================================================================


## Loading function
source("../R/fishmap.R")
## Loading data
dados <- read.table("../data/mapa.bum.csv", sep = ",", dec = ".", header = TRUE)
## Exclude trash column from data
dados <- dados[,2:5]
## Plot map facet by Quarter without isobaths
fishmap(dat = dados, x = 'Lon3', y = 'Lat3', fill = 'x', facet = '~Quarter',
         basemap = 'world', xlim = c(-120,120), ylim = c(50, -90),
         col.grd = c('gray', 'red'), bathymetry = FALSE)
## Plot map without segregation and isobaths
fishmap(dat = dados, x = 'Lon3', y = 'Lat3', fill = 'x', facet = NULL,
         basemap = 'world', xlim = c(-120,120), ylim = c(50, -90),
         col.grd = c('gray', 'red'), bathymetry = FALSE)
## Plot map segregated by Quarter with isobaths
fishmap(dat = dados, x = 'Lon3', y = 'Lat3', fill = 'x', facet = '~Quarter',
         basemap = 'world', xlim = c(-120,120), ylim = c(50, -90),
         col.grd = c('gray', 'red'), bathymetry = TRUE)
## Plot map without segregation and with isobaths
fishmap(dat = dados, x = 'Lon3', y = 'Lat3', fill = 'x', facet = NULL,
         basemap = 'world', xlim = c(-120,120), ylim = c(50, -90),
         col.grd = c('gray', 'red'), bathymetry = TRUE)

########################################################################

dados2 <- read.csv("../data/mapa.latt.q.csv")

## Carrega a funcao
source("levelmap.R")
## Teste sem 0 e NAs
levelmap(x ~ Lon3 + Lat3 | factor(Quarter), data = dados2, xlim = c(-60, 20),
         ylim = c(-50, 5), breaks = pretty(dados2$x),
         jump = 5, bathymetry = TRUE,
         bathymetry.seq = seq(-1000, -8000, -1000))
dev.new()
fishmap(dat = dados2, x = 'Lon3', y = 'Lat3', fill = 'x',
                facet = "~Quarter", basemap = 'world',
                xlim = c(-60,20), ylim = c(-50, 5),
                col.grd = c('gray', 'black'), bathymetry = TRUE)
## O que teria que fazer
# 1. argumento para especificar o intervalo de apresentacao das lat/lon
# (parecido com o jump)
# 2. alternar a posicao das escalas do xlim e ylim como no lattice (ali
# por exemplo tem numeros sobrepostos na longitude)
# 3. tirar o fundo cinza do oceano porque pode confundir com a escala de
# cinza dos valores plotados
# 4. colocar as divisoes de paises/mudar a cor do continente para uma
# mais clara (ou colocar como argumento)
# 5. melhorar a apresentacao da escala (parece muito pequena, poderia
# aumentar e aproveitar mais o tamanho do mapa, além de colocar mais
# valores)
# 6. opcoes de batimetria (como o bathymetry.seq) e cor das isobatas
# 7. o argumento facet podia ser passado sem o til (formato de formula),
# deixando soh "Quarter" (o que aconteceria se tivesse mais um
# condicional, tipo Year? --- TESTAR)

dev.set(2)

## Insere 0
set.seed(123)
samp.0 <- sample(1:nrow(dados2), size = 5)
dados2$x[samp.0] <- 0
## Teste COM 0
levelmap(x ~ Lon3 + Lat3 | factor(Quarter), data = dados2, xlim = c(-60, 20),
         ylim = c(-50, 5), breaks = pretty(dados2$x),
         jump = 5, bathymetry = TRUE,
         bathymetry.seq = seq(-1000, -8000, -1000))
dev.set(3)
fishmap(dat = dados2, x = 'Lon3', y = 'Lat3', fill = 'x',
                facet = "~Quarter", basemap = 'world',
                xlim = c(-60,20), ylim = c(-50, 5),
                col.grd = c('gray', 'black'), bathymetry = TRUE)
# 8. inserir o simbolo para o zero
# - no FishMaps2 no lattice ele insere o simbolo, mas ainda junto com um
# quadrado cinza (eh um dos bugs que precisa corrigir na funcao
# panel.zero.points)
# 9. separar o zero na escala --- isso vale para os dois
# - talvez colocar um argumento zero.sep para ver se o usuario realmente
# quer separar o zero
# - talvez colocar um argumento pch.zero para escolher o simbolo do zero

dev.set(2)

## Insere NAs
set.seed(321)
samp.NA <- sample(1:nrow(dados2), size = 5)
dados2$x[samp.NA] <- NA
## Teste COM 0 E NAs
levelmap(x ~ Lon3 + Lat3 | factor(Quarter), data = dados2, xlim = c(-60, 20),
         ylim = c(-50, 5), breaks = pretty(dados2$x),
         jump = 5, bathymetry = TRUE,
         bathymetry.seq = seq(-1000, -8000, -1000))
dev.set(3)
fishmap(dat = dados2, x = 'Lon3', y = 'Lat3', fill = 'x',
                facet = "~Quarter", basemap = 'world',
                xlim = c(-60,20), ylim = c(-50, 5),
                col.grd = c('gray', 'black'), bathymetry = TRUE)
# 10. deixar as posicoes como NA em branco
# - na versao lattice ele deixa, mas da aquele erro de packet (tambem um
# bug na funcao panel.zero.points)

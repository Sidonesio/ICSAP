
# clean everything done before
rm(list=ls())

# prepare working directory
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/IBGE/Ano 2010/Malha Municipal/Município"
setwd(wd1)
getwd()

# packages
library(rgdal)
library(dplyr)

# read shape file
library(rgdal)
AC <- readOGR(dsn="./AC",layer="12MUE250GC_SIR")
AL <- readOGR(dsn="./AL",layer="27MUE250GC_SIR")
AM <- readOGR(dsn="./AM",layer="13MUE250GC_SIR")
AP <- readOGR(dsn="./AP",layer="16MUE250GC_SIR")
BA <- readOGR(dsn="./BA",layer="29MUE250GC_SIR")
CE <- readOGR(dsn="./CE",layer="23MUE250GC_SIR")
DF <- readOGR(dsn="./DF",layer="53MUE250GC_SIR")
ES <- readOGR(dsn="./ES",layer="32MUE250GC_SIR")
GO <- readOGR(dsn="./GO",layer="52MUE250GC_SIR")
MA <- readOGR(dsn="./MA",layer="21MUE250GC_SIR")
MG <- readOGR(dsn="./MG",layer="31MUE250GC_SIR")
MS <- readOGR(dsn="./MS",layer="50MUE250GC_SIR")
MT <- readOGR(dsn="./MT",layer="51MUE250GC_SIR")
PA <- readOGR(dsn="./PA",layer="15MUE250GC_SIR")
PB <- readOGR(dsn="./PB",layer="25MUE250GC_SIR")
PE <- readOGR(dsn="./PE",layer="26MUE250GC_SIR")
PI <- readOGR(dsn="./PI",layer="22MUE250GC_SIR")
PR <- readOGR(dsn="./PR",layer="41MUE250GC_SIR")
RJ <- readOGR(dsn="./RJ",layer="33MUE250GC_SIR")
RN <- readOGR(dsn="./RN",layer="24MUE250GC_SIR")
RO <- readOGR(dsn="./RO",layer="11MUE250GC_SIR")
RR <- readOGR(dsn="./RR",layer="14MUE250GC_SIR")
RS <- readOGR(dsn="./RS",layer="43MUE250GC_SIR")
SC <- readOGR(dsn="./SC",layer="42MUE250GC_SIR")
SE <- readOGR(dsn="./SE",layer="28MUE250GC_SIR")
SP <- readOGR(dsn="./SP",layer="35MUE250GC_SIR")
TO <- readOGR(dsn="./TO",layer="17MUE250GC_SIR")

# convert shape file to data frame
# return longitude and latitude
# bind both objects in one data frame
ACdf <- cbind(as(AC, "data.frame"), coordinates(AC))
ALdf <- cbind(as(AL, "data.frame"), coordinates(AL))
AMdf <- cbind(as(AM, "data.frame"), coordinates(AM))
APdf <- cbind(as(AP, "data.frame"), coordinates(AP))
BAdf <- cbind(as(BA, "data.frame"), coordinates(BA))
CEdf <- cbind(as(CE, "data.frame"), coordinates(CE))
DFdf <- cbind(as(DF, "data.frame"), coordinates(DF))
ESdf <- cbind(as(ES, "data.frame"), coordinates(ES))
GOdf <- cbind(as(GO, "data.frame"), coordinates(GO))
MAdf <- cbind(as(MA, "data.frame"), coordinates(MA))
MGdf <- cbind(as(MG, "data.frame"), coordinates(MG))
MSdf <- cbind(as(MS, "data.frame"), coordinates(MS))
MTdf <- cbind(as(MT, "data.frame"), coordinates(MT))
PAdf <- cbind(as(PA, "data.frame"), coordinates(PA))
PBdf <- cbind(as(PB, "data.frame"), coordinates(PB))
PEdf <- cbind(as(PE, "data.frame"), coordinates(PE))
PIdf <- cbind(as(PI, "data.frame"), coordinates(PI))
PRdf <- cbind(as(PR, "data.frame"), coordinates(PR))
RJdf <- cbind(as(RJ, "data.frame"), coordinates(RJ))
RNdf <- cbind(as(RN, "data.frame"), coordinates(RN))
ROdf <- cbind(as(RO, "data.frame"), coordinates(RO))
RRdf <- cbind(as(RR, "data.frame"), coordinates(RR))
RSdf <- cbind(as(RS, "data.frame"), coordinates(RS))
SCdf <- cbind(as(SC, "data.frame"), coordinates(SC))
SEdf <- cbind(as(SE, "data.frame"), coordinates(SE))
SPdf <- cbind(as(SP, "data.frame"), coordinates(SP))
TOdf <- cbind(as(TO, "data.frame"), coordinates(TO))

# bind all states together in just one data frame
total <- rbind(ACdf,ALdf,AMdf,APdf,BAdf,CEdf,DFdf,ESdf,GOdf,MAdf,MGdf,MSdf,MTdf,
               PAdf,PBdf,PEdf,PIdf,PRdf,RJdf,RNdf,ROdf,RRdf,RSdf,SCdf,SEdf,SPdf,
               TOdf)

# change column name
names(total)[2] <- "COD7D"
names(total)[4] <- "Longitude"
names(total)[5] <- "Latitude"

# create variable
total$COD6D <- substr(total$COD7D, 1, 6)

# create vector
CapitaisVector <- c("ARACAJU","BELÉM","BELO HORIZONTE","BOA VISTA","BRASÍLIA",
                    "CAMPO GRANDE","CUIABÁ","CURITIBA","FLORIANÓPOLIS",
                    "FORTALEZA","GOIÂNIA","JOÃO PESSOA","MACAPÁ","MACEIÓ",
                    "MANAUS","NATAL","PALMAS","PORTO ALEGRE","PORTO VELHO",
                    "RECIFE","RIO BRANCO","RIO DE JANEIRO","SALVADOR",
                    "SÃO LUÍS","SÃO PAULO","TERESINA","VITÓRIA")

# create data frame capitals
library(dplyr)
CapitaisDf <- total %>%
  filter(NM_MUNICIP %in% CapitaisVector) %>%
  arrange(NM_MUNICIP)

# remove cities that are not capitals
CapitaisDf <- CapitaisDf %>%
  filter(!(COD7D != "1501402" & NM_MUNICIP == "BELÉM")) %>%
  filter(!(COD7D != "1400100" & NM_MUNICIP == "BOA VISTA")) %>%
  filter(!(COD7D != "5002704" & NM_MUNICIP == "CAMPO GRANDE")) %>%
  filter(!(COD7D != "1721000" & NM_MUNICIP == "PALMAS")) %>%
  filter(!(COD7D != "1200401" & NM_MUNICIP == "RIO BRANCO"))

# calculate distances from cities to capitals
library(geodist)
matrix <- geodist(total[,4:5], CapitaisDf[,4:5], measure = "geodesic")

# bind both data frames
distance <- as.data.frame(cbind(total[,2:3], total[,6], matrix))

# change column names
names(distance)[2] <- "Municipio"
names(distance)[3] <- "COD6D"
names(distance)[4] <- "Aracaju"
names(distance)[5] <- "Belem"
names(distance)[6] <- "Belo_Horizonte"
names(distance)[7] <- "Boa_Vista"
names(distance)[8] <- "Brasilia"
names(distance)[9] <- "Campo_Grande"
names(distance)[10] <- "Cuiaba"
names(distance)[11] <- "Curitiba"
names(distance)[12] <- "Florianopolis"
names(distance)[13] <- "Fortaleza"
names(distance)[14] <- "Goiania"
names(distance)[15] <- "Joao_Pessoa"
names(distance)[16] <- "Macapa"
names(distance)[17] <- "Maceio"
names(distance)[18] <- "Manaus"
names(distance)[19] <- "Natal"
names(distance)[20] <- "Palmas"
names(distance)[21] <- "Porto_Alegre"
names(distance)[22] <- "Porto_Velho"
names(distance)[23] <- "Recife"
names(distance)[24] <- "Rio_Branco"
names(distance)[25] <- "Rio_de_Janeiro"
names(distance)[26] <- "Salvador"
names(distance)[27] <- "Sao_Luis"
names(distance)[28] <- "Sao_Paulo"
names(distance)[29] <- "Teresina"
names(distance)[30] <- "Vitoria"

# create variable Less Distant
distance$LessDistant <- apply(distance, 1, FUN=min)
distance$LessDistant <- as.numeric(distance$LessDistant)
distance$LessDistant <- distance$LessDistant / 1000

# read file
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
df <- read.csv2("./CityICSAP7.csv")
CitiesLongLat <- read.csv2("./CitiesLongLat.csv")

# prepare data frame
PopHigh <- df %>%
  select(COD7D, COD6D, MUNICIPIO, MUNIC_UF, POPULACAO) %>%
  filter(POPULACAO > 200000)
PopHigh <- merge(x = PopHigh, 
                 y = CitiesLongLat[,c("COD7D","Longitude","Latitude")], 
                 by = "COD7D", 
                 all.x = TRUE)

# calculate distances from cities to high population
library(geodist)
DistHighPop <- geodist(CitiesLongLat[,5:6], PopHigh[,6:7], measure = "geodesic")

# bind both data frames
DistComp <- as.data.frame(cbind(CitiesLongLat[,3:4], 
                                CitiesLongLat[,7], 
                                DistHighPop))

# change column name
names(DistComp)[3] <- "COD6D"

# create variable Less Distant
DistComp$LessDistant2 <- apply(DistComp, 1, FUN=min)
DistComp$LessDistant2 <- as.numeric(DistComp$LessDistant2)
DistComp$LessDistant2 <- DistComp$LessDistant2 / 1000

# export file
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
write.csv2(distance, file ="./DistCapitals.csv")
write.csv2(total, file ="./CitiesLongLat.csv")
write.csv2(CapitaisDf, file ="./CapitalsLongLat.csv")
write.csv2(DistComp, file ="./DistHighPop.csv")



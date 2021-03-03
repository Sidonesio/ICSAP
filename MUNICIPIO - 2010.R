
library(readxl)

#################################### PART 1 ####################################

wd1 <- "C:/Users/usuario/OneDrive/R/Bancos de dados/Estimativa populacional"
setwd(wd1)
getwd()
pop2010 <- read_excel("./POP2010.xlsx", sheet="dataset")
sexo <- read_excel("./2010 - sexo.xlsx", sheet="dataset")
city2010 <- merge(pop2010, sexo, 
                  by = c("COD_MUNIC", "MUNICIPIO", "UF", "COD_UF"))
idade1 <- read_excel("./2010 - idade%.xlsx", sheet="Data.s.Formula")[,c(1:29, 35:50)]
city2010 <- merge(city2010, idade1, 
                  by = c("COD_MUNIC", "MUNICIPIO", "UF", "COD_UF"))            
domicilio <- read_excel("./2010 - domicílio.xlsx", sheet="dataset")
city2010 <- merge(city2010, domicilio, 
                  by = c("COD_MUNIC", "MUNICIPIO", "UF", "COD_UF"))
cor <- read_excel("./2010 - cor.xlsx", sheet="dataset")
city2010 <- merge(city2010, cor, 
                  by = c("COD_MUNIC", "MUNICIPIO", "UF", "COD_UF"))
school <- read_excel("./2010 - school.xlsx", sheet="dataset")
city2010 <- merge(city2010, school, 
                  by = c("COD_MUNIC", "MUNICIPIO", "UF", "COD_UF"))
renda <- read_excel("./2010 - renda.xlsx", sheet="dataset")
city2010 <- merge(city2010, renda, 
                  by = c("COD_MUNIC", "MUNICIPIO", "UF", "COD_UF"))

#################################### PART 2 ####################################

wd2 <- "C:/Users/usuario/OneDrive/R/Bancos de dados/ESF"
setwd(wd2)
AP <- read_excel("./ESF2010-2.xlsx", sheet="dataset")[,c(1, 4:6)]
city2010 <- merge(city2010, AP, by = c("COD_MUNIC", "COD_UF"))

#################################### PART 3 ####################################

wd3 <- "C:/Users/usuario/OneDrive/R/Bancos de dados/Atlas Desenvolvimento Humano"
setwd(wd3)
IDHM2010 <- read_excel("./IDHM2010.xlsx", sheet="dataset")
city2010 <- merge(city2010, IDHM2010, 
                  by = c("COD_MUNIC", "MUNICIPIO", "UF", "COD_UF"))

#################################### PART 4 ####################################

city2010$PORTE.POP <- city2010$POPULACAO
city2010$PORTE.POP <- ifelse(city2010$POPULACAO<=5000, "<= 5 mil", 
                             city2010$PORTE.POP)
city2010$PORTE.POP <- ifelse(city2010$POPULACAO>5000 & city2010$POPULACAO<=10000, 
                             "5-10 mil", city2010$PORTE.POP)
city2010$PORTE.POP <- ifelse(city2010$POPULACAO>10000 & city2010$POPULACAO<=20000,
                             "10-20 mil", city2010$PORTE.POP)
city2010$PORTE.POP <- ifelse(city2010$POPULACAO>20000 & city2010$POPULACAO<=50000,
                             "20-50 mil", city2010$PORTE.POP)
city2010$PORTE.POP <- ifelse(city2010$POPULACAO>50000 & city2010$POPULACAO<=100000,
                             "50-100 mil", city2010$PORTE.POP)
city2010$PORTE.POP <- ifelse(city2010$POPULACAO>100000 & city2010$POPULACAO<=500000,
                             "100-500 mil", city2010$PORTE.POP)
city2010$PORTE.POP <- ifelse(city2010$POPULACAO>500000, "> 500 mil", 
                             city2010$PORTE.POP)
city2010$PORTE.POP <- factor(city2010$PORTE.POP, 
                         levels = c("<= 5 mil", "5-10 mil", "10-20 mil", 
                                    "20-50 mil", "50-100 mil", "100-500 mil", 
                                    "> 500 mil"))

city2010$COB.GROUP <- city2010$'COB_MEAN%'
city2010$COB.GROUP <- ifelse(city2010$`COB_MEAN%` < 25, "BAIXA", 
                             city2010$COB.GROUP)
city2010$COB.GROUP <- ifelse(city2010$`COB_MEAN%` >= 25 
                             & city2010$`COB_MEAN%` <= 70 
                             & city2010$POPULACAO <= 100000, "MEDIA", 
                             city2010$COB.GROUP)
city2010$COB.GROUP <- ifelse(city2010$`COB_MEAN%` >= 25 
                             & city2010$`COB_MEAN%` <= 50 
                             & city2010$POPULACAO > 100000, "MEDIA", 
                             city2010$COB.GROUP)
city2010$COB.GROUP <- ifelse(city2010$`COB_MEAN%` > 70 
                             & city2010$POPULACAO <= 100000, "ALTA", 
                             city2010$COB.GROUP)
city2010$COB.GROUP <- ifelse(city2010$`COB_MEAN%` > 50 
                             & city2010$POPULACAO > 100000, "ALTA", 
                             city2010$COB.GROUP)
city2010$COB.GROUP <- factor(city2010$COB.GROUP, 
                             levels = c("BAIXA", "MEDIA", "ALTA"))

city2010$COD_MUNIC2 <- substr(city2010$COD_MUNIC, 1, nchar(city2010$COD_MUNIC)-1)

city2010 <- merge(city2010, LTGROUP[,2], 
                  by = "COD_MUNIC2")




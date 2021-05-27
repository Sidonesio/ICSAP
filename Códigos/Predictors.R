
# clean everything done before
rm(list=ls())

# packages
library(readxl)
library(dplyr)

# read data base
wd1 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd1)
getwd()
df <- read.csv2("./CityICSAP2.csv", colClasses=c("COD_MUNIC" = "character"))

# read data residence
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/IBGE/Ano 2010"
setwd(wd2)
getwd()
library(readxl)
urban <- read_excel("./Residence.xlsx", sheet = "dataset")
colnames(urban)[1] <- "COD7D"

# merge data sets
df <- merge(x = df, y = urban[,c(1,5)], by = "COD7D", all.x = TRUE)

# read data sex
sex <- read_excel("./Sex.xlsx", sheet = "dataset")
colnames(sex)[1] <- "COD7D"

# merge data sets
df <- merge(x = df, y = sex[,c(1,6)], by = "COD7D", all.x = TRUE)

# read data IDHM
wd3 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/Atlas Desenvolvimento Humano"
setwd(wd3)
getwd()
library(readxl)
idhm <- read_excel("./IDHM2010.xlsx", sheet = "dataset")
colnames(idhm)[1] <- "COD7D"

# merge data sets
df <- merge(x = df, y = idhm[,c(1,5:8)], by = "COD7D", all.x = TRUE)

# read data ESF
wd4 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/ESF"
setwd(wd4)
getwd()
esf <- read.csv2("./1998 - 2010.csv")
library(dplyr)
esf <- esf %>%
  filter(ANO == 2010)
esfgroup <- esf %>%
  group_by(Código) %>%
  summarise(ESFmean = mean(X..Cobertura),
            ESFmedian = median(X..Cobertura))
colnames(esfgroup)[1] <- "COD7D"

# merge data sets
df <- merge(x = df, y = esfgroup, by = "COD7D", all.x = TRUE)

# read data abastecimento
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/IBGE/Ano 2010"
setwd(wd2)
getwd()
library(readxl)
abast <- read_excel("./Abastecimento.xlsx", sheet = "dataset")
colnames(abast)[3] <- "RedeGeralAbast"

# merge data sets
df <- merge(x = df, y = abast[,c(1,3)], by = "COD7D", all.x = TRUE)

# read data esgotamento
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/IBGE/Ano 2010"
setwd(wd2)
getwd()
library(readxl)
esgot <- read_excel("./Esgotamento.xlsx", sheet = "dataset")
colnames(esgot)[1] <- "COD7D"

# merge data sets
df <- merge(x = df, y = esgot[,c(1,18)], by = "COD7D", all.x = TRUE)

# export file
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
write.csv2(df, file ="./CityICSAP4.csv")

# read data again
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
df <- read.csv2("./CityICSAP4.csv")
df$X.1 <- NULL
df$X <- NULL
df$RedeGeral <- NULL

# read data race percentage
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/IBGE/Ano 2010"
setwd(wd2)
getwd()
library(readxl)
race <- read_excel("./Race.xlsx", sheet = "dataset")
colnames(race)[1] <- "COD7D"

# merge data sets
df <- merge(x = df, y = race[,c(1,5:10)], by = "COD7D", all.x = TRUE)

# export file
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
write.csv2(df, file ="./CityICSAP5.csv")

# read main data set
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
df <- read.csv2("./CityICSAP5.csv")

# read data set leito
leito <- read.csv2("./LeitosCity.csv")

# merge data sets
df <- merge(x = df, y = leito[,c(2,5)], by = "COD6D", all.x = TRUE)
df$QT_SUS[is.na(df$QT_SUS)] <- 0

# create variable leito por habitante
df$QT_SUS_HAB <- df$QT_SUS / (df$POPULACAO / 1000)

# export file
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
write.csv2(df, file ="./CityICSAP6.csv")

# read main data set
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
df <- read.csv2("./CityICSAP6.csv")

# read data age percentage
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/IBGE/Ano 2010"
setwd(wd2)
getwd()
library(readxl)
age <- read_excel("./Age.xlsx", sheet = "Data.s.Formula")
colnames(age)

# merge data sets
df <- merge(x = df, y = age[,c(1,53,56)], by = "COD7D", all.x = TRUE)

# export file
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
write.csv2(df, file ="./CityICSAP7.csv")

# read file
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
df <- read.csv2("./CityICSAP7.csv")
distance <- read.csv2("./DistCapitals.csv")

# merge data sets
df <- merge(x = df, y = distance[,c(2,32)], by = "COD7D", all.x = TRUE)

# read file
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
DistHighPop <- read.csv2("./DistHighPop.csv")

# merge data sets
df <- merge(x = df, y = DistHighPop[,c(2,138)], by = "COD7D", all.x = TRUE)

# export file
wd4 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd4)
getwd()
write.csv2(df, file ="./CityICSAP8.csv")

# multiple linear regression
fit <- lm(data = df, ICSAPprop ~ URBANAPerc + MULHERPerc + IDHM.RENDA + 
            IDHM.SCHOOL + IDHM.LONGEVIDADE + ESFmedian + log(POPULACAO) + 
            RedeGeralAbast + RedeGeralEsgot + BRANCAPerc + PRETAPerc + 
            AMARELAPerc + PARDAPerc + INDIGENAPerc + COR_SDPerc + 
            log(QT_SUS_HAB + 1) + YoungOld1 + LessDistant2)
summary(fit)
windows()
par(mfrow=c(2,2))
plot(fit)
par(mfrow=c(1,1))
hist(fit$residuals)





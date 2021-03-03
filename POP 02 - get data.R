
# observation
# source
# estimativas populacionais: 
# 2001 a 2020 (exceto 2007 e 2010): 
# https://sidra.ibge.gov.br/tabela/6579
# 1992 a 1999 (exceto 1996): 
# https://www.ibge.gov.br/estatisticas/sociais/populacao/9103-estimativas-de-populacao.html?=&t=downloads
# censos demográficos: 
# 1991, 2000, 2010: https://sidra.ibge.gov.br/tabela/200
# contagem populacionais:
# 1996: https://sidra.ibge.gov.br/tabela/475
# 2007: https://sidra.ibge.gov.br/tabela/793

# load library
library(readxl)

# assign working directory (wd) to an object
wd <- "C:/Users/usuario/OneDrive/R/Bancos de dados/Estimativa populacional"

# set working directory
setwd(wd)

# load data
POP <- read_excel("./POP.xlsx", sheet = "dataset")

# set classes
POP$UF <- as.factor(POP$UF)
POP$COD_UF <- as.factor(POP$COD_UF)
POP$COD_MUNIC <- as.factor(POP$COD_MUNIC)
POP$MUNICIPIO <- as.factor(POP$MUNICIPIO)
POP$ANO <- as.numeric(POP$ANO)
POP$POPULACAO <- as.numeric(POP$POPULACAO)

# create variable REGIAO
SUL <- c("RS", "SC", "PR")
SUDESTE <- c("SP", "RJ", "ES", "MG")
CENTRO_OESTE <- c("MS", "MT", "GO", "DF")
NORDESTE <- c("AL", "BA", "CE", "MA", "PB", "PE", "PI", "RN", "SE")
NORTE <- c("TO", "PA", "AP", "RR", "AM", "AC", "RO")
POP$REGIAO <- ifelse(POP$UF %in% SUL, "SUL",
                     ifelse(POP$UF %in% SUDESTE, "SUDESTE",
                            ifelse(POP$UF %in% CENTRO_OESTE, "CENTRO-OESTE",
                                   ifelse(POP$UF %in% NORDESTE, "NORDESTE",
                                          ifelse(POP$UF %in% NORTE, "NORTE", NA)))))

# create variable POP_CAT_1
POP$POP_CAT_1 <- POP$POPULACAO
POP$POP_CAT_1 <- ifelse(POP$POPULACAO<=5000, "<=5mil", POP$POP_CAT_1)
POP$POP_CAT_1 <- ifelse(POP$POPULACAO>5000 & POP$POPULACAO<=10000, "5-10mil", POP$POP_CAT_1)
POP$POP_CAT_1 <- ifelse(POP$POPULACAO>10000 & POP$POPULACAO<=20000, "10-20mil", POP$POP_CAT_1)
POP$POP_CAT_1 <- ifelse(POP$POPULACAO>20000 & POP$POPULACAO<=50000, "20-50mil", POP$POP_CAT_1)
POP$POP_CAT_1 <- ifelse(POP$POPULACAO>50000 & POP$POPULACAO<=100000, "50-100mil", POP$POP_CAT_1)
POP$POP_CAT_1 <- ifelse(POP$POPULACAO>100000 & POP$POPULACAO<=500000, "100-500mil", POP$POP_CAT_1)
POP$POP_CAT_1 <- ifelse(POP$POPULACAO>500000, ">500mil", POP$POP_CAT_1)
POP$POP_CAT_1 <- factor(POP$POP_CAT_1,
                        levels = c("<=5mil","5-10mil","10-20mil","20-50mil",
                                   "50-100mil","100-500mil",">500mil"))

# create variable POP_CAT_2
POP$POP_CAT_2 <- ifelse(POP$POPULACAO<=100000, "<=100mil", ">100mil")

# plot Brasilia
windows()
library(ggplot2)
library(dplyr)
g <- ggplot(data=filter(POP, COD_MUNIC=="5300108"), aes(x=ANO, y=POPULACAO))
g + 
  geom_line() + 
  geom_point() +
  labs(title = "Estimativa Populacional - Brasília/DF",
       x = "Ano",
       y = "População") + 
  scale_x_continuous(breaks = seq(min(POP_TOTAL$ANO), max(POP_TOTAL$ANO), by = 4))

# plot Brasil
POP %>%
  group_by(ANO) %>%
  summarise(POPULACAO = sum(POPULACAO)) %>%
  ggplot(aes(x=ANO, y=POPULACAO)) + 
  geom_line() + 
  geom_point() + 
  labs(title = "Estimativa Populacional - Brasil",
       x = "Ano",
       y = "População") + 
  scale_x_continuous(breaks = seq(min(POP_TOTAL$ANO), max(POP_TOTAL$ANO), by = 4))

# plot Regiao
POP %>%
  group_by(ANO, REGIAO) %>%
  summarise(POPULACAO = sum(POPULACAO)) %>%
  ggplot(aes(x=ANO, y=POPULACAO, colour=REGIAO)) + 
  geom_line() + 
  geom_point() + 
  labs(title = "Estimativa Populacional, por Região",
       x = "Ano",
       y = "População") + 
  theme(legend.position="bottom",
        legend.title = element_blank()) + 
  scale_x_continuous(breaks = seq(min(POP_TOTAL$ANO), max(POP_TOTAL$ANO), by = 4))





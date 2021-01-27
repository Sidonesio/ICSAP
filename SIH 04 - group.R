library(tidyverse)
library(lubridate)

colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")

ColMinor <- c("SEXO", "COD_IDADE", "IDADE", "MUNIC_RES", "DT_INTER", 
             "DIAG_PRINC", "MORTE")

# ler arquivos anuais, agrupando pelas coluna "ColMinor"

# lendo 2018 e formatando o modelo do Data Frame

sih_minor_mes <- read.csv2("E:/SIH/SIH1998.csv")                 # lê o arquivo
sih_minor_mes$DT_INTER <- ymd(sih_minor_mes$DT_INTER)                # tipo Date para DT_INTER
sih_minor_mes$mes <- format.Date(sih_minor_mes$DT_INTER, '%Y-%m')    # cria a variável ano para servir de base para o agrum=pamento mensal

sih_minor_mes <- sih_minor_mes %>% 
  group_by(SEXO, COD_IDADE, IDADE, MUNIC_RES, mes, DIAG_PRINC, MORTE) %>%
  mutate(qtde = n()) %>%
  distinct(SEXO, COD_IDADE, IDADE, MUNIC_RES, mes, DIAG_PRINC, MORTE, qtde)

sih_minor_ano <- read.csv2("E:/SIH/SIH1998.csv")                 # lê o arquivo
sih_minor_ano$DT_INTER <- ymd(sih_minor_ano$DT_INTER)                # tipo Date para DT_INTER
sih_minor_ano$ano <- format.Date(sih_minor_ano$DT_INTER, '%Y')    # cria a variável ano para servir de base para o agrum=pamento mensal

sih_minor_ano <- sih_minor_ano %>% 
  group_by(SEXO, COD_IDADE, IDADE, MUNIC_RES, ano, DIAG_PRINC, MORTE) %>%
  mutate(qtde = n()) %>%
  distinct(SEXO, COD_IDADE, IDADE, MUNIC_RES, ano, DIAG_PRINC, MORTE, qtde)


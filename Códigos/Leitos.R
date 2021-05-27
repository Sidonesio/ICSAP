

################################### VARIABLES ##################################

# CNES: Número nacional do estabelecimento de saúde
# CODUFMUN: Código do município do estabelecimento UF + MUNIC (sem dígito)
# REGSAUDE: Código da região de saúde
# MICR_REG: Código da micro-região de saúde
# DISTRSAN: Código do distrito sanitário
# DISTRADM: Código do distrito administrativo
# TPGESTAO: Gestão de saúde
# PF_PJ: Indicador de pessoa: 1-Física 3-Jurídica
# CPF_CNPJ: CPF do Estabelecimento (pessoa física) OU CNPJ (pessoa jurídica)
# NIV_DEP: Grau de dependência: 1-Individual 3-Mantida
# CNPJ_MAN: CNPJ da mantenedora do Estabelecimento
# ESFERA_A: Código da esfera administrativa
# ATIVIDAD: Código da atividade de ensino
# RETENCAO: Código de retenção de tributos
# NATUREZA: Código da natureza da organização
# CLIENTEL: Código de fluxo da clientela
# TP_UNID: Tipo de unidade (Estabelecimento)
# TURNO_AT: Código de turno de atendimento
# NIV_HIER: Código do nível de hierarquia
# TERCEIRO: O estabelecimento é terceiro: 1-Sim 0-Não
# TP_LEITO: Tipo do LEITO
# CODLEITO: Especialidade do LEITO
# QT_EXIST: Quantidade de leitos existentes
# QT_CONTR: Quantidade de leitos contratados
# QT_SUS: Quantidade de leitos para o SUS
# COMPETEN: Ano e Mês de competência da informação (AAAAMM)

############################### PREPARE PACKAGES ###############################

# clean everything done before
rm(list=ls())

# packages' names
packages <- c("tidyverse", "read.dbc")

# install packages if not installed yet
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# load packages
invisible(lapply(packages, library, character.only = TRUE))

################################### GET DATA ###################################

# first data loading (all columns)
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/CNES/Leitos/"
setwd(wd1)
getwd()
ano_ref <- "10"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    LT2010 <- read.dbc(paste("./", i, sep=""))
  } 
  else {
    temp <- read.dbc(paste("./", i, sep=""))
    LT2010 <- rbind(LT2010, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading (SELECTING COLUMNS)
ano_ref <- "10"
arquivos <- data.frame(arquivos = list.files("E:/Banco de dados/Leitos/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("CNES","CODUFMUN","CPF_CNPJ","TP_UNID","TP_LEITO","CODLEITO",
             "QT_EXIST","QT_CONTR","QT_SUS","QT_NSUS","COMPETEN")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    LT2010 <- read.dbc(paste("E:/Banco de dados/Leitos/", i, sep=""))
    LT2010 <- LT2010 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("E:/Banco de dados/Leitos/", i, sep=""))
    temp <- temp %>% select(colunas)
    LT2010 <- rbind(LT2010, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
wd2 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd2)
getwd()
write.csv2(LT2010, file ="./LeitosRaw.csv")

# group and sum
LTGROUP <- LT2010 %>%
  group_by(CODUFMUN, COMPETEN) %>%
  summarise(QT_EXIST = sum(QT_EXIST),
            QT_CONTR = sum(QT_CONTR),
            QT_SUS = sum(QT_SUS),
            QT_NSUS = sum(QT_NSUS)) %>%
  group_by(CODUFMUN) %>%
  summarise(QT_EXIST = median(QT_EXIST),
            QT_CONTR = median(QT_CONTR),
            QT_SUS = median(QT_SUS),
            QT_NSUS = median(QT_NSUS))

# change column name
colnames(LTGROUP)[1] <- "COD6D"

# extract data
wd2 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd2)
getwd()
write.csv2(LTGROUP, file ="./LeitosCity.csv")






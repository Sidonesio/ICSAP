
############################### PREPARE PACKAGES ###############################

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

# first data loading (ALL COLUMNS)
ano_ref <- "10"
arquivos <- data.frame(arquivos = list.files("E:/Banco de dados/Leitos/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    LT2010 <- read.dbc(paste("E:/Banco de dados/Leitos/", i, sep=""))
  } 
  else {
    temp <- read.dbc(paste("E:/Banco de dados/Leitos/", i, sep=""))
    LT2010 <- rbind(LT2010, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
wd <- "C:/Users/usuario/OneDrive/R/Bancos de dados/CNES/Leitos"
setwd(wd)
write.csv2(LT2010, file ="./LEITOS2010.csv")

# group and sum
LTGROUP <- LT2010 %>%
  select(CODUFMUN, QT_EXIST, QT_CONTR, QT_SUS, QT_NSUS) %>%
  group_by(CODUFMUN) %>%
  summarise(QT_EXIST = sum(QT_EXIST),
            QT_CONTR = sum(QT_CONTR),
            QT_SUS = sum(QT_SUS),
            QT_NSUS = sum(QT_NSUS))

# change column name
colnames(LTGROUP)[1] <- "COD_MUNIC2"

# extract data
wd <- "C:/Users/usuario/OneDrive/R/Bancos de dados/CNES/Leitos"
setwd(wd)
write.csv2(LTGROUP, file ="./LTGROUP.csv")






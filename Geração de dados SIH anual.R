library(tidyverse)
library(read.dbc)

ano_ref <- "10"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/Dados originais - SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX"   )
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    sih_2010 <- read.dbc(paste("./banco de dados/Dados originais - sih/", i, sep=""))
    sih_2010 <- sih_2010 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./banco de dados/Dados originais - sih/", i, sep=""))
    temp <- temp %>% select(colunas)
    sih_2010 <- rbind(sih_2010, temp)
  }
  print(i)
  cont=cont+1
}


nrow(sih_2010)

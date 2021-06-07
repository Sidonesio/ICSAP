# Rolf Regehr
# 29/05/2021
# Ler os dados de Profissionais da saúde em 2010
# Fonte: ftp://ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/Dados/PF/ (acessado em 29/05/2021)

library(read.dbc)
library(tidyverse)
library(foreign)

arquivos <- list.files("E:/CNES-PF/")

arquivos <- paste("E:/CNES-PF/", arquivos, sep="")
cnes_pf <- read.dbc(arquivos[1])
cnes_pf <- cnes_pf %>% group_by(CODUFMUN, CBO, COMPETEN)%>% summarise(qtde=n())

for (i in 2:324) {
  temp <- read.dbc(arquivos[i])
  temp <- temp %>% group_by(CODUFMUN, CBO, COMPETEN)%>% summarise(qtde=n())
  cnes_pf <- rbind(cnes_pf, temp)
  print(paste(i, " - ", arquivos[i]))
  
}
 
cnes_pf_ajustado_mediana <- cnes_pf %>% group_by(CODUFMUN, CBO) %>%
  summarise(mediana = median(qtde))


cod_cbo <- read.dbf("D:/OneDrive - Senado Federal/Projetos R/icsap/CNES - PF/TAB_DBF/CBO_02.dbf")

 
#extrair médicos generalistas

medicos_generalistas <- c("225124", "225125", "225130", "225140", "225142",
                          "225170", "225180", "2231F7", "2231F8", "223115",
                          "223116", "223118", "223129", "223131")

cnes_pf_medicos_generalistas <- cnes_pf_ajustado_mediana %>% filter(CBO %in% medicos_generalistas) %>%
  group_by(CODUFMUN) %>% summarise(qtde=sum(mediana))


write.csv2(cnes_pf_medicos_generalistas, "medicos.csv")

#extrair profissionais da enfermagem: enferimeiros, técnicos de enfermagem e auxiliares de enfermagem

prof_enfermagem <- str_subset(cod_cbo$DS_REGRA, pattern = regex("enferm", ignore_case = T))
prof_enfermagem <- prof_enfermagem[c(1:16, 21:30)]
prof_enfermagem <- cod_cbo %>% filter(DS_REGRA %in% prof_enfermagem) %>%
  distinct(CHAVE)
prof_enfermagem <- as.character(prof_enfermagem$CHAVE)

cnes_pf_prof_enfermagem <- cnes_pf_ajustado_mediana %>% filter(CBO %in% prof_enfermagem) %>%
  group_by(CODUFMUN) %>% summarise(qtde=sum(mediana))


write.csv2(cnes_pf_prof_enfermagem, "prof_enfermagem.csv")


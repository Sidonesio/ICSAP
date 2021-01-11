library(tidyverse)

library(read.dbc)

teste <- read.dbc(arq[1])
rm(teste)
arq = list.files("D:/OneDrive - Senado Federal/ICSAP/SIH/Fonte")

setwd("D:/OneDrive - Senado Federal/ICSAP/SIH/Fonte")

cont = 0
colunas <- c("UF_ZI", "MUNIC_RES", "NASC" , "SEXO", "UTI_MES_TO" ,"UTI_INT_TO", 
             "QT_DIARIAS", "DIAG_PRINC", "DIAG_SECUN", "DIAS_PERM", "MORTE",
             "RACA_COR"  , "DIAGSEC1",  "DIAGSEC2",   "DIAGSEC3",   "DIAGSEC4",  
             "DIAGSEC5",   "DIAGSEC6",   "DIAGSEC7",   "DIAGSEC8",   "DIAGSEC9")

for (i in arq) {
  
  if (cont == 0) {
    
    atend_sih = subset(read.dbc(i), select =colunas)
    
  } 
  else {
    atend_sih = rbind(atend_sih, subset(read.dbc(i), select = colunas))
    atend_sih = atend_sih[!is.na(atend_sih$DIAS_PERM),]
  }

  
  
  print(i)
  cont = cont+1
  print(cont)
  print(length(atend_sih$DIAS_PERM))
}




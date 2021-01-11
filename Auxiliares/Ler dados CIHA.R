library(tidyverse)

library(read.dbc)

teste <- read.dbc(arq[1])

arq = list.files("D:/OneDrive - Senado Federal/ICSAP/CIHA/Fonte")

setwd("D:/OneDrive - Senado Federal/ICSAP/CIHA/Fonte")

cont = 0

for (i in arq) {
  
  if (cont == 0) {
    
    atend_ciha = subset(read.dbc(i), select = c('MUNIC_RES', 'NASC', 'SEXO',
                                                'UTI_INT_TO', 'DT_ATEND', 'DIAG_PRINC', 
                                                'DIAG_SECUN', 'MUNIC_MOV', 'DIAS_PERM',
                                                'MORTE'))
    
  } 
  else {
    atend_ciha = rbind(atend_ciha, subset(read.dbc(i), select = c('MUNIC_RES', 'NASC', 'SEXO',
                                                                  'UTI_INT_TO', 'DT_ATEND', 'DIAG_PRINC', 
                                                                  'DIAG_SECUN', 'MUNIC_MOV', 'DIAS_PERM',
                                                                  'MORTE')))
    atend_ciha = atend_ciha[!is.na(atend_ciha$DIAS_PERM),]
  }
  
  
  print(i)
  cont = cont+1
  print(cont)
  print(length(atend_ciha$DIAS_PERM))
}

atend_ciha %>% filter(DIAS_PERM == "0") %>% length()

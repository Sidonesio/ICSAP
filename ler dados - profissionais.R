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

# Lista de todos os profissionais

profissionais <- cnes_pf %>% distinct(CBO) %>% select(CBO)
profissionais$CODUFMUN = NULL
profissionais = unique(profissionais$CBO)
profissionais <- as.data.frame(profissionais)
profissionais <- left_join(profissionais, cod_cbo, by = c("profissionais" = "CHAVE"))
write.csv2(profissionais, "todos_profissionais.csv")


########## Agrupamento proposto por Sidney

medicos_todos <- str_subset(cod_cbo$DS_REGRA, pattern = regex("médic", ignore_case = T))
medicos_todos <- medicos_todos[c(1:64, 69:135, 140)]

medicos_g1 <- cod_cbo %>% filter(DS_REGRA %in% medicos_todos) %>% distinct(CHAVE) # 1) quantidade total de médicos
medicos_g1 <- medicos_g1$CHAVE
medicos_g1 <- cnes_pf_ajustado_mediana %>% filter(CBO %in% medicos_g1) %>%
  group_by(CODUFMUN) %>% summarise(qtde=sum(mediana))

### Segundo grupo: 2) quantidade de médicos cuja formação é mais voltada para a atenção primária 
### (eu colocaria os seguintes apenas: médico em medicina preventiva e social; médico sanitarista; 
### médico em medicina de família e comunidade; médico generalista; médico de saúde da família; 
### nem colocaria o médico clínico, porque praticamente todo médico é clínico, eu acho que poluiria 
### um pouco a variável inserir o médico clínico);

medicos_g2 <- c("2231F8", "223156", "223116", "2231F7", "223129")
medicos_g2 <- cnes_pf_ajustado_mediana %>% filter(CBO %in% medicos_g2) %>%
  group_by(CODUFMUN) %>% summarise(qtde=sum(mediana))

cidades <- as.data.frame(unique(popCities$COD6D))
names(cidades)[1] = "CODUFMUN"
cidades$CODUFMUN = as.character(cidades$CODUFMUN)

medicos_g3 <- left_join(cidades, medicos_g1, by = "CODUFMUN")
names(medicos_g3)[2] = "medicos_g1"
medicos_g3 <- left_join(medicos_g3, medicos_g2, by = "CODUFMUN")
names(medicos_g3)[3] = "medicos_g2"
medicos_g3$medicos_g3 <- medicos_g3$medicos_g1/medicos_g3$medicos_g2
write.csv2(medicos_g3, "médicos_sidney.csv")

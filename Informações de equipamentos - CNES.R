# Rolf Regehr
# 12/05/2021
# ler e "arrumar" os dados de equipamentos hospitalares disponíveis em:
# ftp://ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/Dados/EQ/

library(xlsx)
library(read.dbc)
library(tidyverse)

arquivos_eq <- list.files("D:/OneDrive/Projetos R/Dados Públicos/Equipamentos/")

equip <- read.dbc(paste("D:/OneDrive/Projetos R/Dados Públicos/Equipamentos/", arquivos_eq[1], sep=""))

for (i in 2:324) {
  temp <- read.dbc(paste("D:/OneDrive/Projetos R/Dados Públicos/Equipamentos/", arquivos_eq[i], sep=""))
  equip <- rbind(equip, temp)
  print(i)
  print(arquivos_eq[i])
}


equip_investigacao <- equip %>% 
  filter(COMPETEN == "201001") %>%
  group_by(TIPEQUIP, CODEQUIP) %>%
  summarise(total = sum(QT_USO))
write.csv2(equip_investigacao, "equip_investigacao.csv")


# Arrumando as variáveis
# os códigos das tabelas não batiam com a realidade
# foi necessário fazer uma engenharia reversa a partir do total de equipamentos em um mes específico
# http://tabnet.datasus.gov.br/cgi/deftohtm.exe?cnes/cnv/equipobr.def

equip$equipamento = case_when(
  equip$CODEQUIP == "01" ~ "GAMA CAMARA",
  equip$CODEQUIP == "02" ~ "MAMOGRAFO COM COMANDO SIMPLES",
  equip$CODEQUIP == "03" ~ "MAMOGRAFO COM ESTEREOTAXIA",
  equip$CODEQUIP == "04" ~ "RAIO X ATE 100 MA",
  equip$CODEQUIP == "05" ~ "RAIO X DE 100 A 500 MA",
  equip$CODEQUIP == "06" ~ "RAIO X MAIS DE 500MA",
  equip$CODEQUIP == "07" ~ "RAIO X DENTARIO",
  equip$CODEQUIP == "08" ~ "RAIO X COM FLUOROSCOPIA",
  equip$CODEQUIP == "09" ~ "RAIO X PARA DENSITOMETRIA OSSEA",
  equip$CODEQUIP == "10" ~ "RAIO X PARA HEMODINAMICA",
  equip$CODEQUIP == "11" ~ "TOMÓGRAFO COMPUTADORIZADO",
  equip$CODEQUIP == "12" ~ "RESSONANCIA MAGNETICA",
  equip$CODEQUIP == "13" ~ "ULTRASSOM DOPPLER COLORIDO",
  equip$CODEQUIP == "14" ~ "ULTRASSOM ECOGRAFO",
  equip$CODEQUIP == "15" ~ "ULTRASSOM CONVENCIONAL",
  equip$CODEQUIP == "21" ~ "CONTROLE AMBIENTAL/AR-CONDICIONADO CENTRAL",
  equip$CODEQUIP == "22" ~ "GRUPO GERADOR",
  equip$CODEQUIP == "23" ~ "USINA DE OXIGENIO",
  equip$CODEQUIP == "31" ~ "ENDOSCOPIO DAS VIAS RESPIRATORIAS",
  equip$CODEQUIP == "32" ~ "ENDOSCOPIO DAS VIAS URINARIAS",
  equip$CODEQUIP == "33" ~ "ENDOSCOPIO DIGESTIVO",
  equip$CODEQUIP == "34" ~ "EQUIPAMENTOS PARA OPTOMETRIA",
  equip$CODEQUIP == "35" ~ "LAPAROSCOPIO/VÍDEO",
  equip$CODEQUIP == "36" ~ "MICROSCOPIO CIRURGICO",
  equip$CODEQUIP == "41" ~ "ELETROCARDIOGRAFO",
  equip$CODEQUIP == "42" ~ "ELETROENCEFALOGRAFO",
  equip$CODEQUIP == "51" ~ "BOMBA/BALAO INTRA-AORTICO",
  equip$CODEQUIP == "52" ~ "BOMBA DE INFUSAO",
  equip$CODEQUIP == "53" ~ "BERÇO AQUECIDO",
  equip$CODEQUIP == "54" ~ "BILIRRUBINOMETRO",
  equip$CODEQUIP == "55" ~ "DEBITOMETRO",
  equip$CODEQUIP == "56" ~ "DESFIBRILADOR",
  equip$CODEQUIP == "57" ~ "EQUIPAMENTO DE FOTOTERAPIA",
  equip$CODEQUIP == "58" ~ "INCUBADORA",
  equip$CODEQUIP == "59" ~ "MARCAPASSO TEMPORARIO",
  equip$CODEQUIP == "60" ~ "MONITOR DE ECG",
  equip$CODEQUIP == "61" ~ "MONITOR DE PRESSAO INVASIVO",
  equip$CODEQUIP == "62" ~ "MONITOR DE PRESSAO NAO-INVASIVO",
  equip$CODEQUIP == "63" ~ "REANIMADOR PULMONAR/AMBU",
  equip$CODEQUIP == "64" ~ "RESPIRADOR/VENTILADOR",
  equip$CODEQUIP == "71" ~ "APARELHO DE DIATERMIA POR ULTRASSOM/ONDAS CURTAS",
  equip$CODEQUIP == "72" ~ "APARELHO DE ELETROESTIMULACAO",
  equip$CODEQUIP == "73" ~ "BOMBA DE INFUSAO DE HEMODERIVADOS",
  equip$CODEQUIP == "74" ~ "EQUIPAMENTOS DE AFERESE",
  equip$CODEQUIP == "75" ~ "EQUIPAMENTO PARA AUDIOMETRIA",
  equip$CODEQUIP == "76" ~ "EQUIPAMENTO DE CIRCULACAO EXTRACORPOREA",
  equip$CODEQUIP == "77" ~ "EQUIPAMENTO PARA HEMODIALISE",
  equip$CODEQUIP == "78" ~ "FORNO DE BIER",
  equip$CODEQUIP == "80" ~ "EQUIPO ODONTOLOGICO",
  equip$CODEQUIP == "81" ~ "COMPRESSOR ODONTOLOGICO",
  equip$CODEQUIP == "82" ~ "FOTOPOLIMERIZADOR",
  equip$CODEQUIP == "83" ~ "CANETA DE ALTA ROTACAO",
  equip$CODEQUIP == "84" ~ "CANETA DE BAIXA ROTACAO",
  equip$CODEQUIP == "85" ~ "AMALGAMADOR",
  equip$CODEQUIP == "86" ~ "APARELHO DE PROFILAXIA C/ JATO DE BICARBONATO"
)


equip$tipo_equipamento <- case_when(
equip$TIPEQUIP == "1" ~ "Equipamentos de Diagnostico por Imagem",
equip$TIPEQUIP == "2" ~ "Equipamentos de Infra-Estrutura",
equip$TIPEQUIP == "3" ~ "Equipamentos por Metodos Opticos",
equip$TIPEQUIP == "4" ~ "Equipamentos por Metodos Graficos",
equip$TIPEQUIP == "5" ~ "Equipamentos para Manutencao da Vida",
equip$TIPEQUIP == "6" ~ "Outros Equipamentos",
equip$TIPEQUIP == "7" ~ "Equipamentos de Odontologia"
)


equip$mes_numerico <- as.numeric(substr(equip$COMPETEN, 5,6))
unique(equip$mes_numerico)

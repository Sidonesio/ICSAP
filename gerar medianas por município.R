# Rolf Regehr
# 23/05/2021
# criar o banco de dados por tipo de equipamento e município

library(xlsx)
library(read.dbc)
library(tidyverse)
library(gt)
library(gapminder)

BD_equipamentos <- equip %>%
  group_by(CODUFMUN, tipo_equipamento, COMPETEN) %>%
  summarise(qtde = sum(QT_USO)) %>%
  group_by(CODUFMUN, tipo_equipamento) %>%
  summarise(mediana = median(qtde)) %>%
  spread(tipo_equipamento, mediana) 

BD_equipamentos <- as.data.frame(BD_equipamentos)

for (i in 2:8) {
  BD_equipamentos[, i] <- coalesce(BD_equipamentos[, i], 0)
}

BD_equipamentos$total <- BD_equipamentos$`Equipamentos de Diagnostico por Imagem`+
  BD_equipamentos$`Equipamentos de Infra-Estrutura`+
  BD_equipamentos$`Equipamentos de Odontologia`+
  BD_equipamentos$`Equipamentos para Manutencao da Vida`+
  BD_equipamentos$`Equipamentos por Metodos Graficos`+
  BD_equipamentos$`Equipamentos por Metodos Opticos`+
  BD_equipamentos$`Outros Equipamentos`
  
write.csv2(BD_equipamentos, "BD_equipamentos.csv")

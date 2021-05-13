# Rolf Regehr
# 12/05/2021
# primeiros gráficos para avaliar o perfil dos equipamentos

library(xlsx)
library(read.dbc)
library(tidyverse)

# Número de equipamentos totais ao longo do ano (por tipo)

equip %>% group_by(tipo_equipamento, mes_numerico) %>%
  summarise(qtde=sum(QT_USO)) %>%
  ggplot(aes(x=mes_numerico, y=qtde, color=tipo_equipamento)) +
  geom_line(size=1)+
  facet_wrap(~tipo_equipamento)+
  scale_x_continuous(breaks = seq(1, 12, by=1))

# que valor usar? média do ano, valor em algum mês de referência?
# usar o indicador de quantidade (por tipo ou todos?)

#média
df_equip <- equip %>% group_by(CODUFMUN, tipo_equipamento) %>%
  summarise(n=sum(QT_USO/12))

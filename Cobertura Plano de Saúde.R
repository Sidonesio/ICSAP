# FONTE: http://www.ans.gov.br/anstabnet/cgi-bin/tabnet?dados/tabnet_02.def
# Rolf Regehr 
# 11 de junho de 2021
# inclusão da tabela de número de beneficiários dos planos de saúde

library(readxl)

plano_beneficiarios <- read_xlsx("ans_beneficiarios.xlsx", sheet = "Planilha1")
plano_beneficiarios <- plano_beneficiarios %>% mutate_all(replace_na, 0)
popCities <- popCities %>% filter(ANO == 2010) %>% select(COD6D)
popCities$COD6D <- as.character(popCities$COD6D)
plano_beneficiarios <- left_join(popCities, plano_beneficiarios, by = c("COD6D" = "cod_mun")) %>%
  mutate_all(replace_na, 0)

write.csv2(plano_beneficiarios, "./Arquivos exportados/plano_beneficiarios.csv")

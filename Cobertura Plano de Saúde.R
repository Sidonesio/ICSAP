# FONTE: http://www.ans.gov.br/anstabnet/cgi-bin/tabnet?dados/tabnet_02.def
# Rolf Regehr
# 11 de junho de 2021
# inclusão da tabela de número de beneficiários dos planos de saúde

library(readxl)

plano_beneficiarios <- read_xlsx("ans_beneficiarios.xlsx", sheet = "Planilha1")
write.csv2(plano_beneficiarios, "./Arquivos exportados/plano_beneficiarios.csv")

d5 <- read.csv("./orcamento/2005.csv")
d6 <- read.csv("./orcamento/2006.csv")
d7 <- read.csv2("./orcamento/2007.csv")
d8 <- read.csv("./orcamento/2008.csv")
d9 <- read.csv("./orcamento/2009.csv")
 
d5$ano <- 2005
d6$ano <- 2006
d7$ano <- 2007
d8$ano <- 2008
d9$ano <- 2009

d6$Despesa.Executada..Subelemento. = NULL
d7$Despesa.Executada..Subelemento. = NULL
d8$Despesa.Executada..Subelemento. = NULL
d9$Despesa.Executada..Subelemento. = NULL

names(d5) <- c("cod_mun", "municipio", "funcao", "subfuncao", "despesa", "ano")
names(d6) <- c("cod_mun", "municipio", "funcao", "subfuncao", "despesa", "ano")
names(d7) <- c("cod_mun", "municipio", "funcao", "subfuncao", "despesa", "ano")
names(d8) <- c("cod_mun", "municipio", "funcao", "subfuncao", "despesa", "ano")
names(d9) <- c("cod_mun", "municipio", "funcao", "subfuncao", "despesa", "ano")

despesas_saude <- rbind(d5, d6, d7, d8, d9)
despesas_saude$despesa <- as.numeric(despesas_saude$despesa)

library(tidyverse)
despesas_saude <- despesas_saude %>% group_by(cod_mun, municipio, subfuncao) %>%
  summarise(despesa = mean(despesa))

despesas_saude <- despesas_saude %>% spread(subfuncao, despesa) %>% 
  select(cod_mun, `122 - ADMINISTRAÃ‡ÃƒO GERAL`, `301 - ATENÃ‡ÃƒO BÃSICA`, `302 - ASSISTÃŠNCIA HOSPITALAR E AMBULATORIAL`,
         `303 - SUPORTE PROFILÃTICO E TERAPÃŠUTICO`, `305 - VIGILÃ‚NCIA EPIDEMIOLÃ“GICA`,
         `306 - ALIMENTAÃ‡ÃƒO E NUTRIÃ‡ÃƒO`, `331 - PROTEÃ‡ÃƒO E BENEFÃCIOS AO TRABALHADOR`,
         `365 - EDUCAÃ‡ÃƒO INFANTIL`, `422 - DIREITOS INDIVIDUAIS, COLETIVOS E DIFUSOS`, 
         `511 - SANEAMENTO BÃSICO RURAL`, `512 - SANEAMENTO BÃSICO URBANO`, `572 - DESENVOLVIMENTO TECNOLÃ“GICO E ENGENHARIA`,
         `846 - OUTROS ENCARGOS ESPECIAIS`)


names(despesas_saude) <- c("municipio", "cod_mun", "adm", "atencao_basica", "assist_hosp", "suporte", 
                           "vigil_epidem", "alimentacao","trabalhador", "educ_infantil",
                           "direitos", "saneamento_rural", "saneamento_urb", "desenv", "outros")

despesas_saude <- despesas_saude %>% mutate_all(coalesce, 0)
despesas_saude$total <- apply(despesas_saude[,3:15], 1, sum)
despesas_saude$municipio = NULL
despesas_saude$cod_mun <- substr(despesas_saude$cod_mun, 1, 6)
despesas_saude_2 <- left_join(popCities, despesas_saude, by = c("COD6D" = "cod_mun"))
despesas_saude_2 <- despesas_saude_2 %>% mutate_all(replace_na, 0)

write.csv2(despesas_saude_2, "./Arquivos exportados/gastos_saúde.csv")

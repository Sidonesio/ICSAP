library(lubridate)
library(tidyverse)

# Alteração de DT_INTER para formato "date"
SIH_sexo$DT_INTER <- ymd(SIH_sexo$DT_INTER)
#alteração de icsap para factor
SIH_sexo$icsap = as.factor(SIH_sexo$icsap)
#alteração sexo para fator
SIH_sexo$SEXO <- ifelse(SIH_sexo$SEXO==1, "HOMEM", ifelse(SIH_sexo$SEXO==3, "MULHER", "NI"))
SIH_sexo$SEXO <- as.factor(SIH_sexo$SEXO)




# ICSAP por dia e por mes 1998 a 2019

            # por dia
            SIH_sexo %>% filter(icsap ==1 & DT_INTER >= '1998-01-01') %>%
              group_by(DT_INTER) %>%
              mutate(num_inter = sum(qtde)) %>%
              distinct(DT_INTER, num_inter) %>%
              ggplot(aes(DT_INTER, num_inter))+
              geom_line()
            
            
            # por mes
            graf1 <- SIH_sexo %>% filter(icsap ==1 & DT_INTER >= '1999-01-01' & DT_INTER <= '2018-12-31') %>%
              mutate(mes=floor_date(DT_INTER, "month")) %>%
              group_by(mes, SEXO) %>%
              mutate(num_inter = sum(qtde)) %>%
              distinct(mes, SEXO, num_inter) %>%
              ggplot(aes(mes, num_inter, color=SEXO))+
              geom_line()



# grafico ICSAP por sexo
            #por dia
            SIH_sexo %>% filter((SEXO=="HOMEM" | SEXO=="MULHER") & icsap ==1 & DT_INTER >= "1998-01-01") %>%
              ggplot(aes(DT_INTER, qtde, color = SEXO)) +
              geom_line()+
              geom_point()
            
            #por mes
            SIH_sexo %>% filter((SEXO=="HOMEM" | SEXO=="MULHER")  & icsap == 1 & DT_INTER >= "1998-01-01") %>%
              mutate(mes = floor_date(DT_INTER, "month")) %>%
              group_by(mes, SEXO, num_inter = sum(qtde)) %>%
              distinct(SEXO, mes, num_inter) %>%
              ggplot(aes(mes, num_inter, color = SEXO)) +
              geom_line(size = 1)+
              facet_grid(~SEXO)

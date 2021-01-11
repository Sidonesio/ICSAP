# carregar pacotes
library(esquisse) # gerar graficos
library(ggplot2) # gerar graficos
library(geobr) #dados de georreferenciamento
library(sf) 
library(tidyverse) # mainpular dados
library(RColorBrewer) # colorir
library(ggspatial) # graficos topograficos

# importar banco de dados
municipio <- read_municipality(year = 2019)
estado <- read_state(year = 2019)

# selecionar estados
uf <- filter(estado, abbrev_state %in% c("BA", "DF", "ES", "RJ", "SP", "GO", "MS"))

# plotar grafico
windows()
municipio %>% filter(abbrev_state =="MG") %>%
  ggplot(aes())+
  geom_sf(aes(fill = code_muni, col=code_muni))+
  geom_sf(data = uf, fill = "transparent", col = "red")+
  scale_color_gradientn(colours = brewer.pal(9,"Spectral"))+
  scale_fill_gradientn(colours = brewer.pal(9,"Spectral"))+
  theme_minimal()+
  annotation_scale(location ='br')+
  annotation_north_arrow(location='tl', 
                         style = north_arrow_nautical(),
                         width = unit(3, 'cm'),
                         height = unit(3, 'cm'))+
  labs(title = "MG")

# selecionar apenas municipios de MG
muni_MG <- municipio %>% filter(abbrev_state =="MG")

dados <- rnorm(853,mean=10,sd=10) #geração de dados aleatórios
muni_MG$dados = dados #inclusao dos dados gerados no dataframe

# plotar grafico
muni_MG %>%
  ggplot(aes())+
  geom_sf(aes(fill = dados, col=dados))+
  geom_sf(data = uf, fill = "transparent", col = "red")+
  scale_color_gradientn(colours = brewer.pal(9,"Spectral"))+
  scale_fill_gradientn(colours = brewer.pal(9,"Spectral"))+
  theme_minimal()+
  annotation_scale(location ='br')+
  annotation_north_arrow(location='tl', 
                         style = north_arrow_nautical(),
                         width = unit(3, 'cm'),
                         height = unit(3, 'cm'))+
  labs(title = "MG")

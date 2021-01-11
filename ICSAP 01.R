
# download dataset
library("readxl")
AtlasBr <- read_excel("./Banco de dados/Atlas Desenvolvimento Humano/Registro Administrativo Total 2012 2017.xlsx",
                      sheet = "BRASIL", col_names = TRUE)
AtlasRegiao <- read_excel("./Banco de dados/Atlas Desenvolvimento Humano/Registro Administrativo Total 2012 2017.xlsx",
                      sheet = "REGIÃO", col_names = TRUE)
AtlasRM <- read_excel("./Banco de dados/Atlas Desenvolvimento Humano/Registro Administrativo Total 2012 2017.xlsx",
                      sheet = "REGIÃO_METROPOLITANA", col_names = TRUE)
AtlasUF <- read_excel("./Banco de dados/Atlas Desenvolvimento Humano/Registro Administrativo Total 2012 2017.xlsx",
                      sheet = "UNIDADE_DA_FEDERAÇÃO", col_names = TRUE)
AtlasMun <- read_excel("./Banco de dados/Atlas Desenvolvimento Humano/Registro Administrativo Total 2012 2017.xlsx",
                      sheet = "MUNICÍPIO", col_names = TRUE)

# graph Brasil - barplot
library(ggplot2)
windows()
g <- ggplot(data = AtlasBr, aes(x = as.factor(ANO), y = PINTERSAP))
g + 
  geom_bar(stat = "identity", width = .7, fill = "steelblue") + 
  geom_text(aes(label = round(PINTERSAP, 1)), vjust=-.3, size=4.75) + 
  labs(title = "Internações por Condições Sensíveis à Atenção Primária (%) - Brasil",
       x = "Ano",
       y = "% Internações por Condições Sensíveis à Atenção Primária") + 
  theme(plot.title = element_text(size = 14),
        axis.title.y = element_text(size = 13.5),
        axis.title.x = element_text(size = 13.5),
        axis.text = element_text(size = 13.5, colour = "black"),
        axis.text.y=element_blank())
 
# graph Brasil - line
g <- ggplot(data = AtlasBr, aes(x = as.numeric(ANO), y = PINTERSAP, group = 1))
g + 
  geom_line(color = "blue", size = 1, linetype = "dashed") + 
  geom_point(shape = 23, size = 3, fill = "blue", color = "black") + 
  ylim(0, 50) + 
  labs(title = "Internações por Condições Sensíveis à Atenção Primária (%) - Brasil",
       x = "Ano",
       y = "% Internações por Condições Sensíveis à Atenção Primária") + 
  theme(plot.title = element_text(size = 13.49),
        axis.title.y = element_text(size = 13),
        axis.title.x = element_text(size = 13),
        axis.text = element_text(size = 11, colour = "black"))

# graph Regiao - line
g <- ggplot(data = AtlasRegiao, aes(x = as.numeric(ANO), y = PINTERSAP, group = NOME))
g + 
  geom_point(aes(color = NOME, fill = NOME), shape = 23, size = 3) + 
  geom_line(aes(color = NOME), linetype = "dashed", size = 1) + 
  ylim(17.5, 30) + 
  labs(title = "Internações por Condições Sensíveis à Atenção Primária (%) - Brasil",
       x = "Ano",
       y = "% Internações por Condições Sensíveis à Atenção Primária") + 
  theme(plot.title = element_text(size = 13.49),
        axis.title.y = element_text(size = 13),
        axis.title.x = element_text(size = 13),
        axis.text = element_text(size = 13, colour = "black"))

# graph UF - barplot
library(dplyr)
g <- ggplot(data = filter(AtlasUF, ANO==2017), aes(x = reorder(NOME, PINTERSAP), y = PINTERSAP))
g + 
  geom_bar(stat = "identity", width = .7, fill = "steelblue") + 
  coord_flip() + 
  labs(title = "Internações por Condições Sensíveis à Atenção Primária (%) - 2017",
       x = "Unidades da Federação (UF)",
       y = "% Internações por Condições Sensíveis à Atenção Primária") + 
  theme(axis.text = element_text(colour = "black"),
        axis.text.x = element_blank(),
        plot.title = element_text(size = 12)) + 
  geom_text(aes(label = round(PINTERSAP, 1)), hjust=1.5, vjust = 0.4, colour = "white", size = 4) 

# graph RM - barplot
library(dplyr)
g <- ggplot(data = filter(AtlasRM, ANO==2017), aes(x = reorder(NOME, PINTERSAP), y = PINTERSAP))
g + 
  geom_bar(stat = "identity", width = .7, fill = "steelblue") + 
  coord_flip() + 
  labs(title = "ICSAP (%) por Região Metropolitana - 2017", 
       x = "",
       y = "% ICSAP") + 
  theme(axis.text = element_text(colour = "black", size = 10),
        axis.text.x = element_blank(),
        plot.title = element_text(size = 12)) + 
  geom_text(aes(label = round(PINTERSAP, 1)), hjust=1.5, vjust = 0.4, colour = "white", size = 4) 

# summary ICSAP by city
tapply(AtlasMun$PINTERSAP, AtlasMun$ANO, summary)

# graph City - density
library(dplyr)
g <- ggplot(data = AtlasMun, aes(x = PINTERSAP, color=factor(ANO)))
g + 
  geom_density(size = 1) + 
  labs(title = "Distribuição de Frequência das ICSAP (%) nos municípios", 
       x = "ICSAP (%)",
       y = "Densidade",
       colour = "Ano")
# conclusion: right-skewed

# Shapiro-Wilk test
shapiro.test(sample(AtlasMun$PINTERSAP[AtlasMun$ANO==2017], size=5000, 
                    replace=FALSE, prob=NULL))
# conclusion: we cannot assume normality

# Q-Q plot
library(car)
qqPlot(AtlasMun$PINTERSAP[AtlasMun$ANO==2017])
library(ggpubr)
ggqqplot(AtlasMun$PINTERSAP[AtlasMun$ANO==2017])
# conclusion: distribution is not normal

# graph City - density (with transformation)
library(dplyr) # carregar pacote
library(ggplot2) # carregar pacote
windows()
g <- ggplot(data = AtlasMun, aes(x = log(PINTERSAP+10), color=factor(ANO)))
g + 
  geom_density(size = 1) + 
  labs(title = "Distribuição de Frequência das ICSAP (%) nos municípios", 
       x = "ICSAP (%)",
       y = "Densidade",
       colour = "Ano")




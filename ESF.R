
# read data set
ABBrasil <- read.table("./Banco de dados/Cobertura AB/Brasil.csv", 
                    sep = ";", quote="", header = TRUE)
ABEstados <- read.table("./Banco de dados/Cobertura AB/Estados.csv", 
                       sep = ";", quote="", header = TRUE)
ABMacro <- read.table("./Banco de dados/Cobertura AB/Macrorregião.csv", 
                        sep = ";", quote="", header = TRUE)
ABMun <- read.table("./Banco de dados/Cobertura AB/Municípios.csv", 
                    sep = ";", quote="", header = TRUE)
ABRS <- read.table("./Banco de dados/Cobertura AB/Região de Saúde.csv", 
                    sep = ";", quote="", header = TRUE)

# remove dots
library(tidyverse)
ABBrasil <- ABBrasil %>% 
  mutate_all(.fun = function(x) gsub("\\.", "", x))
ABEstados <- ABEstados %>% 
  mutate_all(.fun = function(x) gsub("\\.", "", x))
ABMacro <- ABMacro %>% 
  mutate_all(.fun = function(x) gsub("\\.", "", x))
ABMun <- ABMun %>% 
  mutate_all(.fun = function(x) gsub("\\.", "", x))

# convert commas to dots
ABBrasil$PC_COBERTURA_AB <- as.numeric(
  gsub(",", ".", gsub("\\.", "", ABBrasil$PC_COBERTURA_AB)))
ABBrasil$PC_COBERTURA_SF <- as.numeric(
  gsub(",", ".", gsub("\\.", "", ABBrasil$PC_COBERTURA_SF)))
ABEstados$PC_COBERTURA_AB <- as.numeric(
  gsub(",", ".", gsub("\\.", "", ABEstados$PC_COBERTURA_AB)))
ABEstados$PC_COBERTURA_SF <- as.numeric(
  gsub(",", ".", gsub("\\.", "", ABEstados$PC_COBERTURA_SF)))
ABMacro$PC_COBERTURA_SF <- as.numeric(
  gsub(",", ".", gsub("\\.", "", ABMacro$PC_COBERTURA_SF)))
ABMacro$PC_COBERTURA_AB <- as.numeric(
  gsub(",", ".", gsub("\\.", "", ABMacro$PC_COBERTURA_AB)))
ABMun$PC_COBERTURA_AB <- as.numeric(
  gsub(",", ".", gsub("\\.", "", ABMun$PC_COBERTURA_AB)))
ABMun$PC_COBERTURA_SF <- as.numeric(
  gsub(",", ".", gsub("\\.", "", ABMun$PC_COBERTURA_SF)))
ABMun$QT_CH_MEDICO <- as.numeric(
  gsub(",", ".", gsub("\\.", "", ABMun$QT_CH_MEDICO)))
ABMun$QT_CH_ENFERMEIRO <- as.numeric(
  gsub(",", ".", gsub("\\.", "", ABMun$QT_CH_ENFERMEIRO)))
ABMun$QT_COBERTURA_AB <- as.numeric(
  gsub(",", ".", gsub("\\.", "", ABMun$QT_COBERTURA_AB)))

# set variables as numeric
ABBrasil <- data.frame(lapply(ABBrasil, function(x) as.numeric(as.character(x))))
ABEstados[,8:16] <- sapply(ABEstados[,8:16],as.numeric)
ABMacro[,5:13] <- sapply(ABMacro[,5:13],as.numeric)
ABMun[,10:15] <- sapply(ABMun[,10:15],as.numeric)
ABMun[,18:22] <- sapply(ABMun[,18:22],as.numeric)

# introduce date
library(lubridate) # load package
ABBrasil <- cbind(data = ym(ABBrasil$NU_COMPETENCIA), ABBrasil) 
ABEstados <- cbind(data = ym(ABEstados$NU_COMPETENCIA), ABEstados)
ABMacro <- cbind(data = ym(ABMacro$NU_COMPETENCIA), ABMacro)
ABMun <- cbind(data = ym(ABMun$NU_COMPETENCIA), ABMun)

# plot graph (Brazil)
windows()
library(ggplot2)
g <- ggplot(ABBrasil, aes(data)) 
g + 
  geom_line(aes(y = PC_COBERTURA_AB, colour = "PC_COBERTURA_AB"), size=1.1) + 
  geom_line(aes(y = PC_COBERTURA_SF, colour = "PC_COBERTURA_SF"), size=1.1) + 
  scale_color_discrete(name="",
                       labels = c("Atenção Básica", "Saúde da Família")) + 
  theme(legend.position="bottom") + 
  ggtitle("Cobertura Populacional (%) de Equipes de Atenção Básica e Saúde da Família") + 
  xlab("Período") + 
  ylab("Cobertura Populacional (%)")
  
# another way of doing the same plot (Brazil)
library(dplyr)
library(reshape2)
library(ggplot2)
windows()
ABBrasil %>%
  select(data, PC_COBERTURA_AB, PC_COBERTURA_SF) %>%
  melt(id="data") %>%
  ggplot(aes(x=data, y=value, colour=variable)) + 
  geom_line(size=1.1) +
  scale_color_discrete(name="",
                       labels = c("Atenção Básica", "Saúde da Família")) + 
  theme(legend.position="bottom") + 
  ggtitle("Cobertura Populacional (%) de Equipes de Atenção Básica e Saúde da Família") + 
  xlab("Período") + 
  ylab("Cobertura Populacional (%)")

# plot graph (SF - UF - set/2019)
windows()
library(dplyr)
ggplot(data=filter(ABEstados, data=="2019-09-01"), 
       aes(x=reorder(SG_UF, PC_COBERTURA_SF), y=PC_COBERTURA_SF)) + 
  geom_bar(stat="identity", fill="steelblue") +
  coord_flip() + 
  geom_text(aes(label=PC_COBERTURA_SF, hjust=1.5, vjust = 0.4), color="white") + 
  labs(title = "Cobertura Populacional de Equipes de Saúde da Família - set/2019",
       x = "UF",
       y = "Cobertura Populacional (%)")

# plot graph (AB - UF - set/2019)
ggplot(data=filter(ABEstados, data=="2019-09-01"), 
       aes(x=reorder(SG_UF, PC_COBERTURA_AB), y=PC_COBERTURA_AB)) + 
  geom_bar(stat="identity", fill="green4") +
  coord_flip() + 
  geom_text(aes(label=PC_COBERTURA_AB, hjust=1.5, vjust = 0.4), color="white") + 
  labs(title = "Cobertura Populacional de Equipes de Atenção Básica - set/2019",
       x = "UF",
       y = "Cobertura Populacional (%)")

# plot graph Region (AB)
ggplot(data=ABMacro, aes(x=data, y=PC_COBERTURA_AB, colour=NO_REGIAO)) + 
  geom_line(size=1.1) + 
  theme(legend.position="bottom") + 
  scale_color_discrete(name="") + 
  labs(title = "Cobertura Populacional de Equipes de Atenção Básica, por Região",
       x = "Período",
       y = "Cobertura Populacional (%)")

# plot graph Region (SF)
ggplot(data=ABMacro, aes(x=data, y=PC_COBERTURA_SF, colour=NO_REGIAO)) + 
  geom_line(size=1.1) + 
  theme(legend.position="bottom") + 
  scale_color_discrete(name="") + 
  labs(title = "Cobertura Populacional de Equipes de Saúde da Família, por Região",
       x = "Período",
       y = "Cobertura Populacional (%)")

# plot histogram Cities - SF - 5 end years
target <- as.Date(c("2007-12-01", "2010-12-01", "2013-12-01", "2016-12-01", "2019-09-01"))
g <- ggplot(data=filter(ABMun, data %in% target), 
            aes(x = PC_COBERTURA_SF, colour=factor(data)))
g + 
  geom_density(size = 1) + 
  labs(title = "Distribuição de Frequência da Cobertura Populacional de ESF nos Municípios", 
       x = "Cobertura Populacional (%)",
       y = "Densidade",
       colour="NU_COMPETENCIA") + 
  theme(legend.position="bottom") + 
  scale_color_discrete(name="",
                       labels = c("Dez/07", "Dez/10", "Dez/13", "Dez/16", "Set/19"))

# summary SF Cities - 5 end years
target <- as.Date(c("2007-12-01", "2010-12-01", "2013-12-01", "2016-12-01", "2019-09-01"))
selectABMun <- filter(ABMun, data %in% target)
tapply(selectABMun$PC_COBERTURA_SF, selectABMun$data, summary)

# histogram Cities Population
g <- ggplot(data=filter(ABMun, data=="2019-09-01"), aes(x=QT_POPULACAO))
g + 
  geom_histogram() + 
  labs(title = "Distribuição de Frequência da População dos Municípios", 
       x = "População",
       y = "Quantidade de Municípios")

# histogram Cities Population (transformed)
g <- ggplot(data=filter(ABMun, data=="2019-09-01"), aes(x=log(QT_POPULACAO)))
g + 
  geom_histogram() + 
  labs(title = "Distribuição de Frequência da População dos Municípios", 
       x = "População",
       y = "Quantidade de Municípios")

# plot population x cobertura SF
ABMun %>%
  filter(data=="2019-09-01") %>%
  ggplot(aes(x=QT_POPULACAO, y=PC_COBERTURA_SF)) + 
  geom_point() + 
  labs(title = "População e Cobertura de ESF nos Municípios", 
       x = "População",
       y = "Cobertura de ESF")
  
# plot log(population) x cobertura SF
ABMun %>%
  filter(data=="2019-09-01") %>%
  ggplot(aes(x=log(QT_POPULACAO), y=PC_COBERTURA_SF)) + 
  geom_point() + 
  geom_smooth(method="lm", formula= y~x)

# correlation population x cobertura ESF
cor.test(ABMun$QT_POPULACAO, ABMun$PC_COBERTURA_SF)

# fit a linear regression
fit <- lm(PC_COBERTURA_SF ~ log(QT_POPULACAO), data=filter(ABMun, data=="2019-09-01"))
summary(fit)
par(mfrow = c(2, 2))
plot(fit)





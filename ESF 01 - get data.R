
# source
https://egestorab.saude.gov.br/paginas/acessoPublico/relatorios/relHistoricoPagamentoEsf.xhtml

wd <- "C:/Users/usuario/OneDrive/R/Bancos de dados/ESF"
setwd(wd)
ESF1998_2010 <- read.csv2("./1998 - 2010.csv", sep=";")
ESF2011_2019 <- read.csv2("./2011 - 2019.csv", sep=";")
ESF <- rbind(ESF1998_2010, ESF2011_2019)

summary(ESF$ANO)
summary(ESF$X..Cobertura)

teste <- filter(ESF, ANO==2007, MES==7, Código==5300108)


class(ESF$Código)



wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/Saneamento"
setwd(wd1)
getwd()

library(readxl)
agua <- read_excel("./saneamento.xlsx")


agua <- read_excel("./saneamento2.xlsx")
agua <- read.csv2("./saneamento2.csv")

summary(agua[,9])
summary(agua[,11])


summary(agua[,10])
summary(agua[,12])

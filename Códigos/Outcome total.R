
# clean everything done before
rm(list=ls())

# use more memory
memory.limit(9999999999)

# load packages
library(tidyverse)
library(data.table)
library(bit64)
library(ggplot2)
library(bestNormalize)

# read data
getwd()
wd1 <- "D:/SIH CSV"
setwd(wd1)
SIH2010 <- as.data.frame(fread("./SIH2010.csv"))

# number of AIHs from initial data = 11724834
nrow(SIH2010)

# subset with distinct values
df <- SIH2010 %>% 
  distinct(CEP,MUNIC_RES,NASC,SEXO,RACA_COR,DT_INTER,DIAG_PRINC,CGC_HOSP,
           MUNIC_MOV,CNES, .keep_all = TRUE)

# number of duplicated values = 316351
nrow(SIH2010) - nrow(df)

# proportion of duplicated values = 0.02698128
(nrow(SIH2010) - nrow(df)) / nrow(SIH2010)

# filter data that does not belong to 2010
df2 <- df %>%
  filter(as.numeric(DT_SAIDA) >= 20100101,
         as.numeric(DT_INTER) <= 20101231)

# number of AIHs that does not belong to 2010 = 592300
nrow(df) - nrow(df2)

# proprtion of AIHs that does not belong to 2010 = 0.05191751
(nrow(df) - nrow(df2)) / nrow(df)

# total number of removed data = 908651
nrow(SIH2010) - nrow(df2)

# total proportion of removed data = 0.07749798
(nrow(SIH2010) - nrow(df2)) / nrow(SIH2010)

# remove birth
df3 <- df2 %>%
  filter(!startsWith(as.character(df2$DIAG_PRINC), "O80"),
         !startsWith(as.character(df2$DIAG_PRINC), "O81"),
         !startsWith(as.character(df2$DIAG_PRINC), "O82"),
         !startsWith(as.character(df2$DIAG_PRINC), "O83"),
         !startsWith(as.character(df2$DIAG_PRINC), "O84"))

# create binomial variable "ICSAP"

# where CIDs has 3 characters
df3$ICSAP <- 0
df3$ICSAP <- ifelse(grepl("^A18", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A19", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A33", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A34", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A35", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A36", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A37", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A51", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A52", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A53", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A95", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^B05", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^B06", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^B16", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^B26", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^B50", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^B51", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^B52", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^B53", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^B54", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^B77", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I00", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I01", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I02", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A00", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A01", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A02", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A03", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A04", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A05", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A06", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A07", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A08", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A09", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E86", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^D50", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E40", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E41", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E42", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E43", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E44", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E45", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E46", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E50", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E51", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E52", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E53", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E54", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E55", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E56", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E57", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E58", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E59", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E60", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E61", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E62", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E63", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^E64", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^H66", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J00", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J01", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J02", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J03", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J06", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J31", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J13", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J14", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J45", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J46", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J20", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J21", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J40", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J41", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J42", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J43", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J44", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J47", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I10", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I11", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I20", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I50", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^J81", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^G45", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^G46", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I63", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I64", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I65", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I66", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I67", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^I69", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^G40", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^G41", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^N10", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^N11", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^N12", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^N30", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^N34", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A46", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^L01", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^L02", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^L03", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^L04", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^L08", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^N70", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^N71", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^N72", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^N73", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^N75", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^N76", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^K25", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^K26", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^K27", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^K28", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^A50", df3$DIAG_PRINC), 1, df3$ICSAP)
df3$ICSAP <- ifelse(grepl("^O23", df3$DIAG_PRINC), 1, df3$ICSAP)

# ICSAP 4 characters
ICSAP4c <- c("A150","A151","A152","A153","A154","A155","A156","A157","A158",
             "A159","A160","A161","A162","A163","A164","A165","A166","A167",
             "A168","A169","A170","A171","A172","A173","A174","A175","A176",
             "A177","A178","A179","G000","J153","J154","J158","J159","J181",
             "E100","E101","E102","E103","E104","E105","E106","E107","E108",
             "E109","E110","E111","E112","E113","E114","E115","E116","E117",
             "E118","E119","E120","E121","E122","E123","E124","E125","E126",
             "E127","E128","E129","E130","E131","E132","E133","E134","E135",
             "E136","E137","E138","E139","E140","E141","E142","E143","E144",
             "E145","E146","E147","E148","E149","N390","K920","K921","K922",
             "P350")

# where CIDs has 4 characters
df3$ICSAP <- ifelse(df3$DIAG_PRINC %in% ICSAP4c, 1, df3$ICSAP)

# check variable building
table(df3$ICSAP, exclude = NULL)

# proportion of ICSAPs
sum(df3$ICSAP) / length(df3$ICSAP)

# ICSAP by sex
IcsapBrSex <- df3 %>%
  group_by(SEXO) %>%
  summarise(ICSAPn = sum(ICSAP),
            ITn = length(ICSAP),
            ICSAPprop = ICSAPn / ITn)
IcsapBrSex

# export file "ICSAP" by "SEXO"
wd2 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd2)
getwd()
write.csv2(IcsapBrSex, file = "./IcsapBrSex.csv")

# create variable idade transformed
df3$IdadeT <- df3$IDADE
df3$IdadeT <- ifelse(df3$COD_IDADE == 2 | df3$COD_IDADE == 3, 0, df3$IdadeT)
df3$IdadeT <- ifelse(df3$COD_IDADE == 5, 100 + df3$IDADE, df3$IdadeT)

# ICSAP by age
IcsapBrAge <- df3 %>%
  group_by(IdadeT) %>%
  summarise(ICSAPn = sum(ICSAP),
            ITn = length(ICSAP),
            ICSAPprop = ICSAPn / ITn)
IcsapBrAge

# export file "ICSAP" by age
wd2 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd2)
getwd()
write.csv2(IcsapBrAge, file = "./IcsapBrAge.csv")

# ICSAP by sex and age
IcsapBrSexAge <- df3 %>%
  group_by(SEXO, IdadeT) %>%
  summarise(ICSAPn = sum(ICSAP),
            ITn = length(ICSAP),
            ICSAPprop = ICSAPn / ITn)
IcsapBrSexAge

# export file "ICSAP" by sex and age
wd2 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd2)
getwd()
write.csv2(IcsapBrSexAge, file = "./IcsapBrsexAge.csv")

# create "ICSAPGroup" - Group 1
df3$ICSAPGroup <- 0
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^A18", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A19", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A33", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A34", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A35", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A36", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A37", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A51", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A52", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A53", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A95", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^B05", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^B06", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^B16", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^B26", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^B50", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^B51", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^B52", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^B53", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^B54", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^B77", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^I00", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^I01", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^I02", df3$DIAG_PRINC), 1, df3$ICSAPGroup)
# ICSAP Group 1 with 4 characters
ICSAP014 <- c("A150","A151","A152","A153","A154","A155","A156","A157","A158",
              "A159","A160","A161","A162","A163","A164","A165","A166","A167",
              "A168","A169","A170","A171","A172","A173","A174","A175","A176",
              "A177","A178","A179","G000")
# where CIDs has 4 characters
df3$ICSAPGroup <- ifelse(df3$DIAG_PRINC %in% ICSAP014, 1, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 1"
sum(df3$ICSAPGroup == 1) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 2
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^A00", df3$DIAG_PRINC), 2, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A01", df3$DIAG_PRINC), 2, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A02", df3$DIAG_PRINC), 2, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A03", df3$DIAG_PRINC), 2, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A04", df3$DIAG_PRINC), 2, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A05", df3$DIAG_PRINC), 2, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A06", df3$DIAG_PRINC), 2, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A07", df3$DIAG_PRINC), 2, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A08", df3$DIAG_PRINC), 2, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^A09", df3$DIAG_PRINC), 2, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E86", df3$DIAG_PRINC), 2, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 2"
sum(df3$ICSAPGroup == 2) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 3
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^D50", df3$DIAG_PRINC), 3, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 3"
sum(df3$ICSAPGroup == 3) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 4
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^E40", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E41", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E42", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E43", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E44", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E45", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E46", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E50", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E51", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E52", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E53", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E54", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E55", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E56", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E57", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E58", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E59", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E60", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E61", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E62", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E63", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^E64", df3$DIAG_PRINC), 4, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 4"
sum(df3$ICSAPGroup == 4) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 5
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^H66", df3$DIAG_PRINC), 5, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J00", df3$DIAG_PRINC), 5, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J01", df3$DIAG_PRINC), 5, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J02", df3$DIAG_PRINC), 5, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J03", df3$DIAG_PRINC), 5, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J06", df3$DIAG_PRINC), 5, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J31", df3$DIAG_PRINC), 5, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 5"
sum(df3$ICSAPGroup == 5) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 6
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^J13", df3$DIAG_PRINC), 6, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J14", df3$DIAG_PRINC), 6, df3$ICSAPGroup)
# ICSAP Group 6 with 4 characters
ICSAP064 <- c("J153","J154","J158","J159","J181")
# where CIDs has 4 characters
df3$ICSAPGroup <- ifelse(df3$DIAG_PRINC %in% ICSAP064, 6, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 6"
sum(df3$ICSAPGroup == 6) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 7
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^J45", df3$DIAG_PRINC), 7, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J46", df3$DIAG_PRINC), 7, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 7"
sum(df3$ICSAPGroup == 7) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 8
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^J20", df3$DIAG_PRINC), 8, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J21", df3$DIAG_PRINC), 8, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J40", df3$DIAG_PRINC), 8, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J41", df3$DIAG_PRINC), 8, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J42", df3$DIAG_PRINC), 8, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J43", df3$DIAG_PRINC), 8, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J44", df3$DIAG_PRINC), 8, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J47", df3$DIAG_PRINC), 8, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 8"
sum(df3$ICSAPGroup == 8) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 9
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^I10", df3$DIAG_PRINC), 9, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^I11", df3$DIAG_PRINC), 9, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 9"
sum(df3$ICSAPGroup == 9) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 10
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^I20", df3$DIAG_PRINC), 10, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 10"
sum(df3$ICSAPGroup == 10) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 11
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^I50", df3$DIAG_PRINC), 11, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^J81", df3$DIAG_PRINC), 11, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 11"
sum(df3$ICSAPGroup == 11) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 12
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^G45", df3$DIAG_PRINC), 12, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^G46", df3$DIAG_PRINC), 12, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^I63", df3$DIAG_PRINC), 12, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^I64", df3$DIAG_PRINC), 12, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^I65", df3$DIAG_PRINC), 12, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^I66", df3$DIAG_PRINC), 12, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^I67", df3$DIAG_PRINC), 12, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^I69", df3$DIAG_PRINC), 12, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 12"
sum(df3$ICSAPGroup == 12) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 13
# ICSAP Group 13 with 4 characters
ICSAP134 <- c("E100","E101","E102","E103","E104","E105","E106","E107","E108",
              "E109","E110","E111","E112","E113","E114","E115","E116","E117",
              "E118","E119","E120","E121","E122","E123","E124","E125","E126",
              "E127","E128","E129","E130","E131","E132","E133","E134","E135",
              "E136","E137","E138","E139","E140","E141","E142","E143","E144",
              "E145","E146","E147","E148","E149")
# where CIDs has 4 characters
df3$ICSAPGroup <- ifelse(df3$DIAG_PRINC %in% ICSAP134, 13, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 13"
sum(df3$ICSAPGroup == 13) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 14
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^G40", df3$DIAG_PRINC), 14, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^G41", df3$DIAG_PRINC), 14, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 14"
sum(df3$ICSAPGroup == 14) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 15
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^N10", df3$DIAG_PRINC), 15, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^N11", df3$DIAG_PRINC), 15, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^N12", df3$DIAG_PRINC), 15, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^N30", df3$DIAG_PRINC), 15, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^N34", df3$DIAG_PRINC), 15, df3$ICSAPGroup)
# ICSAP Group 15 with 4 characters
ICSAP154 <- c("N390")
# where CIDs has 4 characters
df3$ICSAPGroup <- ifelse(df3$DIAG_PRINC %in% ICSAP154, 15, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 15"
sum(df3$ICSAPGroup == 15) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 16
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^A46", df3$DIAG_PRINC), 16, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^L01", df3$DIAG_PRINC), 16, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^L02", df3$DIAG_PRINC), 16, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^L03", df3$DIAG_PRINC), 16, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^L04", df3$DIAG_PRINC), 16, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^L08", df3$DIAG_PRINC), 16, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 16"
sum(df3$ICSAPGroup == 16) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 17
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^N70", df3$DIAG_PRINC), 17, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^N71", df3$DIAG_PRINC), 17, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^N72", df3$DIAG_PRINC), 17, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^N73", df3$DIAG_PRINC), 17, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^N75", df3$DIAG_PRINC), 17, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^N76", df3$DIAG_PRINC), 17, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 17"
sum(df3$ICSAPGroup == 17) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 18
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^K25", df3$DIAG_PRINC), 18, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^K26", df3$DIAG_PRINC), 18, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^K27", df3$DIAG_PRINC), 18, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^K28", df3$DIAG_PRINC), 18, df3$ICSAPGroup)
# ICSAP Group 18 with 4 characters
ICSAP184 <- c("K920","K921","K922")
# where CIDs has 4 characters
df3$ICSAPGroup <- ifelse(df3$DIAG_PRINC %in% ICSAP184, 18, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 18"
sum(df3$ICSAPGroup == 18) / sum(df3$ICSAP == 1)

# create "ICSAPGroup" - Group 19
# where CIDs has 3 characters
df3$ICSAPGroup <- ifelse(grepl("^A50", df3$DIAG_PRINC), 19, df3$ICSAPGroup)
df3$ICSAPGroup <- ifelse(grepl("^O23", df3$DIAG_PRINC), 19, df3$ICSAPGroup)
# ICSAP Group 19 with 4 characters
ICSAP194 <- c("P350")
# where CIDs has 4 characters
df3$ICSAPGroup <- ifelse(df3$DIAG_PRINC %in% ICSAP194, 19, df3$ICSAPGroup)
# check variable building
table(df3$ICSAPGroup, exclude = NULL)
# proportion of "Group 19"
sum(df3$ICSAPGroup == 19) / sum(df3$ICSAP == 1)

# "ICSAPGroup" by "SEXO"
step1 <- df3 %>%
  group_by(SEXO,ICSAPGroup, .drop=FALSE) %>%
  summarise(ICSAPGroupN = length(ICSAPGroup))
step2 <- df3 %>%
  group_by(SEXO) %>%
  summarise(ICSAPTotalN = sum(ICSAP),
            ITn = length(ICSAP))
merge <- merge(step1, step2, by = "SEXO")
names(merge)[2] <- "ICSAPGroup"
merge <- merge[!(merge$ICSAPGroup == 0),]
rownames(merge) <- NULL
merge$ICSAPGroupPropICSAP <- merge$ICSAPGroupN / merge$ICSAPTotalN
merge$ICSAPGroupPropIT <- merge$ICSAPGroupN / merge$ITn

# ICSAP by ICSAPGroup
total <- df3 %>%
  group_by(ICSAPGroup) %>%
  summarise(ICSAPGroupN = length(ICSAPGroup),
            ICSAPTotalN = sum(df3$ICSAP),
            ITn = length(df3$ICSAP),
            ICSAPGroupPropICSAP = ICSAPGroupN / ICSAPTotalN,
            ICSAPGroupPropIT = ICSAPGroupN / ITn)
total <- total[!(total$ICSAPGroup == 0),]
SEXO <- rep("Total", length(total$ICSAPGroup))
total <- cbind(SEXO, total)

# merge both data sets
FinalLong <- rbind(merge, total)
FinalLong$SEXO <- ifelse(FinalLong$SEXO == 1, "Masculino", 
                         ifelse(FinalLong$SEXO == 3, "Feminino", 
                                FinalLong$SEXO))

# convert dataframe Long to Wide
FinalWide <- FinalLong %>%
  select(SEXO, ICSAPGroup, ICSAPGroupPropICSAP, ICSAPGroupPropIT) %>% 
  reshape(direction = "wide", idvar = "ICSAPGroup", timevar = "SEXO")
names(FinalWide)[2] <- "ICSAPpropICSAPMasculino"
names(FinalWide)[3] <- "ICSAPpropITMasculino"
names(FinalWide)[4] <- "ICSAPpropICSAPFeminino"
names(FinalWide)[5] <- "ICSAPpropITFeminino"
names(FinalWide)[6] <- "ICSAPpropICSAPTotal"
names(FinalWide)[7] <- "ICSAPpropITTotal"

# build last row
add <- data.frame(ICSAPGroup = "Total",
                  ICSAPpropICSAPMasculino = sum(FinalWide$ICSAPpropICSAPMasculino),
                  ICSAPpropITMasculino = sum(FinalWide$ICSAPpropITMasculino),
                  ICSAPpropICSAPFeminino = sum(FinalWide$ICSAPpropICSAPFeminino),
                  ICSAPpropITFeminino = sum(FinalWide$ICSAPpropITFeminino),
                  ICSAPpropICSAPTotal = sum(FinalWide$ICSAPpropICSAPTotal),
                  ICSAPpropITTotal = sum(FinalWide$ICSAPpropITTotal))

# combine two data frames
FinalWide <- rbind(FinalWide, add)

# create prevalence ratio
FinalWide$RPICSAPpropICSAPMascFem <- FinalWide$ICSAPpropICSAPMasculino / 
  FinalWide$ICSAPpropICSAPFeminino
FinalWide$RPICSAPpropITMascFem <- FinalWide$ICSAPpropITMasculino / 
  FinalWide$ICSAPpropITFeminino

# export file "ICSAPGroup" by "SEXO"
wd2 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd2)
getwd()
write.csv2(FinalWide, file = "./Table1IcsapBrGroupSex.csv")

























# ICSAP by city
dfFinal <- df3 %>%
  group_by(MUNIC_RES) %>%
  summarise(n = sum(ICSAP),
            total = length(ICSAP),
            prop = n / total)

# export file
wd2 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd2)
getwd()
write.csv2(dfFinal, file ="./CityICSAP1.csv")

# distribution and summary statistics
windows()
hist(dfFinal$prop)
summary(dfFinal$prop)

# read and prepare data
pop <- read.csv2("./popCities.csv", sep=",", colClasses=c("character"))
pop <- pop %>%
  filter(ANO == 2010)
str(pop)
pop$X <- NULL
pop$ANO <- NULL
pop$POPULACAO <- as.numeric(pop$POPULACAO)

# merge data
colnames(dfFinal)[1] <- "COD6D"
dfFinal$COD6D <- as.factor(dfFinal$COD6D )
pop$COD6D <- as.factor(pop$COD6D)
total <- merge(pop, dfFinal, by = "COD6D")

# create variable ICSAP rate
total$rate <- total$n / (total$POPULACAO / 10000)

# prepare to export
colnames(total)[9] <- "ICSAP"
colnames(total)[10] <- "IT"
colnames(total)[11] <- "ICSAPprop"
colnames(total)[12] <- "ICSAPrate"

# export data set
wd2 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd2)
getwd()
write.csv2(total, file ="./CityICSAP2.csv")




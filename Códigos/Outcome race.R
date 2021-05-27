
# clean everything done before
rm(list=ls())

# load packages
library(data.table)
library(tidyverse)
library(readxl)
library(reshape2)
library(ggplot2)

# read data
getwd()
wd1 <- "D:/SIH CSV"
setwd(wd1)
SIH2010 <- as.data.frame(fread("./SIH2010.csv", 
                               select = c("CEP","MUNIC_RES","NASC","SEXO",
                                          "RACA_COR","DT_INTER","DT_SAIDA",
                                          "DIAG_PRINC","CGC_HOSP","MUNIC_MOV",
                                          "CNES")))

# subset with distinct values
library(tidyverse)
df <- SIH2010 %>% 
  distinct(CEP,MUNIC_RES,NASC,SEXO,RACA_COR,DT_INTER,DIAG_PRINC,CGC_HOSP,
           MUNIC_MOV,CNES, .keep_all = TRUE)

# filter data that does not belong to 2010
df2 <- df %>%
  filter(as.numeric(DT_SAIDA) >= 20100101,
         as.numeric(DT_INTER) <= 20101231)

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

# change values from variable race
df3$RACA_COR <- ifelse(df3$RACA_COR == "1", "Branca", df3$RACA_COR)
df3$RACA_COR <- ifelse(df3$RACA_COR == "2", "Preta", df3$RACA_COR)        
df3$RACA_COR <- ifelse(df3$RACA_COR == "3", "Parda", df3$RACA_COR) 
df3$RACA_COR <- ifelse(df3$RACA_COR == "4", "Amarela", df3$RACA_COR)       
df3$RACA_COR <- ifelse(df3$RACA_COR == "5", "Indígena", df3$RACA_COR) 
df3$RACA_COR <- ifelse(df3$RACA_COR == "99", "NI", df3$RACA_COR) 

# convert variable to factor
df3$RACA_COR <- as.factor(df3$RACA_COR)

# ICSAP by city
df4 <- df3 %>%
  group_by(MUNIC_RES, RACA_COR, .drop=FALSE) %>%
  summarise(icsap_n = sum(ICSAP),
            it_n = n(),
            icsap_prop = icsap_n / it_n)

# read data population
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/IBGE/Ano 2010"
setwd(wd2)
library(readxl)
popWide <- read_excel("./PopulationRace.xlsx", sheet = "dataset")

# prepare data population
library(reshape2)
popLong <- melt(popWide, 
                measure.vars=c("Branca","Preta","Amarela","Parda","Indígena","NI"), 
                variable.name="race",
                value.name="population")
popLong$COD6D <- substr(popLong$COD7D, 1, 6) 

# prepare data df4
colnames(df4)[1] <- "COD6D"
colnames(df4)[2] <- "race"

# merge data
totalLong <- merge(popLong, df4, by = c("COD6D", "race"))

# create variable ICSAP rate
totalLong$icsap_rate <- totalLong$icsap_n / (totalLong$population / 10000)

# histogram icsap_prop vs race
library(ggplot2)
windows()
g <- ggplot(data = totalLong, aes(x = icsap_prop, fill = race))
g + 
  geom_histogram() + 
  facet_grid(.~race) + 
  theme(legend.position = "bottom")

# box icsap_prop vs race
g <- ggplot(data = totalLong, aes(x = race, y = icsap_prop, fill = race))
g + 
  geom_boxplot() + 
  theme(legend.position = "bottom")

# summary statistics icsap_prop vs race
by(totalLong$icsap_prop, totalLong$race, summary)
totalLong %>%
  group_by(race) %>%
  summarise(min = min(icsap_prop, na.rm = TRUE),
            q1 = quantile(icsap_prop, 0.25, na.rm = TRUE),
            median = median(icsap_prop, na.rm = TRUE),
            mean = mean(icsap_prop, na.rm = TRUE), 
            q3 = quantile(icsap_prop, 0.75, na.rm = TRUE),
            max = max(icsap_prop, na.rm = TRUE),
            sd = sd(icsap_prop, na.rm = TRUE),
            iqr = IQR(icsap_prop, na.rm = TRUE))

# histogram icsap_rate vs race
library(ggplot2)
windows()
g <- ggplot(data = totalLong, aes(x = icsap_rate, fill = race))
g + 
  geom_histogram() + 
  facet_grid(.~race, scales = "free") + 
  theme(legend.position = "bottom")
totalLong %>%
  filter(race != "NI") %>%
  ggplot(aes(x = icsap_rate, fill = race)) + 
  geom_histogram() + 
  facet_grid(.~race, scales="free") + 
  theme(legend.position = "bottom")

# box icsap_rate vs race
g <- ggplot(data = totalLong, aes(x = race, y = log(icsap_rate), fill = race))
g + 
  geom_boxplot() + 
  theme(legend.position = "bottom")

# summary statistics icsap_rate vs race
by(totalLong$icsap_rate, totalLong$race, summary)
totalLong %>%
  group_by(race) %>%
  summarise(min = min(icsap_rate, na.rm = TRUE),
            q1 = quantile(icsap_rate, 0.25, na.rm = TRUE),
            median = median(icsap_rate, na.rm = TRUE),
            mean = mean(icsap_rate, na.rm = TRUE), 
            q3 = quantile(icsap_rate, 0.75, na.rm = TRUE),
            max = max(icsap_rate, na.rm = TRUE),
            sd = sd(icsap_rate, na.rm = TRUE),
            iqr = IQR(icsap_rate, na.rm = TRUE))

# transform data frame long to wide
totalWide <- totalLong %>%
  reshape(idvar = c("COD6D","COD7D","Municipio"), 
          timevar = "race", 
          direction = "wide")

# read data population
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
icsaptotal <- read.csv2("./CityICSAP2.csv")

# merge data
totalWide <- merge(totalWide, icsaptotal[,c(6,12:13)], by = "COD7D")

# create variables icsap_prop_ratio
totalWide$icsap_prop_ratio_amarela <- totalWide$icsap_prop.Amarela / 
  totalWide$ICSAPprop
totalWide$icsap_prop_ratio_branca <- totalWide$icsap_prop.Branca / 
  totalWide$ICSAPprop
totalWide$icsap_prop_ratio_indigena <- totalWide$icsap_prop.Indígena / 
  totalWide$ICSAPprop
totalWide$icsap_prop_ratio_ni <- totalWide$icsap_prop.NI / 
  totalWide$ICSAPprop
totalWide$icsap_prop_ratio_parda <- totalWide$icsap_prop.Parda / 
  totalWide$ICSAPprop
totalWide$icsap_prop_ratio_preta <- totalWide$icsap_prop.Preta / 
  totalWide$ICSAPprop

# summary statistics variables icsap_prop_ratio
summary(totalWide$icsap_prop_ratio_amarela)
summary(totalWide$icsap_prop_ratio_branca)
summary(totalWide$icsap_prop_ratio_indigena)
summary(totalWide$icsap_prop_ratio_ni)
summary(totalWide$icsap_prop_ratio_parda)
summary(totalWide$icsap_prop_ratio_preta)

# proportion of icsap_prop.Amarela > icsap_prop.Total
sum(totalWide$icsap_prop_ratio_amarela > 1, na.rm = TRUE) / 
  length(totalWide$icsap_prop_ratio_amarela)
# outcome = 0.1390836

# proportion of icsap_prop.Branca > icsap_prop.Total
sum(totalWide$icsap_prop_ratio_branca > 1, na.rm = TRUE) / 
  length(totalWide$icsap_prop_ratio_branca)
# outcome: 0.4548068

# proportion of icsap_prop.Indigena > icsap_prop.Total
sum(totalWide$icsap_prop_ratio_indigena > 1, na.rm = TRUE) / 
  length(totalWide$icsap_prop_ratio_indigena)
# outcome: 0.0918239

# proportion of icsap_prop.NI > icsap_prop.Total
sum(totalWide$icsap_prop_ratio_ni > 1, na.rm = TRUE) / 
  length(totalWide$icsap_prop_ratio_ni)
# outcome: 0.4019766

# proportion of icsap_prop.Parda > icsap_prop.Total
sum(totalWide$icsap_prop_ratio_parda > 1, na.rm = TRUE) / 
  length(totalWide$icsap_prop_ratio_parda)
# outcome: 0.4265948

# proportion of icsap_prop.Preta > icsap_prop.Total
sum(totalWide$icsap_prop_ratio_preta > 1, na.rm = TRUE) / 
  length(totalWide$icsap_prop_ratio_preta)
# outcome: 0.3338724

# create variables icsap_rate_ratio
totalWide$icsap_rate_ratio_amarela <- totalWide$icsap_rate.Amarela / 
  totalWide$ICSAPrate
totalWide$icsap_rate_ratio_branca <- totalWide$icsap_rate.Branca / 
  totalWide$ICSAPrate
totalWide$icsap_rate_ratio_indigena <- totalWide$icsap_rate.Indígena / 
  totalWide$ICSAPrate
totalWide$icsap_rate_ratio_ni <- totalWide$icsap_rate.NI / 
  totalWide$ICSAPrate
totalWide$icsap_rate_ratio_parda <- totalWide$icsap_rate.Parda / 
  totalWide$ICSAPrate
totalWide$icsap_rate_ratio_preta <- totalWide$icsap_rate.Preta / 
  totalWide$ICSAPrate

# summary statistics variables icsap_rate_ratio
summary(totalWide$icsap_rate_ratio_amarela)
summary(totalWide$icsap_rate_ratio_branca)
summary(totalWide$icsap_prop_ratio_indigena)
summary(totalWide$icsap_prop_ratio_ni)
summary(totalWide$icsap_prop_ratio_parda)
summary(totalWide$icsap_prop_ratio_preta)

# proportion of icsap_rate.Amarela > icsap_rate.Total
sum(totalWide$icsap_rate_ratio_amarela > 1, na.rm = TRUE) / 
  length(totalWide$icsap_rate_ratio_amarela)
# outcome = 0.0918239

# proportion of icsap_rate.Branca > icsap_rate.Total
sum(totalWide$icsap_rate_ratio_branca > 1, na.rm = TRUE) / 
  length(totalWide$icsap_rate_ratio_branca)
# outcome = 0.3045822

# proportion of icsap_rate.Indigena > icsap_rate.Total
sum(totalWide$icsap_rate_ratio_indigena > 1, na.rm = TRUE) / 
  length(totalWide$icsap_rate_ratio_indigena)
# outcome = 0.07511231

# proportion of icsap_rate.NI > icsap_rate.Total
sum(totalWide$icsap_rate_ratio_ni > 1, na.rm = TRUE) / 
  length(totalWide$icsap_rate_ratio_ni)
# outcome = 0.9241689

# proportion of icsap_rate.Parda > icsap_rate.Total
sum(totalWide$icsap_rate_ratio_parda > 1, na.rm = TRUE) / 
  length(totalWide$icsap_rate_ratio_parda)
# outcome = 0.238814

# proportion of icsap_rate.Preta > icsap_rate.Total
sum(totalWide$icsap_rate_ratio_preta > 1, na.rm = TRUE) / 
  length(totalWide$icsap_rate_ratio_preta)
# outcome = 0.165319

# export data frames
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(totalWide, file ="./IcsapRaceWide.csv")
write.csv2(totalLong, file ="./IcsapRaceLong.csv")











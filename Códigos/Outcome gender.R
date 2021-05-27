
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
library(data.table)
library(tidyverse)
SIH2010 <- as.data.frame(fread("./SIH2010.csv", 
                               select = c("CEP","MUNIC_RES","NASC","SEXO",
                                          "RACA_COR","DT_INTER","DT_SAIDA",
                                          "DIAG_PRINC","CGC_HOSP","MUNIC_MOV",
                                          "CNES")))

# subset with distinct values
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

# ICSAP by city
df4 <- df3 %>%
  group_by(MUNIC_RES, SEXO) %>%
  summarise(icsap_n = sum(ICSAP),
            it_n = n(),
            icsap_prop = icsap_n / it_n)
 
# read data population
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/IBGE/Ano 2010"
setwd(wd2)
library(readxl)
popWide <- read_excel("./PopulationSex.xlsx", sheet = "dataset")

# prepare data population
library(reshape2)
popLong <- melt(popWide, measure.vars=c("Homens","Mulheres"), 
                variable.name="sex",
                value.name="population")
popLong$COD6D <- substr(popLong$COD7D, 1, 6) 

# prepare data df4
colnames(df4)[1] <- "COD6D"
colnames(df4)[2] <- "sex"
df4$sex <- ifelse(df4$sex == 1, "Homens", 
                  ifelse(df4$sex == 3 | df4$sex == 2, "Mulheres", df4$sex))

# merge data
totalLong <- merge(popLong, df4, by = c("COD6D", "sex"))

# prepate data
totalLong$X <- NULL
totalLong$ANO <- NULL

# create variable ICSAP rate
totalLong$population <- as.numeric(totalLong$population)
totalLong$icsap_rate <- totalLong$icsap_n / (totalLong$population / 10000)

# histogram icsap_prop vs gender
library(ggplot2)
windows()
g <- ggplot(data = totalLong, aes(x = icsap_prop, fill = sex))
g + 
  geom_histogram() + 
  facet_grid(.~sex) + 
  theme(legend.position = "bottom")

# box icsap_prop vs gender
g <- ggplot(data = totalLong, aes(x = sex, y = icsap_prop, fill = sex))
g + 
  geom_boxplot() + 
  theme(legend.position = "bottom")

# summary statistics icsap_prop vs gender
by(totalLong$icsap_prop, totalLong$sex, summary)
totalLong %>%
  group_by(sex) %>%
  summarise(min = min(icsap_prop),
            q1 = quantile(icsap_prop, 0.25),
            median = median(icsap_prop),
            mean = mean(icsap_prop), 
            q3 = quantile(icsap_prop, 0.75),
            max = max(icsap_prop),
            sd = sd(icsap_prop),
            iqr = IQR(icsap_prop))

# histogram icsap_rate vs gender
library(ggplot2)
windows()
g <- ggplot(data = totalLong, aes(x = icsap_rate, fill = sex))
g + 
  geom_histogram() + 
  facet_grid(.~sex) + 
  theme(legend.position = "bottom")

# box icsap_rate vs gender
g <- ggplot(data = totalLong, aes(x = sex, y = log(icsap_rate), fill = sex))
g + 
  geom_boxplot() + 
  theme(legend.position = "bottom")

# summary statistics icsap_rate vs gender
by(totalLong$icsap_rate, totalLong$sex, summary)
totalLong %>%
  group_by(sex) %>%
  summarise(min = min(icsap_rate),
            q1 = quantile(icsap_rate, 0.25),
            median = median(icsap_rate),
            mean = mean(icsap_rate), 
            q3 = quantile(icsap_rate, 0.75),
            max = max(icsap_rate),
            sd = sd(icsap_rate),
            iqr = IQR(icsap_rate))

# transform data frame long to wide
totalWide <- totalLong %>%
  reshape(idvar = c("COD6D","COD7D","Município"), 
          timevar = "sex", 
          direction = "wide")
 
# create variable icsap_prop_ratio on wide data frame
totalWide$icsap_prop_ratio <- totalWide$icsap_prop.Mulheres / 
  totalWide$icsap_prop.Homens

# create variable icsap_rate_ration on wide data frame
totalWide$icsap_rate_ratio <- totalWide$icsap_rate.Mulheres / 
  totalWide$icsap_rate.Homens

# summary statistics icsap_prop_ratio
summary(totalWide$icsap_prop_ratio)

# summary statistics icsap_rate_ratio
summary(totalWide$icsap_rate_ratio)

# proportion of icsap_prop.Mulheres > icsap_prop.Homens
sum(totalWide$icsap_prop_ratio > 1) / length(totalWide$icsap_prop_ratio)
# outcome = 0.5090746

# proportion of icsap_prop.Mulheres < icsap_prop.Homens
sum(totalWide$icsap_prop_ratio < 1) / length(totalWide$icsap_prop_ratio)
# outcome = 0.4891285

# proportion of icsap_prop.Mulheres = icsap_prop.Homens
sum(totalWide$icsap_prop_ratio == 1) / length(totalWide$icsap_prop_ratio)
# outcome = 0.001796945

# proportion of icsap_rate.Mulheres > icsap_rate.Homens
sum(totalWide$icsap_rate_ratio > 1) / length(totalWide$icsap_rate_ratio)
# outcome = 0.6745732

# proportion of icsap_rate.Mulheres < icsap_rate.Homens
sum(totalWide$icsap_rate_ratio < 1) / length(totalWide$icsap_rate_ratio)
# outcome = 0.3254268

# proportion of icsap_rate.Mulheres = icsap_rate.Homens
sum(totalWide$icsap_rate_ratio == 1) / length(totalWide$icsap_rate_ratio)
# outcome = 0

# export data frames
wd2 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd2)
getwd()
write.csv2(totalWide, file ="./IcsapGenderWide.csv")
write.csv2(totalLong, file ="./IcsapGenderLong.csv")






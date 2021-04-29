
# use more memory
memory.limit(9999999999)

# load packages
library(tidyverse)

# load data
SIH2010 <- read.csv2("D:/Banco de dados/SIH/SIH2010.csv")
SIH2011 <- read.csv2("D:/Banco de dados/SIH/SIH2011.csv")
SIH2012 <- read.csv2("D:/Banco de dados/SIH/SIH2012.csv")
SIH2013 <- read.csv2("D:/Banco de dados/SIH/SIH2013.csv")
SIH2014 <- read.csv2("D:/Banco de dados/SIH/SIH2014.csv")
SIH2015 <- read.csv2("D:/Banco de dados/SIH/SIH2015.csv")
SIH2016 <- read.csv2("D:/Banco de dados/SIH/SIH2016.csv")
SIH2017 <- read.csv2("D:/Banco de dados/SIH/SIH2017.csv")
SIH2018 <- read.csv2("D:/Banco de dados/SIH/SIH2018.csv")
SIH2019 <- read.csv2("D:/Banco de dados/SIH/SIH2019.csv")
SIH2020 <- read.csv2("D:/Banco de dados/SIH/SIH2020.csv")

# find with there are hospitalization in 2010
table(startsWith(as.character(SIH2010$DT_INTER), "2010"))
table(startsWith(as.character(SIH2011$DT_INTER), "2010"))
table(startsWith(as.character(SIH2012$DT_INTER), "2010"))
table(startsWith(as.character(SIH2013$DT_INTER), "2010"))
table(startsWith(as.character(SIH2014$DT_INTER), "2010"))
table(startsWith(as.character(SIH2015$DT_INTER), "2010"))
table(startsWith(as.character(SIH2016$DT_INTER), "2010"))
table(startsWith(as.character(SIH2017$DT_INTER), "2010"))
table(startsWith(as.character(SIH2018$DT_INTER), "2010"))
table(startsWith(as.character(SIH2019$DT_INTER), "2010"))
table(startsWith(as.character(SIH2020$DT_INTER), "2010"))

# select just hospitalizations in 2010
SIH2010_2010 <- SIH2010 %>%
  filter(startsWith(as.character(SIH2010$DT_INTER), "2010"))
SIH2011_2010 <- SIH2011 %>%
  filter(startsWith(as.character(SIH2011$DT_INTER), "2010"))
SIH2012_2010 <- SIH2012 %>%
  filter(startsWith(as.character(SIH2012$DT_INTER), "2010"))
SIH2013_2010 <- SIH2013 %>%
  filter(startsWith(as.character(SIH2013$DT_INTER), "2010"))
SIH2014_2010 <- SIH2014 %>%
  filter(startsWith(as.character(SIH2014$DT_INTER), "2010"))
SIH2015_2010 <- SIH2015 %>%
  filter(startsWith(as.character(SIH2015$DT_INTER), "2010"))
SIH2016_2010 <- SIH2016 %>%
  filter(startsWith(as.character(SIH2016$DT_INTER), "2010"))
SIH2017_2010 <- SIH2017 %>%
  filter(startsWith(as.character(SIH2017$DT_INTER), "2010"))
SIH2018_2010 <- SIH2018 %>%
  filter(startsWith(as.character(SIH2018$DT_INTER), "2010"))
SIH2019_2010 <- SIH2019 %>%
  filter(startsWith(as.character(SIH2019$DT_INTER), "2010"))
SIH2020_2010 <- SIH2020 %>%
  filter(startsWith(as.character(SIH2020$DT_INTER), "2010"))

# gather hospitalizations in 2010 in just one data frame
SIH2010 <- rbind(SIH2010_2010, SIH2011_2010, SIH2012_2010, SIH2013_2010, 
                 SIH2014_2010, SIH2015_2010, SIH2016_2010, SIH2017_2010, 
                 SIH2018_2010, SIH2019_2010, SIH2020_2010)

# find duplicated values
duplicated <- SIH2010[duplicated(SIH2010[,c("SEXO","NASC","DT_INTER",
                                            "MUNIC_MOV","DIAG_PRINC")]),]

# proportion of duplicated values
nrow(duplicated) / nrow(SIH2010)

# return number of characters from variable "DIAG_PRINC"
table(nchar(SIH2010$DIAG_PRINC, keepNA = FALSE), exclude = NULL)

# create binomial variable "ICSAP"
# where CIDs has 3 characters
SIH2010$ICSAP <- "Preencher"
SIH2010$ICSAP <- ifelse(grepl("^A18", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A19", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A33", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A34", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A35", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A36", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A37", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A51", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A52", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A53", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A95", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^B05", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^B06", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^B16", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^B26", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^B50", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^B51", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^B52", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^B53", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^B54", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^B77", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I00", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I01", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I02", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A00", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A01", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A02", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A03", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A04", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A05", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A06", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A07", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A08", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A09", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E86", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^D50", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E40", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E41", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E42", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E43", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E44", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E45", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E46", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E50", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E51", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E52", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E53", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E54", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E55", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E56", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E57", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E58", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E59", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E60", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E61", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E62", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E63", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^E64", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^H66", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J00", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J01", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J02", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J03", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J06", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J31", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J13", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J14", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J45", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J46", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J20", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J21", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J40", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J41", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J42", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J43", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J44", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J47", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I10", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I11", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I20", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I50", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^J81", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^G45", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^G46", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I63", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I64", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I65", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I66", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I67", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^I69", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^G40", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^G41", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^N10", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^N11", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^N12", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^N30", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^N34", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A46", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^L01", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^L02", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^L03", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^L04", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^L08", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^N70", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^N71", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^N72", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^N73", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^N75", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^N76", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^K25", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^K26", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^K27", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^K28", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^A50", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
SIH2010$ICSAP <- ifelse(grepl("^O23", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAP)
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
SIH2010$ICSAP <- ifelse(SIH2010$DIAG_PRINC %in% ICSAP4c, 1, SIH2010$ICSAP)
# change "Preencher" to 0
SIH2010$ICSAP <- ifelse(SIH2010$ICSAP == "Preencher", 0, SIH2010$ICSAP)
# check variable building
table(SIH2010$ICSAP, exclude = NULL)
# proportion of ICSAPs
SIH2010$ICSAP <- as.numeric(SIH2010$ICSAP)
sum(SIH2010$ICSAP) / length(SIH2010$ICSAP)

# create "ICSAPGroup" - Group 1
SIH2010$ICSAPGroup <- 0
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^A18", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A19", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A33", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A34", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A35", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A36", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A37", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A51", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A52", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A53", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A95", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^B05", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^B06", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^B16", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^B26", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^B50", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^B51", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^B52", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^B53", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^B54", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^B77", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^I00", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^I01", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^I02", SIH2010$DIAG_PRINC), 1, SIH2010$ICSAPGroup)
# ICSAP Group 1 with 4 characters
ICSAP014 <- c("A150","A151","A152","A153","A154","A155","A156","A157","A158",
              "A159","A160","A161","A162","A163","A164","A165","A166","A167",
              "A168","A169","A170","A171","A172","A173","A174","A175","A176",
              "A177","A178","A179","G000")
# where CIDs has 4 characters
SIH2010$ICSAPGroup <- ifelse(SIH2010$DIAG_PRINC %in% ICSAP014, 1, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 1"
sum(SIH2010$ICSAPGroup == 1) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 2
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^A00", SIH2010$DIAG_PRINC), 2, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A01", SIH2010$DIAG_PRINC), 2, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A02", SIH2010$DIAG_PRINC), 2, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A03", SIH2010$DIAG_PRINC), 2, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A04", SIH2010$DIAG_PRINC), 2, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A05", SIH2010$DIAG_PRINC), 2, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A06", SIH2010$DIAG_PRINC), 2, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A07", SIH2010$DIAG_PRINC), 2, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A08", SIH2010$DIAG_PRINC), 2, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^A09", SIH2010$DIAG_PRINC), 2, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E86", SIH2010$DIAG_PRINC), 2, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 2"
sum(SIH2010$ICSAPGroup == 2) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 3
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^D50", SIH2010$DIAG_PRINC), 3, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 3"
sum(SIH2010$ICSAPGroup == 3) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 4
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^E40", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E41", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E42", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E43", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E44", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E45", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E46", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E50", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E51", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E52", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E53", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E54", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E55", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E56", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E57", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E58", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E59", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E60", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E61", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E62", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E63", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^E64", SIH2010$DIAG_PRINC), 4, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 4"
sum(SIH2010$ICSAPGroup == 4) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 5
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^H66", SIH2010$DIAG_PRINC), 5, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J00", SIH2010$DIAG_PRINC), 5, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J01", SIH2010$DIAG_PRINC), 5, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J02", SIH2010$DIAG_PRINC), 5, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J03", SIH2010$DIAG_PRINC), 5, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J06", SIH2010$DIAG_PRINC), 5, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J31", SIH2010$DIAG_PRINC), 5, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 5"
sum(SIH2010$ICSAPGroup == 5) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 6
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^J13", SIH2010$DIAG_PRINC), 6, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J14", SIH2010$DIAG_PRINC), 6, SIH2010$ICSAPGroup)
# ICSAP Group 6 with 4 characters
ICSAP064 <- c("J153","J154","J158","J159","J181")
# where CIDs has 4 characters
SIH2010$ICSAPGroup <- ifelse(SIH2010$DIAG_PRINC %in% ICSAP064, 6, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 6"
sum(SIH2010$ICSAPGroup == 6) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 7
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^J45", SIH2010$DIAG_PRINC), 7, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J46", SIH2010$DIAG_PRINC), 7, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 7"
sum(SIH2010$ICSAPGroup == 7) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 8
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^J20", SIH2010$DIAG_PRINC), 8, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J21", SIH2010$DIAG_PRINC), 8, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J40", SIH2010$DIAG_PRINC), 8, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J41", SIH2010$DIAG_PRINC), 8, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J42", SIH2010$DIAG_PRINC), 8, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J43", SIH2010$DIAG_PRINC), 8, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J44", SIH2010$DIAG_PRINC), 8, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J47", SIH2010$DIAG_PRINC), 8, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 8"
sum(SIH2010$ICSAPGroup == 8) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 9
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^I10", SIH2010$DIAG_PRINC), 9, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^I11", SIH2010$DIAG_PRINC), 9, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 9"
sum(SIH2010$ICSAPGroup == 9) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 10
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^I20", SIH2010$DIAG_PRINC), 10, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 10"
sum(SIH2010$ICSAPGroup == 10) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 11
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^I50", SIH2010$DIAG_PRINC), 11, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^J81", SIH2010$DIAG_PRINC), 11, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 11"
sum(SIH2010$ICSAPGroup == 11) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 12
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^G45", SIH2010$DIAG_PRINC), 12, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^G46", SIH2010$DIAG_PRINC), 12, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^I63", SIH2010$DIAG_PRINC), 12, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^I64", SIH2010$DIAG_PRINC), 12, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^I65", SIH2010$DIAG_PRINC), 12, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^I66", SIH2010$DIAG_PRINC), 12, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^I67", SIH2010$DIAG_PRINC), 12, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^I69", SIH2010$DIAG_PRINC), 12, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 12"
sum(SIH2010$ICSAPGroup == 12) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 13
# ICSAP Group 13 with 4 characters
ICSAP134 <- c("E100","E101","E102","E103","E104","E105","E106","E107","E108",
              "E109","E110","E111","E112","E113","E114","E115","E116","E117",
              "E118","E119","E120","E121","E122","E123","E124","E125","E126",
              "E127","E128","E129","E130","E131","E132","E133","E134","E135",
              "E136","E137","E138","E139","E140","E141","E142","E143","E144",
              "E145","E146","E147","E148","E149")
# where CIDs has 4 characters
SIH2010$ICSAPGroup <- ifelse(SIH2010$DIAG_PRINC %in% ICSAP134, 13, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 13"
sum(SIH2010$ICSAPGroup == 13) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 14
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^G40", SIH2010$DIAG_PRINC), 14, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^G41", SIH2010$DIAG_PRINC), 14, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 14"
sum(SIH2010$ICSAPGroup == 14) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 15
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^N10", SIH2010$DIAG_PRINC), 15, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^N11", SIH2010$DIAG_PRINC), 15, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^N12", SIH2010$DIAG_PRINC), 15, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^N30", SIH2010$DIAG_PRINC), 15, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^N34", SIH2010$DIAG_PRINC), 15, SIH2010$ICSAPGroup)
# ICSAP Group 15 with 4 characters
ICSAP154 <- c("N390")
# where CIDs has 4 characters
SIH2010$ICSAPGroup <- ifelse(SIH2010$DIAG_PRINC %in% ICSAP154, 15, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 15"
sum(SIH2010$ICSAPGroup == 15) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 16
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^A46", SIH2010$DIAG_PRINC), 16, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^L01", SIH2010$DIAG_PRINC), 16, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^L02", SIH2010$DIAG_PRINC), 16, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^L03", SIH2010$DIAG_PRINC), 16, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^L04", SIH2010$DIAG_PRINC), 16, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^L08", SIH2010$DIAG_PRINC), 16, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 16"
sum(SIH2010$ICSAPGroup == 16) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 17
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^N70", SIH2010$DIAG_PRINC), 17, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^N71", SIH2010$DIAG_PRINC), 17, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^N72", SIH2010$DIAG_PRINC), 17, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^N73", SIH2010$DIAG_PRINC), 17, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^N75", SIH2010$DIAG_PRINC), 17, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^N76", SIH2010$DIAG_PRINC), 17, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 17"
sum(SIH2010$ICSAPGroup == 17) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 18
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^K25", SIH2010$DIAG_PRINC), 18, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^K26", SIH2010$DIAG_PRINC), 18, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^K27", SIH2010$DIAG_PRINC), 18, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^K28", SIH2010$DIAG_PRINC), 18, SIH2010$ICSAPGroup)
# ICSAP Group 18 with 4 characters
ICSAP184 <- c("K920","K921","K922")
# where CIDs has 4 characters
SIH2010$ICSAPGroup <- ifelse(SIH2010$DIAG_PRINC %in% ICSAP184, 18, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 18"
sum(SIH2010$ICSAPGroup == 18) / sum(SIH2010$ICSAP == 1)

# create "ICSAPGroup" - Group 19
# where CIDs has 3 characters
SIH2010$ICSAPGroup <- ifelse(grepl("^A50", SIH2010$DIAG_PRINC), 19, SIH2010$ICSAPGroup)
SIH2010$ICSAPGroup <- ifelse(grepl("^O23", SIH2010$DIAG_PRINC), 19, SIH2010$ICSAPGroup)
# ICSAP Group 19 with 4 characters
ICSAP194 <- c("P350")
# where CIDs has 4 characters
SIH2010$ICSAPGroup <- ifelse(SIH2010$DIAG_PRINC %in% ICSAP194, 19, SIH2010$ICSAPGroup)
# check variable building
table(SIH2010$ICSAPGroup, exclude = NULL)
# proportion of "Group 19"
sum(SIH2010$ICSAPGroup == 19) / sum(SIH2010$ICSAP == 1)

# "ICSAPGroup" by "SEXO"
t1 <- table(SIH2010$ICSAPGroup, SIH2010$SEXO)
t1
library("writexl")
write_xlsx(as.data.frame(t1),"./t1.xlsx")

# "ICSAPGroup" by "RACA_COR"
t2 <- table(SIH2010$ICSAPGroup, SIH2010$RACA_COR)
t2
write_xlsx(as.data.frame(t2),"./t2.xlsx")

# "ICSAPGroup" by "INSTRU"
t3 <- table(SIH2010$ICSAPGroup, SIH2010$INSTRU)
t3

# "ICSAP" by "MUNIC_RES"
cityICSAP <- SIH2010 %>%
  group_by(MUNIC_RES) %>%
  summarize(ICSAPNum = sum(ICSAP),
            ITNum = n(),
            ICSAPRate = sum(ICSAP) / n())

# ICSAP - visual and numerical summary of distributions
windows()
hist(cityICSAP$ICSAPRate)
plot(density(cityICSAP$ICSAPRate))
summary(cityICSAP$ICSAPRate)

# download da tabela de codigos de municipios do IBGE
URL <- "ftp://geoftp.ibge.gov.br/organizacao_do_territorio/estrutura_territorial/divisao_territorial/2018/DTB_2018.zip"
download.file(URL, destfile = "./tabelaIBGE.zip")

# unzip file
unzip("./tabelaIBGE.zip", files = "RELATORIO_DTB_BRASIL_MUNICIPIO.xls")

# read file into R
library("readxl")
tabelaIBGE <- read_excel("./RELATORIO_DTB_BRASIL_MUNICIPIO.xls")   

# merge 2 data sets
names(cityICSAP)[1] <- "COD_MUNIC2"
df1 <- merge(city2010, cityICSAP, by = "COD_MUNIC2")










# Loess method

library(ggplot2)
ggplot(df1, aes(x=log(POPULACAO), y=ICSAPRate)) + 
  geom_point()+
  geom_smooth()
ggplot(df1, aes(x='MULHER%', y=ICSAPRate)) + 
  geom_point()+
  geom_smooth()


windows()
boxplot(df1$ICSAPRate ~ as.factor(df1$UF), pch = 20)

ggplot(df1, aes(x=log(POPULACAO), y=ICSAPRate)) + 
  geom_point()+
  geom_smooth()


plot(df1$'MULHER%', df1$ICSAPRate, pch = 20)
plot(df1$'URBANA%', df1$ICSAPRate, pch = 20)


boxplot(df1$ICSAPRate ~ as.factor(df1$COB.GROUP), pch = 20)
boxplot(df1$ICSAPRate ~ as.factor(df1$PORTE.POP), pch = 20)
plot(df1$IDHM.LONGEVIDADE, df1$ICSAPRate, pch = 20)
plot(df1$IDHM.SCHOOL, df1$ICSAPRate, pch = 20)
plot(df1$IDHM.RENDA, df1$ICSAPRate, pch = 20)
plot(df1$IDHM.TOTAL, df1$ICSAPRate, pch = 20)
plot(df1$'COB_MEDIAN%', df1$ICSAPRate, pch = 20)
plot(df1$'COB_MEAN%', df1$ICSAPRate, pch = 20)


# correlation matrix
cor <- round(cor(df1[,-c(1:5, 79:82)], method ="pearson"),2)
# function to compute p values matrix 
cor.mtest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat<- matrix(NA, n, n)
  diag(p.mat) <- 0
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      tmp <- cor.test(mat[, i], mat[, j], ...)
      p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}
# p values correlation matrix 
p.mat <- cor.mtest(df1[,-c(1:5, 79:82)])
# correlogram
library(RColorBrewer)
col <- colorRampPalette(c("red", "white", "blue"))(20)
library(corrplot)
corrplot(cor, method="pie", type="upper", order="hclust", p.mat = p.mat, 
         sig.level = 0.05, insig = "blank", tl.col="black", tl.srt=75, 
         col=brewer.pal(n=8,name="RdYlBu"))




URBANA%

df1[which.min(df1$'MULHER%'),]

MULHER%

POPULACAO

summary(df1$ICSAPRate)

colnames(df1)


ICSAPRate


# explore data
str(SIH2010)
dim(SIH2010)
colnames(SIH2010)

# remove CID that starts with "O"
library(tidyverse)
library(stringr)
SIH2010_sem_cid_o <- SIH2010 %>%
  filter(!str_detect(DIAG_PRINC, "^O"))







# set ICSAP vectors
ICSAP013 <- c("A18","A19","A33","A34","A35","A36","A37","A51","A52","A53","A95",
           "B05","B06","B16","B26","B50","B51","B52","B53","B54","B77","I00",
           "I01","I02")
ICSAP014 <- c("A150","A151","A152","A153","A154","A155","A156","A157","A158",
             "A159","A160","A161","A162","A163","A164","A165","A166","A167",
             "A168","A169","A170","A171","A172","A173","A174","A175","A176",
             "A177","A178","A179","G000")
ICSAP023 <- c("A00","A01","A02","A03","A04","A05","A06","A07","A08","A09","E86")
ICSAP033 <- c("D50")
ICSAP043 <- c("E40","E41","E42","E43","E44","E45","E46","E50","E51","E52","E53",
             "E54","E55","E56","E57","E58","E59","E60","E61","E62","E63","E64")
ICSAP053 <- c("H66","J00","J01","J02","J03","J06","J31")
ICSAP063 <- c("J13","J14")
ICSAP064 <- c("J153","J154","J158","J159","J181")
ICSAP073 <- c("J45","J46")
ICSAP083 <- c("J20","J21","J40","J41","J42","J43","J44","J47")
ICSAP093 <- c("I10","I11")
ICSAP103 <- c("I20")
ICSAP113 <- c("I50","J81")
ICSAP123 <- c("G45","G46","I63","I64","I65","I66","I67","I69")
ICSAP134 <- c("E100","E101","E102","E103","E104","E105","E106","E107","E108",
              "E109","E110","E111","E112","E113","E114","E115","E116","E117",
              "E118","E119","E120","E121","E122","E123","E124","E125","E126",
              "E127","E128","E129","E130","E131","E132","E133","E134","E135",
              "E136","E137","E138","E139","E140","E141","E142","E143","E144",
              "E145","E146","E147","E148","E149")
ICSAP143 <- c("G40","G41")
ICSAP153 <- c("N10","N11","N12","N30","N34")
ICSAP154 <- c("N390")
ICSAP163 <- c("A46","L01","L02","L03","L04","L08")
ICSAP173 <- c("N70","N71","N72","N73","N75","N76")
ICSAP183 <- c("K25","K26","K27","K28")
ICSAP184 <- c("K920","K921","K922")
ICSAP193 <- c("A50","O23")
ICSAP194 <- c("P350")

# agregação dos CIDs de CSAP

ICSAP_TOTAL = c("A18", "A19","A33","A34","A35","A36","A37","A51","A52","A53","A95","B05","B06","B16",
               "B26","B50","B51","B52","B53","B54","B77","I00",
                 "I01","I02","A150","A151","A152","A153","A154","A155","A156","A157","A158",
                 "A159","A160","A161","A162","A163","A164","A165","A166","A167",
                 "A168","A169","A170","A171","A172","A173","A174","A175","A176",
                 "A177","A178","A179","G000","A00","A01","A02","A03","A04","A05",
                 "A06","A07","A08","A09","E86","D50","E40","E41","E42","E43","E44",
                 "E45","E46","E50","E51","E52","E53","E54","E55","E56","E57","E58",
                 "E59","E60","E61","E62","E63","E64","H66","J00","J01","J02","J03",
                 "J06","J31","J13","J14","J153","J154","J158","J159","J181","J45",
                 "J46","J20","J21","J40","J41","J42","J43","J44","J47","I10","I11",
                 "I20","I50","J81","G45","G46","I63","I64","I65","I66","I67","I69",
                "E100","E101","E102","E103","E104","E105","E106","E107","E108",
              "E109","E110","E111","E112","E113","E114","E115","E116","E117",
              "E118","E119","E120","E121","E122","E123","E124","E125","E126",
              "E127","E128","E129","E130","E131","E132","E133","E134","E135",
              "E136","E137","E138","E139","E140","E141","E142","E143","E144",
              "E145","E146","E147","E148","E149","G40","G41","N10","N11","N12","N30","N34",
              "N390","A46","L01","L02","L03","L04","L08","N70","N71","N72","N73","N75","N76",
              "K25","K26","K27","K28","K920","K921","K922","A50","O23","P350")

# criação de tabelas com data de atendimento, cid principal e sexo
library(tidyverse)
SIH_sexo <- read.csv2("E:/SIH/SIH1998.csv")
SIH_sexo <- SIH_sexo %>% 
  group_by(DT_INTER, DIAG_PRINC, SEXO) %>%
  mutate(qtde = n()) %>%
  distinct(DT_INTER, DIAG_PRINC, SEXO, qtde)
SIH_sexo$icsap <- if_else(SIH_sexo$DIAG_PRINC %in% ICSAP_TOTAL, 1, 0)
SIH_sexo <- SIH_sexo %>% group_by(DT_INTER, SEXO, icsap) %>%
  mutate(num_internacoes = sum(qtde)) %>%
  distinct(DT_INTER, SEXO, num_internacoes)
 

for (i in 1999:2019) {
      arq_sih <- paste("E:/SIH/SIH", i, ".csv",sep="")
      temp <- read.csv2(arq_sih)
      temp <- temp %>%  group_by(DT_INTER, DIAG_PRINC, SEXO) %>%
        mutate(qtde = n()) %>%
        distinct(DT_INTER, DIAG_PRINC, SEXO, qtde)
      temp$icsap <- if_else(temp$DIAG_PRINC %in% ICSAP_TOTAL, 1, 0)
      temp <- temp %>% group_by(DT_INTER, SEXO, icsap) %>%
        mutate(num_internacoes = sum(qtde)) %>%
        distinct(DT_INTER, SEXO, num_internacoes)
      
      
      SIH_sexo <- rbind(SIH_sexo, temp)
      print(arq_sih)
}





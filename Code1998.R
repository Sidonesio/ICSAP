
# load data
SIH1998 <- read.csv2("D:/Banco de dados/SIH/SIH1998.csv") 

# view if there are "DT_SAIDA" before "1998"
table(SIH1998$DT_SAIDA) 

# view if there are "DT_SAIDA" after "1998"
max(SIH1998$DT_SAIDA)

# remove "DT_SAIDA" before "1998"
library(dplyr)
SIH1998 <- filter(SIH1998, grepl("^1998", SIH1998$DT_INTER))
table(SIH1998$DT_SAIDA)

# remove "birth"
SIH1998 <- filter(SIH1998, !grepl("^O80", SIH1998$DIAG_PRINC))
SIH1998 <- filter(SIH1998, !grepl("^O81", SIH1998$DIAG_PRINC))
SIH1998 <- filter(SIH1998, !grepl("^O82", SIH1998$DIAG_PRINC))
SIH1998 <- filter(SIH1998, !grepl("^O83", SIH1998$DIAG_PRINC))
SIH1998 <- filter(SIH1998, !grepl("^O84", SIH1998$DIAG_PRINC))

# return number of characters from variable "DIAG_PRINC"
table(nchar(SIH1998$DIAG_PRINC), exclude = NULL)

############################ CREATE VARIABLE "ICSAP" ###########################

# create binomial variable "ICSAP"
# where CIDs has 3 characters
SIH1998$ICSAP <- 0
SIH1998$ICSAP <- ifelse(grepl("^A18", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A19", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A33", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A34", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A35", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A36", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A37", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A51", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A52", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A53", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A95", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^B05", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^B06", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^B16", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^B26", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^B50", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^B51", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^B52", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^B53", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^B54", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^B77", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I00", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I01", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I02", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A00", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A01", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A02", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A03", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A04", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A05", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A06", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A07", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A08", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A09", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E86", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^D50", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E40", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E41", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E42", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E43", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E44", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E45", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E46", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E50", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E51", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E52", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E53", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E54", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E55", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E56", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E57", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E58", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E59", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E60", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E61", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E62", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E63", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^E64", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^H66", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J00", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J01", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J02", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J03", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J06", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J31", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J13", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J14", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J45", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J46", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J20", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J21", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J40", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J41", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J42", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J43", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J44", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J47", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I10", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I11", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I20", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I50", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^J81", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^G45", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^G46", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I63", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I64", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I65", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I66", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I67", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^I69", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^G40", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^G41", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^N10", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^N11", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^N12", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^N30", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^N34", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A46", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^L01", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^L02", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^L03", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^L04", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^L08", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^N70", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^N71", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^N72", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^N73", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^N75", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^N76", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^K25", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^K26", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^K27", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^K28", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^A50", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
SIH1998$ICSAP <- ifelse(grepl("^O23", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAP)
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
SIH1998$ICSAP <- ifelse(SIH1998$DIAG_PRINC %in% ICSAP4c, 1, SIH1998$ICSAP)
# check variable building
table(SIH1998$ICSAP, exclude = NULL)
# proportion of ICSAPs
propICSAP1998 <- sum(SIH1998$ICSAP) / length(SIH1998$ICSAP)
propICSAP1998

######################### CREATE VARIABLE "ICSAPGroup" #########################

# create "ICSAPGroup" - Group 1
SIH1998$ICSAPGroup <- NA
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^A18", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A19", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A33", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A34", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A35", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A36", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A37", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A51", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A52", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A53", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A95", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^B05", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^B06", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^B16", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^B26", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^B50", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^B51", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^B52", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^B53", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^B54", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^B77", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^I00", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^I01", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^I02", SIH1998$DIAG_PRINC), 1, SIH1998$ICSAPGroup)
# ICSAP Group 1 with 4 characters
ICSAP014 <- c("A150","A151","A152","A153","A154","A155","A156","A157","A158",
              "A159","A160","A161","A162","A163","A164","A165","A166","A167",
              "A168","A169","A170","A171","A172","A173","A174","A175","A176",
              "A177","A178","A179","G000")
# where CIDs has 4 characters
SIH1998$ICSAPGroup <- ifelse(SIH1998$DIAG_PRINC %in% ICSAP014, 1, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 1"
sum(SIH1998$ICSAPGroup == 1, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 2
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^A00", SIH1998$DIAG_PRINC), 2, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A01", SIH1998$DIAG_PRINC), 2, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A02", SIH1998$DIAG_PRINC), 2, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A03", SIH1998$DIAG_PRINC), 2, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A04", SIH1998$DIAG_PRINC), 2, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A05", SIH1998$DIAG_PRINC), 2, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A06", SIH1998$DIAG_PRINC), 2, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A07", SIH1998$DIAG_PRINC), 2, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A08", SIH1998$DIAG_PRINC), 2, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^A09", SIH1998$DIAG_PRINC), 2, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E86", SIH1998$DIAG_PRINC), 2, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 2"
sum(SIH1998$ICSAPGroup == 2, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 3
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^D50", SIH1998$DIAG_PRINC), 3, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 3"
sum(SIH1998$ICSAPGroup == 3, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 4
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^E40", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E41", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E42", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E43", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E44", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E45", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E46", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E50", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E51", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E52", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E53", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E54", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E55", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E56", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E57", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E58", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E59", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E60", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E61", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E62", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E63", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^E64", SIH1998$DIAG_PRINC), 4, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 4"
sum(SIH1998$ICSAPGroup == 4, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 5
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^H66", SIH1998$DIAG_PRINC), 5, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J00", SIH1998$DIAG_PRINC), 5, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J01", SIH1998$DIAG_PRINC), 5, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J02", SIH1998$DIAG_PRINC), 5, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J03", SIH1998$DIAG_PRINC), 5, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J06", SIH1998$DIAG_PRINC), 5, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J31", SIH1998$DIAG_PRINC), 5, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 5"
sum(SIH1998$ICSAPGroup == 5, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 6
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^J13", SIH1998$DIAG_PRINC), 6, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J14", SIH1998$DIAG_PRINC), 6, SIH1998$ICSAPGroup)
# ICSAP Group 6 with 4 characters
ICSAP064 <- c("J153","J154","J158","J159","J181")
# where CIDs has 4 characters
SIH1998$ICSAPGroup <- ifelse(SIH1998$DIAG_PRINC %in% ICSAP064, 6, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 6"
sum(SIH1998$ICSAPGroup == 6, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 7
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^J45", SIH1998$DIAG_PRINC), 7, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J46", SIH1998$DIAG_PRINC), 7, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 7"
sum(SIH1998$ICSAPGroup == 7, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 8
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^J20", SIH1998$DIAG_PRINC), 8, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J21", SIH1998$DIAG_PRINC), 8, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J40", SIH1998$DIAG_PRINC), 8, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J41", SIH1998$DIAG_PRINC), 8, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J42", SIH1998$DIAG_PRINC), 8, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J43", SIH1998$DIAG_PRINC), 8, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J44", SIH1998$DIAG_PRINC), 8, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J47", SIH1998$DIAG_PRINC), 8, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 8"
sum(SIH1998$ICSAPGroup == 8, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 9
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^I10", SIH1998$DIAG_PRINC), 9, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^I11", SIH1998$DIAG_PRINC), 9, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 9"
sum(SIH1998$ICSAPGroup == 9, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 10
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^I20", SIH1998$DIAG_PRINC), 10, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 10"
sum(SIH1998$ICSAPGroup == 10, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 11
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^I50", SIH1998$DIAG_PRINC), 11, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^J81", SIH1998$DIAG_PRINC), 11, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 11"
sum(SIH1998$ICSAPGroup == 11, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 12
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^G45", SIH1998$DIAG_PRINC), 12, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^G46", SIH1998$DIAG_PRINC), 12, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^I63", SIH1998$DIAG_PRINC), 12, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^I64", SIH1998$DIAG_PRINC), 12, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^I65", SIH1998$DIAG_PRINC), 12, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^I66", SIH1998$DIAG_PRINC), 12, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^I67", SIH1998$DIAG_PRINC), 12, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^I69", SIH1998$DIAG_PRINC), 12, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 12"
sum(SIH1998$ICSAPGroup == 12, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 13
# ICSAP Group 13 with 4 characters
ICSAP134 <- c("E100","E101","E102","E103","E104","E105","E106","E107","E108",
              "E109","E110","E111","E112","E113","E114","E115","E116","E117",
              "E118","E119","E120","E121","E122","E123","E124","E125","E126",
              "E127","E128","E129","E130","E131","E132","E133","E134","E135",
              "E136","E137","E138","E139","E140","E141","E142","E143","E144",
              "E145","E146","E147","E148","E149")
# where CIDs has 4 characters
SIH1998$ICSAPGroup <- ifelse(SIH1998$DIAG_PRINC %in% ICSAP134, 13, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 13"
sum(SIH1998$ICSAPGroup == 13, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 14
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^G40", SIH1998$DIAG_PRINC), 14, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^G41", SIH1998$DIAG_PRINC), 14, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 14"
sum(SIH1998$ICSAPGroup == 14, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 15
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^N10", SIH1998$DIAG_PRINC), 15, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^N11", SIH1998$DIAG_PRINC), 15, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^N12", SIH1998$DIAG_PRINC), 15, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^N30", SIH1998$DIAG_PRINC), 15, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^N34", SIH1998$DIAG_PRINC), 15, SIH1998$ICSAPGroup)
# ICSAP Group 15 with 4 characters
ICSAP154 <- c("N390")
# where CIDs has 4 characters
SIH1998$ICSAPGroup <- ifelse(SIH1998$DIAG_PRINC %in% ICSAP154, 15, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 15"
sum(SIH1998$ICSAPGroup == 15, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 16
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^A46", SIH1998$DIAG_PRINC), 16, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^L01", SIH1998$DIAG_PRINC), 16, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^L02", SIH1998$DIAG_PRINC), 16, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^L03", SIH1998$DIAG_PRINC), 16, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^L04", SIH1998$DIAG_PRINC), 16, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^L08", SIH1998$DIAG_PRINC), 16, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 16"
sum(SIH1998$ICSAPGroup == 16, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 17
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^N70", SIH1998$DIAG_PRINC), 17, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^N71", SIH1998$DIAG_PRINC), 17, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^N72", SIH1998$DIAG_PRINC), 17, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^N73", SIH1998$DIAG_PRINC), 17, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^N75", SIH1998$DIAG_PRINC), 17, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^N76", SIH1998$DIAG_PRINC), 17, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 17"
sum(SIH1998$ICSAPGroup == 17, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 18
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^K25", SIH1998$DIAG_PRINC), 18, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^K26", SIH1998$DIAG_PRINC), 18, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^K27", SIH1998$DIAG_PRINC), 18, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^K28", SIH1998$DIAG_PRINC), 18, SIH1998$ICSAPGroup)
# ICSAP Group 18 with 4 characters
ICSAP184 <- c("K920","K921","K922")
# where CIDs has 4 characters
SIH1998$ICSAPGroup <- ifelse(SIH1998$DIAG_PRINC %in% ICSAP184, 18, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 18"
sum(SIH1998$ICSAPGroup == 18, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

# create "ICSAPGroup" - Group 19
# where CIDs has 3 characters
SIH1998$ICSAPGroup <- ifelse(grepl("^A50", SIH1998$DIAG_PRINC), 19, SIH1998$ICSAPGroup)
SIH1998$ICSAPGroup <- ifelse(grepl("^O23", SIH1998$DIAG_PRINC), 19, SIH1998$ICSAPGroup)
# ICSAP Group 19 with 4 characters
ICSAP194 <- c("P350")
# where CIDs has 4 characters
SIH1998$ICSAPGroup <- ifelse(SIH1998$DIAG_PRINC %in% ICSAP194, 19, SIH1998$ICSAPGroup)
# check variable building
table(SIH1998$ICSAPGroup, exclude = NULL)
# proportion of "Group 19"
sum(SIH1998$ICSAPGroup == 19, na.rm = TRUE) / sum(SIH1998$ICSAP == 1)

########################## CREATE VARIABLE "ICSAPDiag" #########################

# create ICSAPDiag
SIH1998$ICSAPDiag <- NA
# coqueluche
SIH1998$ICSAPDiag <- ifelse(grepl("^A37", SIH1998$DIAG_PRINC), "coqueluche", SIH1998$ICSAPDiag)
# difteria
SIH1998$ICSAPDiag <- ifelse(grepl("^A36", SIH1998$DIAG_PRINC), "difteria", SIH1998$ICSAPDiag)
# tetano
SIH1998$ICSAPDiag <- ifelse(grepl("^A33", SIH1998$DIAG_PRINC), "tetano", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A34", SIH1998$DIAG_PRINC), "tetano", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A35", SIH1998$DIAG_PRINC), "tetano", SIH1998$ICSAPDiag)
# parotidite
SIH1998$ICSAPDiag <- ifelse(grepl("^B26", SIH1998$DIAG_PRINC), "parotidite", SIH1998$ICSAPDiag)
# rubeola
SIH1998$ICSAPDiag <- ifelse(grepl("^B06", SIH1998$DIAG_PRINC), "rubeola", SIH1998$ICSAPDiag)
# sarampo
SIH1998$ICSAPDiag <- ifelse(grepl("^B05", SIH1998$DIAG_PRINC), "sarampo", SIH1998$ICSAPDiag)
# febre amarela
SIH1998$ICSAPDiag <- ifelse(grepl("^A95", SIH1998$DIAG_PRINC), "febre amarela", SIH1998$ICSAPDiag)
# hepatite B
SIH1998$ICSAPDiag <- ifelse(grepl("^B16", SIH1998$DIAG_PRINC), "hepatite b", SIH1998$ICSAPDiag)
# meningite por haemophilus
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC == "G000", "meningite por haemophilus", SIH1998$ICSAPDiag)
# meningite tuberculosa
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC == "A170", "meningite tuberculosa", SIH1998$ICSAPDiag)
# tuberculose miliar
SIH1998$ICSAPDiag <- ifelse(grepl("^A19", SIH1998$DIAG_PRINC), "tuberculose miliar", SIH1998$ICSAPDiag)
# tuberculose pulmonar
tubpul <- c("A150","A151","A151","A152","A153","A160","A161","A162","A154","A155",
            "A156","A157","A158","A159","A163","A164","A165","A166","A167","A168",
            "A169","A171","A172","A173","A174","A175","A176","A177","A178","A179")
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC %in% tubpul, "tuberculose pulmonar", SIH1998$ICSAPDiag)
# outras tuberculoses
SIH1998$ICSAPDiag <- ifelse(grepl("^A18", SIH1998$DIAG_PRINC), "outras tuberculoses", SIH1998$ICSAPDiag)
# febre reumatica
SIH1998$ICSAPDiag <- ifelse(grepl("^I00", SIH1998$DIAG_PRINC), "febre reumatica", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^I01", SIH1998$DIAG_PRINC), "febre reumatica", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^I02", SIH1998$DIAG_PRINC), "febre reumatica", SIH1998$ICSAPDiag)
# sifilis
SIH1998$ICSAPDiag <- ifelse(grepl("^A51", SIH1998$DIAG_PRINC), "sifilis", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A52", SIH1998$DIAG_PRINC), "sifilis", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A53", SIH1998$DIAG_PRINC), "sifilis", SIH1998$ICSAPDiag)
# malaria
SIH1998$ICSAPDiag <- ifelse(grepl("^B50", SIH1998$DIAG_PRINC), "malaria", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^B51", SIH1998$DIAG_PRINC), "malaria", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^B52", SIH1998$DIAG_PRINC), "malaria", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^B53", SIH1998$DIAG_PRINC), "malaria", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^B54", SIH1998$DIAG_PRINC), "malaria", SIH1998$ICSAPDiag)
# ascaridiase
SIH1998$ICSAPDiag <- ifelse(grepl("^B77", SIH1998$DIAG_PRINC), "ascaridiase", SIH1998$ICSAPDiag)
# desidratacao
SIH1998$ICSAPDiag <- ifelse(grepl("^E86", SIH1998$DIAG_PRINC), "desidratacao", SIH1998$ICSAPDiag)
# gastroenterites
SIH1998$ICSAPDiag <- ifelse(grepl("^A00", SIH1998$DIAG_PRINC), "gastroenterites", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A01", SIH1998$DIAG_PRINC), "gastroenterites", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A02", SIH1998$DIAG_PRINC), "gastroenterites", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A03", SIH1998$DIAG_PRINC), "gastroenterites", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A04", SIH1998$DIAG_PRINC), "gastroenterites", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A05", SIH1998$DIAG_PRINC), "gastroenterites", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A06", SIH1998$DIAG_PRINC), "gastroenterites", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A07", SIH1998$DIAG_PRINC), "gastroenterites", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A08", SIH1998$DIAG_PRINC), "gastroenterites", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^A09", SIH1998$DIAG_PRINC), "gastroenterites", SIH1998$ICSAPDiag)
# anemia por deficiencia de ferro
SIH1998$ICSAPDiag <- ifelse(grepl("^D50", SIH1998$DIAG_PRINC), "anemia por deficiencia de ferro", SIH1998$ICSAPDiag)
# kwashiokor e outras formas de desnutricao proteico calorica
SIH1998$ICSAPDiag <- ifelse(grepl("^E40", SIH1998$DIAG_PRINC), "kwashiokor e outras formas de desnutricao proteico calorica", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E41", SIH1998$DIAG_PRINC), "kwashiokor e outras formas de desnutricao proteico calorica", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E42", SIH1998$DIAG_PRINC), "kwashiokor e outras formas de desnutricao proteico calorica", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E43", SIH1998$DIAG_PRINC), "kwashiokor e outras formas de desnutricao proteico calorica", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E44", SIH1998$DIAG_PRINC), "kwashiokor e outras formas de desnutricao proteico calorica", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E45", SIH1998$DIAG_PRINC), "kwashiokor e outras formas de desnutricao proteico calorica", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E46", SIH1998$DIAG_PRINC), "kwashiokor e outras formas de desnutricao proteico calorica", SIH1998$ICSAPDiag)
# outras deficiencias nutricionais
SIH1998$ICSAPDiag <- ifelse(grepl("^E50", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E51", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E52", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E53", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E54", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E55", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E56", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E57", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E58", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E59", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E60", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E61", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E62", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E63", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^E64", SIH1998$DIAG_PRINC), "outras deficiencias nutricionais", SIH1998$ICSAPDiag)
# otite media supurativa
SIH1998$ICSAPDiag <- ifelse(grepl("^H66", SIH1998$DIAG_PRINC), "otite media supurativa", SIH1998$ICSAPDiag)
# nasofaringite aguda [resfriado comum]
SIH1998$ICSAPDiag <- ifelse(grepl("^J00", SIH1998$DIAG_PRINC), "nasofaringite aguda [resfriado comum]", SIH1998$ICSAPDiag)
# sinusite aguda
SIH1998$ICSAPDiag <- ifelse(grepl("^J01", SIH1998$DIAG_PRINC), "sinusite aguda", SIH1998$ICSAPDiag)
# faringite aguda
SIH1998$ICSAPDiag <- ifelse(grepl("^J02", SIH1998$DIAG_PRINC), "faringite aguda", SIH1998$ICSAPDiag)
# amigdalite aguda
SIH1998$ICSAPDiag <- ifelse(grepl("^J03", SIH1998$DIAG_PRINC), "amigdalite aguda", SIH1998$ICSAPDiag)
# infeccao aguda VAS
SIH1998$ICSAPDiag <- ifelse(grepl("^J06", SIH1998$DIAG_PRINC), "infeccao aguda VAS", SIH1998$ICSAPDiag)
# rinite, nasofaringite e faringite cronicas
SIH1998$ICSAPDiag <- ifelse(grepl("^J31", SIH1998$DIAG_PRINC), "rinite, nasofaringite e faringite cronicas", SIH1998$ICSAPDiag)
# pneumonia pneumococica
SIH1998$ICSAPDiag <- ifelse(grepl("^J13", SIH1998$DIAG_PRINC), "pneumonia pneumococica", SIH1998$ICSAPDiag)
# pneumonia por haemophilus infuenzae
SIH1998$ICSAPDiag <- ifelse(grepl("^J14", SIH1998$DIAG_PRINC), "pneumonia por haemophilus infuenzae", SIH1998$ICSAPDiag)
# pneumonia por streptococus
pneumostrep <- c("J153","J154") 
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC %in% pneumostrep, "pneumonia por streptococus", SIH1998$ICSAPDiag)
# pneumonia bacteriana NE
pneumobac <- c("J158","J159") 
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC %in% pneumobac, "pneumonia bacteriana NE", SIH1998$ICSAPDiag)
# pneumonia lobar NE
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC == "J181", "pneumonia lobar NE", SIH1998$ICSAPDiag)
# asma
SIH1998$ICSAPDiag <- ifelse(grepl("^J45", SIH1998$DIAG_PRINC), "asma", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^J46", SIH1998$DIAG_PRINC), "asma", SIH1998$ICSAPDiag)
# bronquite aguda
SIH1998$ICSAPDiag <- ifelse(grepl("^J20", SIH1998$DIAG_PRINC), "bronquite aguda", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^J21", SIH1998$DIAG_PRINC), "bronquite aguda", SIH1998$ICSAPDiag)
# bronquite nao especificada como aguda ou cronica
SIH1998$ICSAPDiag <- ifelse(grepl("^J40", SIH1998$DIAG_PRINC), "bronquite nao especificada como aguda ou cronica", SIH1998$ICSAPDiag)
# bronquite cronica simples e a mucopurulenta
SIH1998$ICSAPDiag <- ifelse(grepl("^J41", SIH1998$DIAG_PRINC), "bronquite cronica simples e a mucopurulenta", SIH1998$ICSAPDiag)
# bronquite cronica nao especificada
SIH1998$ICSAPDiag <- ifelse(grepl("^J42", SIH1998$DIAG_PRINC), "bronquite cronica nao especificada", SIH1998$ICSAPDiag)
# enfisema
SIH1998$ICSAPDiag <- ifelse(grepl("^J43", SIH1998$DIAG_PRINC), "enfisema", SIH1998$ICSAPDiag)
# bronquectasia
SIH1998$ICSAPDiag <- ifelse(grepl("^J47", SIH1998$DIAG_PRINC), "bronquectasia", SIH1998$ICSAPDiag)
# outras doencas pulmonares obstrutivas cronicas
SIH1998$ICSAPDiag <- ifelse(grepl("^J44", SIH1998$DIAG_PRINC), "outras doencas pulmonares obstrutivas cronicas", SIH1998$ICSAPDiag)
# hipertensao essencial
SIH1998$ICSAPDiag <- ifelse(grepl("^I10", SIH1998$DIAG_PRINC), "hipertensao essencial", SIH1998$ICSAPDiag)
# doenca cardiaca hipertensiva
SIH1998$ICSAPDiag <- ifelse(grepl("^I11", SIH1998$DIAG_PRINC), "doenca cardiaca hipertensiva", SIH1998$ICSAPDiag)
# angina pectoris
SIH1998$ICSAPDiag <- ifelse(grepl("^I20", SIH1998$DIAG_PRINC), "angina pectoris", SIH1998$ICSAPDiag)
# insuficiencia cardiaca
SIH1998$ICSAPDiag <- ifelse(grepl("^I50", SIH1998$DIAG_PRINC), "insuficiencia cardiaca", SIH1998$ICSAPDiag)
# edema agudo de pulmao
SIH1998$ICSAPDiag <- ifelse(grepl("^J81", SIH1998$DIAG_PRINC), "edema agudo de pulmao", SIH1998$ICSAPDiag)
# doencas cerebrovasculares
SIH1998$ICSAPDiag <- ifelse(grepl("^I63", SIH1998$DIAG_PRINC), "doencas cerebrovasculares", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^I64", SIH1998$DIAG_PRINC), "doencas cerebrovasculares", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^I65", SIH1998$DIAG_PRINC), "doencas cerebrovasculares", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^I66", SIH1998$DIAG_PRINC), "doencas cerebrovasculares", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^I67", SIH1998$DIAG_PRINC), "doencas cerebrovasculares", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^I69", SIH1998$DIAG_PRINC), "doencas cerebrovasculares", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^G45", SIH1998$DIAG_PRINC), "doencas cerebrovasculares", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^G46", SIH1998$DIAG_PRINC), "doencas cerebrovasculares", SIH1998$ICSAPDiag)
# diabetes melitus com coma ou cetoacidose
dmcomcoma <- c("E100","E101","E110","E111","E120","E121","E130","E131","E140","E141")
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC %in% dmcomcoma, "diabetes melitus com coma ou cetoacidose", SIH1998$ICSAPDiag)
# diabetes melitus com complicacoes
diabcomcompli <- c("E102","E103","E104","E105","E106","E107","E108","E112","E113",
                   "E114","E115","E116","E117","E118","E122","E123","E124","E125",
                   "E126","E127","E128","E132","E133","E134","E135","E136","E137",
                   "E138","E142","E143","E144","E145","E146","E147","E148")
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC %in% diabcomcompli, "diabetes melitus com complicacoes", SIH1998$ICSAPDiag)
# diabetes melitus sem complicacoes especificas
diabsemcompli <- c("E109","E119","E129","E139","E149")
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC %in% diabsemcompli, "diabetes melitus sem complicacoes especificas", SIH1998$ICSAPDiag)
# eplepsias
SIH1998$ICSAPDiag <- ifelse(grepl("^G40", SIH1998$DIAG_PRINC), "eplepsias", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^G41", SIH1998$DIAG_PRINC), "eplepsias", SIH1998$ICSAPDiag)
# nefrite tubulo-intersticial aguda
SIH1998$ICSAPDiag <- ifelse(grepl("^N10", SIH1998$DIAG_PRINC), "nefrite tubulo-intersticial aguda", SIH1998$ICSAPDiag)
# nefrite tubulo-intersticial cronica
SIH1998$ICSAPDiag <- ifelse(grepl("^N11", SIH1998$DIAG_PRINC), "nefrite tubulo-intersticial cronica", SIH1998$ICSAPDiag)
# nefrite tubulo-intersticial NE aguda cronica
SIH1998$ICSAPDiag <- ifelse(grepl("^N12", SIH1998$DIAG_PRINC), "nefrite tubulo-intersticial NE aguda cronica", SIH1998$ICSAPDiag)
# cistite
SIH1998$ICSAPDiag <- ifelse(grepl("^N30", SIH1998$DIAG_PRINC), "cistite", SIH1998$ICSAPDiag)
# uretrite
SIH1998$ICSAPDiag <- ifelse(grepl("^N34", SIH1998$DIAG_PRINC), "uretrite", SIH1998$ICSAPDiag)
# infeccao do trato urinario de localizacao NE
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC == "N390", "infeccao do trato urinario de localizacao NE", SIH1998$ICSAPDiag)
# erisipela
SIH1998$ICSAPDiag <- ifelse(grepl("^A46", SIH1998$DIAG_PRINC), "erisipela", SIH1998$ICSAPDiag)
# impetigo
SIH1998$ICSAPDiag <- ifelse(grepl("^L01", SIH1998$DIAG_PRINC), "impetigo", SIH1998$ICSAPDiag)
# abscesso cutaneo furunculo e carbunculo
SIH1998$ICSAPDiag <- ifelse(grepl("^L02", SIH1998$DIAG_PRINC), "abscesso cutaneo furunculo e carbunculo", SIH1998$ICSAPDiag)
# celulite
SIH1998$ICSAPDiag <- ifelse(grepl("^L03", SIH1998$DIAG_PRINC), "celulite", SIH1998$ICSAPDiag)
# linfadenite aguda
SIH1998$ICSAPDiag <- ifelse(grepl("^L04", SIH1998$DIAG_PRINC), "linfadenite aguda", SIH1998$ICSAPDiag)
# outras infeccoes localizadas na pele e tecido subcutaneo
SIH1998$ICSAPDiag <- ifelse(grepl("^L08", SIH1998$DIAG_PRINC), "outras infeccoes localizadas na pele e tecido subcutaneo", SIH1998$ICSAPDiag)
# salpingite e ooforite
SIH1998$ICSAPDiag <- ifelse(grepl("^N70", SIH1998$DIAG_PRINC), "salpingite e ooforite", SIH1998$ICSAPDiag)
# doenca inflamatoria do utero exceto o colo
SIH1998$ICSAPDiag <- ifelse(grepl("^N71", SIH1998$DIAG_PRINC), "doenca inflamatoria do utero exceto o colo", SIH1998$ICSAPDiag)
# doenca inflamatoria do colo do utero
SIH1998$ICSAPDiag <- ifelse(grepl("^N72", SIH1998$DIAG_PRINC), "doenca inflamatoria do colo do utero", SIH1998$ICSAPDiag)
# outras doencas inflamatorias pelvicas femininas
SIH1998$ICSAPDiag <- ifelse(grepl("^N73", SIH1998$DIAG_PRINC), "outras doencas inflamatorias pelvicas femininas", SIH1998$ICSAPDiag)
# doencas da glandula de bartholin
SIH1998$ICSAPDiag <- ifelse(grepl("^N75", SIH1998$DIAG_PRINC), "doencas da glandula de bartholin", SIH1998$ICSAPDiag)
# outras afeccoes inflamatorias da vagina e da vulva
SIH1998$ICSAPDiag <- ifelse(grepl("^N76", SIH1998$DIAG_PRINC), "outras afeccoes inflamatorias da vagina e da vulva", SIH1998$ICSAPDiag)
# ulcera gastrointestinal
SIH1998$ICSAPDiag <- ifelse(grepl("^K25", SIH1998$DIAG_PRINC), "ulcera gastrointestinal", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^K26", SIH1998$DIAG_PRINC), "ulcera gastrointestinal", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^K27", SIH1998$DIAG_PRINC), "ulcera gastrointestinal", SIH1998$ICSAPDiag)
SIH1998$ICSAPDiag <- ifelse(grepl("^K28", SIH1998$DIAG_PRINC), "ulcera gastrointestinal", SIH1998$ICSAPDiag)
ulcera <- c("K920","K921","K922")
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC %in% ulcera, "ulcera gastrointestinal", SIH1998$ICSAPDiag)
# infeccao no trato urinario na gravidez
SIH1998$ICSAPDiag <- ifelse(grepl("^O23", SIH1998$DIAG_PRINC), "infeccao no trato urinario na gravidez", SIH1998$ICSAPDiag)
# sifilis congenita
SIH1998$ICSAPDiag <- ifelse(grepl("^A50", SIH1998$DIAG_PRINC), "sifilis congenita", SIH1998$ICSAPDiag)
# sindrome da rubeola congenita
SIH1998$ICSAPDiag <- ifelse(SIH1998$DIAG_PRINC == "P350", "sindrome da rubeola congenita", SIH1998$ICSAPDiag)

########################### CREATE VARIABLE AgeGroup ###########################

SIH1998$AgeGroup <- length(SIH1998$IDADE)
SIH1998$AgeGroup <- ifelse(SIH1998$IDADE == 0, "Menor que 1a", SIH1998$AgeGroup)
SIH1998$AgeGroup <- ifelse(SIH1998$IDADE >= 1 & SIH1998$IDADE <= 9, "1 a 9a", SIH1998$AgeGroup)
SIH1998$AgeGroup <- ifelse(SIH1998$IDADE >= 10 & SIH1998$IDADE <= 19, "10 a 19a", SIH1998$AgeGroup)
SIH1998$AgeGroup <- ifelse(SIH1998$IDADE >= 20 & SIH1998$IDADE <= 59, "20 a 59a", SIH1998$AgeGroup)
SIH1998$AgeGroup <- ifelse(SIH1998$IDADE >= 60, "60a ou mais", SIH1998$AgeGroup)
SIH1998$AgeGroup <- factor(SIH1998$AgeGroup, levels = c("Menor que 1a", 
                                                        "1 a 9a", 
                                                        "10 a 19a", 
                                                        "20 a 59a", 
                                                        "60a ou mais"))

############################### BUILD DATA FRAME ###############################

Year <- 1998
ICSAPNumTotal <- sum(SIH1998$ICSAP)
ITNumTotal <- length(SIH1998$SEXO)
ICSAPPropTotal <- ICSAPNumTotal / ITNumTotal
ICSAPNumHomem <- sum(SIH1998[SIH1998$SEXO==1,]$ICSAP)
ITNumHomem <- sum(SIH1998$SEXO==1)
ICSAPPropHomem <- ICSAPNumHomem / ITNumHomem
ICSAPNumMulher <- sum(SIH1998[SIH1998$SEXO==2,]$ICSAP) + sum(SIH1998[SIH1998$SEXO==3,]$ICSAP)
ITNumMulher <- sum(SIH1998$SEXO==2) + sum(SIH1998$SEXO==3)
ICSAPPropMulher <- ICSAPNumMulher / ITNumMulher
ICSAPNumNoSex <- sum(SIH1998[SIH1998$SEXO==0,]$ICSAP) + sum(SIH1998[SIH1998$SEXO==7,]$ICSAP)
ITNumNoSex <- sum(SIH1998$SEXO==0) + sum(SIH1998$SEXO==7)
ICSAPPropNoSex <- ICSAPNumNoSex / ITNumNoSex
ICSAPNumMenor1a <- sum(SIH1998[SIH1998$AgeGroup == "Menor que 1a",]$ICSAP)
ITNumMenor1a <- sum(SIH1998$AgeGroup == "Menor que 1a")
ICSAPPropMenor1a <- ICSAPNumMenor1a / ITNumMenor1a
ICSAPNum1a9a <- sum(SIH1998[SIH1998$AgeGroup == "1 a 9a",]$ICSAP)
ITNum1a9a <- sum(SIH1998$AgeGroup == "1 a 9a")
ICSAPProp1a9a <- ICSAPNum1a9a / ITNum1a9a
ICSAPNum10a19a <- sum(SIH1998[SIH1998$AgeGroup == "10 a 19a",]$ICSAP)
ITNum10a19a <- sum(SIH1998$AgeGroup == "10 a 19a")
ICSAPProp10a19a <- ICSAPNum10a19a / ITNum10a19a
ICSAPNum20a59a <- sum(SIH1998[SIH1998$AgeGroup == "20 a 59a",]$ICSAP)
ITNum20a59a <- sum(SIH1998$AgeGroup == "20 a 59a")
ICSAPProp20a59a <- ICSAPNum20a59a / ITNum20a59a
ICSAPNum60aMais <- sum(SIH1998[SIH1998$AgeGroup == "60a ou mais",]$ICSAP)
ITNum60aMais <- sum(SIH1998$AgeGroup == "60a ou mais")
ICSAPProp60aMais <- ICSAPNum60aMais / ITNum60aMais

df1998 <- data.frame(Year, ICSAPNumTotal, ITNumTotal, ICSAPPropTotal, ICSAPNumHomem, ITNumHomem, ICSAPPropHomem,
                     ICSAPNumMulher, ITNumMulher, ICSAPPropMulher, ICSAPNumNoSex, ITNumNoSex, ICSAPPropNoSex,
                     ICSAPNumMenor1a, ITNumMenor1a, ICSAPPropMenor1a, ICSAPNum1a9a, ITNum1a9a, ICSAPProp1a9a,
                     ICSAPNum10a19a, ITNum10a19a, ICSAPProp10a19a, ICSAPNum20a59a, ITNum20a59a, ICSAPProp20a59a,
                     ICSAPNum60aMais, ITNum60aMais, ICSAPProp60aMais)



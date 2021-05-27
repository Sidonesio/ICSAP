
############################## PREPARE WORKSPACE ###############################

# set working directory
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC"
setwd(wd1)
getwd()

# clean everything done before
rm(list=ls())

# clean just some objects
rm(AC2010,AL2010,AM2010,AP2010,BA2010,CE2010,DF2010,ES2010,GO2010,MA2010,MG2010,
   MS2010,MT2010,PA2010,PB2010,PE2010,PI2010,PR2010,RJ2010,RN2010,RO2010,RR2010,
   RS2010,SC2010,SE2010,SP2010,TO2010)

# expand memory
memory.size(max = FALSE)
memory.size(max = TRUE)
memory.limit(size = 9999999999999)

# packages' names
packages <- c("tidyverse", "read.dbc", "data.table")

# install packages if not installed yet
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# load packages
invisible(lapply(packages, library, character.only = TRUE))

################################## YEAR: 1992 ##################################

# first data loading - select variables
ano_ref <- "92"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1992 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH1992 <- SIH1992 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH1992 <- rbind(SIH1992, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - all variables
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "92"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1992 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SIH1992 <- rbind(SIH1992, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH1992, file ="./SIH1992.csv")

# second data loading
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH1992 <- read.csv2(unz("./SIH1992.zip", "SIH1992.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH1992 <- as.data.frame(cbind(1992, t(dim(SIH1992))))
library(data.table)
setnames(dimSIH1992, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH1992, file ="./dimSIH1992.csv")

# build and export data set of column names
colnamesSIH1992 <- as.data.frame(colnames(SIH1992))
colnames(colnamesSIH1992)[1] <- "1992"
write.csv2(colnamesSIH1992, file ="./colnamesSIH1992.csv")

################################## YEAR: 1993 ##################################

# first data loading - select variables
ano_ref <- "93"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1993 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH1993 <- SIH1993 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH1993 <- rbind(SIH1993, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - all variables
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "93"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1993 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SIH1993 <- rbind(SIH1993, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH1993, file ="./SIH1993.csv")

# second data loading
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH1993 <- read.csv2(unz("./SIH1993.zip", "SIH1993.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH1993 <- as.data.frame(cbind(1993, t(dim(SIH1993))))
library(data.table)
setnames(dimSIH1993, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH1993, file ="./dimSIH1993.csv")

# build and export data set of column names
colnamesSIH1993 <- as.data.frame(colnames(SIH1993))
colnames(colnamesSIH1993)[1] <- "1993"
write.csv2(colnamesSIH1993, file ="./colnamesSIH1993.csv")

################################## YEAR: 1994 ##################################

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP94"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP1994 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP1994 <- rbind(SP1994, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - month: december
SP_Dez <- read.dbc("./RDSP9412.dbc")

# view column names on both data sets
colnames(AC1994)
colnames(AC_Dez)

# equal column name
names(SP_Dez)[19] <- "VAL_SANGUE"

# merge all months
SP1994 <- as.data.frame(rbind(SP1994,SP_Dez))

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP1994, file ="./SP1994.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC1994 <- read.csv2("./AC1994.csv", header=TRUE, sep=";")
AL1994 <- read.csv2("./AL1994.csv", header=TRUE, sep=";")
AM1994 <- read.csv2("./AM1994.csv", header=TRUE, sep=";")
AP1994 <- read.csv2("./AP1994.csv", header=TRUE, sep=";")
BA1994 <- read.csv2("./BA1994.csv", header=TRUE, sep=";")
CE1994 <- read.csv2("./CE1994.csv", header=TRUE, sep=";")
DF1994 <- read.csv2("./DF1994.csv", header=TRUE, sep=";")
ES1994 <- read.csv2("./ES1994.csv", header=TRUE, sep=";")
GO1994 <- read.csv2("./GO1994.csv", header=TRUE, sep=";")
MA1994 <- read.csv2("./MA1994.csv", header=TRUE, sep=";")
MG1994 <- read.csv2("./MG1994.csv", header=TRUE, sep=";")
MS1994 <- read.csv2("./MS1994.csv", header=TRUE, sep=";")
MT1994 <- read.csv2("./MT1994.csv", header=TRUE, sep=";")
PA1994 <- read.csv2("./PA1994.csv", header=TRUE, sep=";")
PB1994 <- read.csv2("./PB1994.csv", header=TRUE, sep=";")
PE1994 <- read.csv2("./PE1994.csv", header=TRUE, sep=";")
PI1994 <- read.csv2("./PI1994.csv", header=TRUE, sep=";")
PR1994 <- read.csv2("./PR1994.csv", header=TRUE, sep=";")
RJ1994 <- read.csv2("./RJ1994.csv", header=TRUE, sep=";")
RN1994 <- read.csv2("./RN1994.csv", header=TRUE, sep=";")
RO1994 <- read.csv2("./RO1994.csv", header=TRUE, sep=";")
RR1994 <- read.csv2("./RR1994.csv", header=TRUE, sep=";")
RS1994 <- read.csv2("./RS1994.csv", header=TRUE, sep=";")
SC1994 <- read.csv2("./SC1994.csv", header=TRUE, sep=";")
SE1994 <- read.csv2("./SE1994.csv", header=TRUE, sep=";")
SP1994 <- read.csv2("./SP1994.csv", header=TRUE, sep=";")
TO1994 <- read.csv2("./TO1994.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH1994 <- as.data.frame(rbind(AC1994,AL1994,AM1994,AP1994,BA1994,CE1994,DF1994,
                               ES1994,GO1994,MA1994,MG1994,MS1994,MT1994,PA1994,
                               PB1994,PE1994,PI1994,PR1994,RJ1994,RN1994,RO1994,
                               RR1994,RS1994,SC1994,SE1994,SP1994,TO1994))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH1994, file ="./SIH1994.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH1994 <- read.csv2(unz("./SIH.zip", "SIH1994.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH1994 <- as.data.frame(cbind(1994, t(dim(SIH1994))))
library(data.table)
setnames(dimSIH1994, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH1994, file ="./dimSIH1994.csv")

# build and export data set of column names
colnamesSIH1994 <- as.data.frame(colnames(SIH1994))
colnames(colnamesSIH1994)[1] <- "1994"
write.csv2(colnamesSIH1994, file ="./colnamesSIH1994.csv")

################################## YEAR: 1995 ##################################

# first data loading - select variables
ano_ref <- "95"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1995 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH1995 <- SIH1995 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH1995 <- rbind(SIH1995, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - all variables
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "95"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1995 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SIH1995 <- rbind(SIH1995, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH1995, file ="./SIH1995.csv")

# second data loading
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH1995 <- read.csv2(unz("./SIH1995.zip", "SIH1995.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH1995 <- as.data.frame(cbind(1995, t(dim(SIH1995))))
library(data.table)
setnames(dimSIH1995, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH1995, file ="./dimSIH1995.csv")

# build and export data set of column names
colnamesSIH1995 <- as.data.frame(colnames(SIH1995))
colnames(colnamesSIH1995)[1] <- "1995"
write.csv2(colnamesSIH1995, file ="./colnamesSIH1995.csv")

################################## YEAR: 1996 ##################################

# first data loading - select variables
ano_ref <- "96"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1996 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH1996 <- SIH1996 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH1996 <- rbind(SIH1996, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP96"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP1996 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP1996 <- rbind(SP1996, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP1996, file ="./SP1996.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC1996 <- read.csv2("./AC1996.csv", header=TRUE, sep=";")
AL1996 <- read.csv2("./AL1996.csv", header=TRUE, sep=";")
AM1996 <- read.csv2("./AM1996.csv", header=TRUE, sep=";")
AP1996 <- read.csv2("./AP1996.csv", header=TRUE, sep=";")
BA1996 <- read.csv2("./BA1996.csv", header=TRUE, sep=";")
CE1996 <- read.csv2("./CE1996.csv", header=TRUE, sep=";")
DF1996 <- read.csv2("./DF1996.csv", header=TRUE, sep=";")
ES1996 <- read.csv2("./ES1996.csv", header=TRUE, sep=";")
GO1996 <- read.csv2("./GO1996.csv", header=TRUE, sep=";")
MA1996 <- read.csv2("./MA1996.csv", header=TRUE, sep=";")
MG1996 <- read.csv2("./MG1996.csv", header=TRUE, sep=";")
MS1996 <- read.csv2("./MS1996.csv", header=TRUE, sep=";")
MT1996 <- read.csv2("./MT1996.csv", header=TRUE, sep=";")
PA1996 <- read.csv2("./PA1996.csv", header=TRUE, sep=";")
PB1996 <- read.csv2("./PB1996.csv", header=TRUE, sep=";")
PE1996 <- read.csv2("./PE1996.csv", header=TRUE, sep=";")
PI1996 <- read.csv2("./PI1996.csv", header=TRUE, sep=";")
PR1996 <- read.csv2("./PR1996.csv", header=TRUE, sep=";")
RJ1996 <- read.csv2("./RJ1996.csv", header=TRUE, sep=";")
RN1996 <- read.csv2("./RN1996.csv", header=TRUE, sep=";")
RO1996 <- read.csv2("./RO1996.csv", header=TRUE, sep=";")
RR1996 <- read.csv2("./RR1996.csv", header=TRUE, sep=";")
RS1996 <- read.csv2("./RS1996.csv", header=TRUE, sep=";")
SC1996 <- read.csv2("./SC1996.csv", header=TRUE, sep=";")
SE1996 <- read.csv2("./SE1996.csv", header=TRUE, sep=";")
SP1996 <- read.csv2("./SP1996.csv", header=TRUE, sep=";")
TO1996 <- read.csv2("./TO1996.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH1996 <- as.data.frame(rbind(AC1996,AL1996,AM1996,AP1996,BA1996,CE1996,DF1996,
                               ES1996,GO1996,MA1996,MG1996,MS1996,MT1996,PA1996,
                               PB1996,PE1996,PI1996,PR1996,RJ1996,RN1996,RO1996,
                               RR1996,RS1996,SC1996,SE1996,SP1996,TO1996))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH1996, file ="./SIH1996.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH1996 <- read.csv2(unz("./SIH.zip", "SIH1996.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH1996 <- as.data.frame(cbind(1996, t(dim(SIH1996))))
library(data.table)
setnames(dimSIH1996, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH1996, file ="./dimSIH1996.csv")

# build and export data set of column names
colnamesSIH1996 <- as.data.frame(colnames(SIH1996))
colnames(colnamesSIH1996)[1] <- "1996"
write.csv2(colnamesSIH1996, file ="./colnamesSIH1996.csv")

################################## YEAR: 1997 ##################################

# first data loading - select variables
ano_ref <- "97"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1997 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH1997 <- SIH1997 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH1997 <- rbind(SIH1997, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - all variables
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "97"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1997 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SIH1997 <- rbind(SIH1997, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH1997, file ="./SIH1997.csv")

# second data loading
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH1997 <- read.csv2(unz("./SIH1997.zip", "SIH1997.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH1997 <- as.data.frame(cbind(1997, t(dim(SIH1997))))
library(data.table)
setnames(dimSIH1997, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH1997, file ="./dimSIH1997.csv")

# build and export data set of column names
colnamesSIH1997 <- as.data.frame(colnames(SIH1997))
colnames(colnamesSIH1997)[1] <- "1997"
write.csv2(colnamesSIH1997, file ="./colnamesSIH1997.csv")

################################## YEAR: 1998 ##################################

# first data loading - select variables
ano_ref <- "98"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1998 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH1998 <- SIH1998 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH1998 <- rbind(SIH1998, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - all variables
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "98"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1998 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SIH1998 <- rbind(SIH1998, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH1998, file ="./SIH1998.csv")

# second data loading
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH1998 <- read.csv2(unz("./SIH1998.zip", "SIH1998.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH1998 <- as.data.frame(cbind(1998, t(dim(SIH1998))))
library(data.table)
setnames(dimSIH1998, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH1998, file ="./dimSIH1998.csv")

# build and export data set of column names
colnamesSIH1998 <- as.data.frame(colnames(SIH1998))
colnames(colnamesSIH1998)[1] <- "1998"
write.csv2(colnamesSIH1998, file ="./colnamesSIH1998.csv")

################################## YEAR: 1999 ##################################

# first data loading - select columns
ano_ref <- "99"
arquivos <- data.frame(arquivos = list.files("C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1999 <- read.dbc(paste("C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/", i, sep=""))
    SIH1999 <- SIH1999 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH1999 <- rbind(SIH1999, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - all variables
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "99"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1999 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SIH1999 <- rbind(SIH1999, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH1999, file ="./SIH1999.csv")

# second data loading
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH1999 <- read.csv2(unz("./SIH1999.zip", "SIH1999.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH1999 <- as.data.frame(cbind(1999, t(dim(SIH1999))))
library(data.table)
setnames(dimSIH1999, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH1999, file ="./dimSIH1999.csv")

# build and export data set of column names
colnamesSIH1999 <- as.data.frame(colnames(SIH1999))
colnames(colnamesSIH1999)[1] <- "1999"
write.csv2(colnamesSIH1999, file ="./colnamesSIH1999.csv")

################################## YEAR: 2000 ##################################

# first data loading
ano_ref <- "00"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2000 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2000 <- SIH2000 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2000 <- rbind(SIH2000, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - all variables
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "00"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2000 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SIH2000 <- rbind(SIH2000, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2000, file ="./SIH2000.csv")

# second data loading
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2000 <- read.csv2(unz("./SIH2000.zip", "SIH2000.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2000 <- as.data.frame(cbind(2000, t(dim(SIH2000))))
library(data.table)
setnames(dimSIH2000, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2000, file ="./dimSIH2000.csv")

# build and export data set of column names
colnamesSIH2000 <- as.data.frame(colnames(SIH2000))
colnames(colnamesSIH2000)[1] <- "2000"
write.csv2(colnamesSIH2000, file ="./colnamesSIH2000.csv")

################################## YEAR: 2001 ##################################

# first data loading
ano_ref <- "01"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2001 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2001 <- SIH2001 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2001 <- rbind(SIH2001, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP01"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2001 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2001 <- rbind(SP2001, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2001, file ="./SP2001.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2001 <- read.csv2("./AC2001.csv", header=TRUE, sep=";")
AL2001 <- read.csv2("./AL2001.csv", header=TRUE, sep=";")
AM2001 <- read.csv2("./AM2001.csv", header=TRUE, sep=";")
AP2001 <- read.csv2("./AP2001.csv", header=TRUE, sep=";")
BA2001 <- read.csv2("./BA2001.csv", header=TRUE, sep=";")
CE2001 <- read.csv2("./CE2001.csv", header=TRUE, sep=";")
DF2001 <- read.csv2("./DF2001.csv", header=TRUE, sep=";")
ES2001 <- read.csv2("./ES2001.csv", header=TRUE, sep=";")
GO2001 <- read.csv2("./GO2001.csv", header=TRUE, sep=";")
MA2001 <- read.csv2("./MA2001.csv", header=TRUE, sep=";")
MG2001 <- read.csv2("./MG2001.csv", header=TRUE, sep=";")
MS2001 <- read.csv2("./MS2001.csv", header=TRUE, sep=";")
MT2001 <- read.csv2("./MT2001.csv", header=TRUE, sep=";")
PA2001 <- read.csv2("./PA2001.csv", header=TRUE, sep=";")
PB2001 <- read.csv2("./PB2001.csv", header=TRUE, sep=";")
PE2001 <- read.csv2("./PE2001.csv", header=TRUE, sep=";")
PI2001 <- read.csv2("./PI2001.csv", header=TRUE, sep=";")
PR2001 <- read.csv2("./PR2001.csv", header=TRUE, sep=";")
RJ2001 <- read.csv2("./RJ2001.csv", header=TRUE, sep=";")
RN2001 <- read.csv2("./RN2001.csv", header=TRUE, sep=";")
RO2001 <- read.csv2("./RO2001.csv", header=TRUE, sep=";")
RR2001 <- read.csv2("./RR2001.csv", header=TRUE, sep=";")
RS2001 <- read.csv2("./RS2001.csv", header=TRUE, sep=";")
SC2001 <- read.csv2("./SC2001.csv", header=TRUE, sep=";")
SE2001 <- read.csv2("./SE2001.csv", header=TRUE, sep=";")
SP2001 <- read.csv2("./SP2001.csv", header=TRUE, sep=";")
TO2001 <- read.csv2("./TO2001.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2001 <- as.data.frame(rbind(AC2001,AL2001,AM2001,AP2001,BA2001,CE2001,DF2001,
                               ES2001,GO2001,MA2001,MG2001,MS2001,MT2001,PA2001,
                               PB2001,PE2001,PI2001,PR2001,RJ2001,RN2001,RO2001,
                               RR2001,RS2001,SC2001,SE2001,SP2001,TO2001))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2001, file ="./SIH2001.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2001 <- read.csv2(unz("./SIH.zip", "SIH2001.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2001 <- as.data.frame(cbind(2001, t(dim(SIH2001))))
library(data.table)
setnames(dimSIH2001, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2001, file ="./dimSIH2001.csv")

# build and export data set of column names
colnamesSIH2001 <- as.data.frame(colnames(SIH2001))
colnames(colnamesSIH2001)[1] <- "2001"
write.csv2(colnamesSIH2001, file ="./colnamesSIH2001.csv")

################################## YEAR: 2002 ##################################

# first data loading
ano_ref <- "02"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2002 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2002 <- SIH2002 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2002 <- rbind(SIH2002, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "AL02"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    AL2002 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    AL2002 <- rbind(AL2002, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(AL2002, file ="./AC2002.csv")


# clean just some objects
rm(AC2010,AL2010,AM2010,AP2010,BA2010,CE2010,DF2010,ES2010,GO2010,MA2010,MG2010,
   MS2010,MT2010,PA2010,PB2010,PE2010,PI2010,PR2010,RJ2010,RN2010,RO2010,RR2010,
   RS2010,SC2010,SE2010,SP2010,TO2010)




# extract data
<<<<<<< HEAD
SIH2002 <- write.csv2(SIH2002, file ="./Banco de dados/csvs/SIH2002.csv")
=======
write.csv2(SIH2002, file ="./Banco de dados/SIH/SIH2002.csv")
>>>>>>> f6be449c2269f7fa92c4161faee5e90fe6a4ee85

# second data loading
SIH2002 <- read.csv2(unz("./Banco de dados/SIH1.zip", "SIH2002.csv"),
                     header=TRUE, sep=";")

################################## YEAR: 2003 ##################################

# first data loading
ano_ref <- "03"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2003 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2003 <- SIH2003 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2003 <- rbind(SIH2003, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "AC03"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    AC2003 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    AC2003 <- rbind(AC2003, temp)
  }
  print(i)
  cont=cont+1
}





# extract data
<<<<<<< HEAD
SIH2003 <- write.csv2(SIH2003, file ="./Banco de dados/csvs/SIH2003.csv")
=======
write.csv2(SIH2003, file ="./Banco de dados/SIH/SIH2003.csv")
>>>>>>> f6be449c2269f7fa92c4161faee5e90fe6a4ee85

# second data loading
SIH2003 <- read.csv2(unz("./Banco de dados/SIH1.zip", "SIH2003.csv"),
                     header=TRUE, sep=";")

################################## YEAR: 2004 ##################################

# first data loading
ano_ref <- "04"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "INSTRU", 
             "NUM_FILHOS", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "MORTE", 
              "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2004 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2004 <- SIH2004 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2004 <- rbind(SIH2004, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "AC04"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    AC2004 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    AC2004 <- rbind(AC2004, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2005, file ="./SP2005.csv")




# clean just some objects
rm(AC2010,AL2010,AM2010,AP2010,BA2010,CE2010,DF2010,ES2010,GO2010,MA2010,MG2010,
   MS2010,MT2010,PA2010,PB2010,PE2010,PI2010,PR2010,RJ2010,RN2010,RO2010,RR2010,
   RS2010,SC2010,SE2010,SP2010,TO2010)




# extract data
<<<<<<< HEAD
SIH2004 <- write.csv2(SIH2004, file ="./Banco de dados/csvs/SIH2004.csv")
=======
write.csv2(SIH2004, file ="./Banco de dados/SIH/SIH2004.csv")
>>>>>>> f6be449c2269f7fa92c4161faee5e90fe6a4ee85

# second data loading
SIH2004 <- read.csv2(unz("./Banco de dados/SIH1.zip", "SIH2004.csv"),
                     header=TRUE, sep=";")

################################## YEAR: 2005 ##################################

# first data loading
ano_ref <- "05"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE",  "INSTRU", 
             "NUM_FILHOS", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC",  "MORTE", 
            "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2005 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2005 <- SIH2005 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2005 <- rbind(SIH2005, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP05"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2005 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2005 <- rbind(SP2005, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2005, file ="./SP2005.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2005 <- read.csv2("./AC2005.csv", header=TRUE, sep=";")
AL2005 <- read.csv2("./AL2005.csv", header=TRUE, sep=";")
AM2005 <- read.csv2("./AM2005.csv", header=TRUE, sep=";")
AP2005 <- read.csv2("./AP2005.csv", header=TRUE, sep=";")
BA2005 <- read.csv2("./BA2005.csv", header=TRUE, sep=";")
CE2005 <- read.csv2("./CE2005.csv", header=TRUE, sep=";")
DF2005 <- read.csv2("./DF2005.csv", header=TRUE, sep=";")
ES2005 <- read.csv2("./ES2005.csv", header=TRUE, sep=";")
GO2005 <- read.csv2("./GO2005.csv", header=TRUE, sep=";")
MA2005 <- read.csv2("./MA2005.csv", header=TRUE, sep=";")
MG2005 <- read.csv2("./MG2005.csv", header=TRUE, sep=";")
MS2005 <- read.csv2("./MS2005.csv", header=TRUE, sep=";")
MT2005 <- read.csv2("./MT2005.csv", header=TRUE, sep=";")
PA2005 <- read.csv2("./PA2005.csv", header=TRUE, sep=";")
PB2005 <- read.csv2("./PB2005.csv", header=TRUE, sep=";")
PE2005 <- read.csv2("./PE2005.csv", header=TRUE, sep=";")
PI2005 <- read.csv2("./PI2005.csv", header=TRUE, sep=";")
PR2005 <- read.csv2("./PR2005.csv", header=TRUE, sep=";")
RJ2005 <- read.csv2("./RJ2005.csv", header=TRUE, sep=";")
RN2005 <- read.csv2("./RN2005.csv", header=TRUE, sep=";")
RO2005 <- read.csv2("./RO2005.csv", header=TRUE, sep=";")
RR2005 <- read.csv2("./RR2005.csv", header=TRUE, sep=";")
RS2005 <- read.csv2("./RS2005.csv", header=TRUE, sep=";")
SC2005 <- read.csv2("./SC2005.csv", header=TRUE, sep=";")
SE2005 <- read.csv2("./SE2005.csv", header=TRUE, sep=";")
SP2005 <- read.csv2("./SP2005.csv", header=TRUE, sep=";")
TO2005 <- read.csv2("./TO2005.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2005 <- as.data.frame(rbind(AC2005,AL2005,AM2005,AP2005,BA2005,CE2005,DF2005,
                               ES2005,GO2005,MA2005,MG2005,MS2005,MT2005,PA2005,
                               PB2005,PE2005,PI2005,PR2005,RJ2005,RN2005,RO2005,
                               RR2005,RS2005,SC2005,SE2005,SP2005,TO2005))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2005, file ="./SIH2005.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2005 <- read.csv2(unz("./SIH.zip", "SIH2005.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2005 <- as.data.frame(cbind(2005, t(dim(SIH2005))))
library(data.table)
setnames(dimSIH2005, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2005, file ="./dimSIH2005.csv")

# build and export data set of column names
colnamesSIH2005 <- as.data.frame(colnames(SIH2005))
colnames(colnamesSIH2005)[1] <- "2005"
write.csv2(colnamesSIH2005, file ="./colnamesSIH2005.csv")

################################## YEAR: 2006 ##################################

# first data loading
ano_ref <- "06"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "INSTRU", 
             "NUM_FILHOS",  "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC",  "MORTE", 
             "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2006 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2006 <- SIH2006 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2006 <- rbind(SIH2006, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "AC06"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    AC2006 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    AC2006 <- rbind(AC2006, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(AC2006, file ="./AC2006.csv")






# extract data
write.csv2(SIH2006, file ="./Banco de dados/csvs/SIH2006.csv")

# second data loading
SIH2006 <- read.csv2(unz("./Banco de dados/SIH2.zip", "SIH2006.csv"),
                     header=TRUE, sep=";")

################################## YEAR: 2007 ##################################

# first data loading
ano_ref <- "07"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2007 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2007 <- SIH2007 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2007 <- rbind(SIH2007, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP07"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2007 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2007 <- rbind(SP2007, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2007, file ="./SP2007.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2007 <- read.csv2("./AC2007.csv", header=TRUE, sep=";")
AL2007 <- read.csv2("./AL2007.csv", header=TRUE, sep=";")
AM2007 <- read.csv2("./AM2007.csv", header=TRUE, sep=";")
AP2007 <- read.csv2("./AP2007.csv", header=TRUE, sep=";")
BA2007 <- read.csv2("./BA2007.csv", header=TRUE, sep=";")
CE2007 <- read.csv2("./CE2007.csv", header=TRUE, sep=";")
DF2007 <- read.csv2("./DF2007.csv", header=TRUE, sep=";")
ES2007 <- read.csv2("./ES2007.csv", header=TRUE, sep=";")
GO2007 <- read.csv2("./GO2007.csv", header=TRUE, sep=";")
MA2007 <- read.csv2("./MA2007.csv", header=TRUE, sep=";")
MG2007 <- read.csv2("./MG2007.csv", header=TRUE, sep=";")
MS2007 <- read.csv2("./MS2007.csv", header=TRUE, sep=";")
MT2007 <- read.csv2("./MT2007.csv", header=TRUE, sep=";")
PA2007 <- read.csv2("./PA2007.csv", header=TRUE, sep=";")
PB2007 <- read.csv2("./PB2007.csv", header=TRUE, sep=";")
PE2007 <- read.csv2("./PE2007.csv", header=TRUE, sep=";")
PI2007 <- read.csv2("./PI2007.csv", header=TRUE, sep=";")
PR2007 <- read.csv2("./PR2007.csv", header=TRUE, sep=";")
RJ2007 <- read.csv2("./RJ2007.csv", header=TRUE, sep=";")
RN2007 <- read.csv2("./RN2007.csv", header=TRUE, sep=";")
RO2007 <- read.csv2("./RO2007.csv", header=TRUE, sep=";")
RR2007 <- read.csv2("./RR2007.csv", header=TRUE, sep=";")
RS2007 <- read.csv2("./RS2007.csv", header=TRUE, sep=";")
SC2007 <- read.csv2("./SC2007.csv", header=TRUE, sep=";")
SE2007 <- read.csv2("./SE2007.csv", header=TRUE, sep=";")
SP2007 <- read.csv2("./SP2007.csv", header=TRUE, sep=";")
TO2007 <- read.csv2("./TO2007.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2007 <- as.data.frame(rbind(AC2007,AL2007,AM2007,AP2007,BA2007,CE2007,DF2007,
                               ES2007,GO2007,MA2007,MG2007,MS2007,MT2007,PA2007,
                               PB2007,PE2007,PI2007,PR2007,RJ2007,RN2007,RO2007,
                               RR2007,RS2007,SC2007,SE2007,SP2007,TO2007))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2007, file ="./SIH2007.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2007 <- read.csv2(unz("./SIH.zip", "SIH2007.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2007 <- as.data.frame(cbind(2007, t(dim(SIH2007))))
library(data.table)
setnames(dimSIH2007, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2007, file ="./dimSIH2007.csv")

# build and export data set of column names
colnamesSIH2007 <- as.data.frame(colnames(SIH2007))
colnames(colnamesSIH2007)[1] <- "2007"
write.csv2(colnamesSIH2007, file ="./colnamesSIH2007.csv")

################################## YEAR: 2008 ##################################

# first data loading
ano_ref <- "08"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2008 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2008 <- SIH2008 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2008 <- rbind(SIH2008, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP08"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2008 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2008 <- rbind(SP2008, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2008, file ="./SP2008.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2008 <- read.csv2("./AC2008.csv", header=TRUE, sep=";")
AL2008 <- read.csv2("./AL2008.csv", header=TRUE, sep=";")
AM2008 <- read.csv2("./AM2008.csv", header=TRUE, sep=";")
AP2008 <- read.csv2("./AP2008.csv", header=TRUE, sep=";")
BA2008 <- read.csv2("./BA2008.csv", header=TRUE, sep=";")
CE2008 <- read.csv2("./CE2008.csv", header=TRUE, sep=";")
DF2008 <- read.csv2("./DF2008.csv", header=TRUE, sep=";")
ES2008 <- read.csv2("./ES2008.csv", header=TRUE, sep=";")
GO2008 <- read.csv2("./GO2008.csv", header=TRUE, sep=";")
MA2008 <- read.csv2("./MA2008.csv", header=TRUE, sep=";")
MG2008 <- read.csv2("./MG2008.csv", header=TRUE, sep=";")
MS2008 <- read.csv2("./MS2008.csv", header=TRUE, sep=";")
MT2008 <- read.csv2("./MT2008.csv", header=TRUE, sep=";")
PA2008 <- read.csv2("./PA2008.csv", header=TRUE, sep=";")
PB2008 <- read.csv2("./PB2008.csv", header=TRUE, sep=";")
PE2008 <- read.csv2("./PE2008.csv", header=TRUE, sep=";")
PI2008 <- read.csv2("./PI2008.csv", header=TRUE, sep=";")
PR2008 <- read.csv2("./PR2008.csv", header=TRUE, sep=";")
RJ2008 <- read.csv2("./RJ2008.csv", header=TRUE, sep=";")
RN2008 <- read.csv2("./RN2008.csv", header=TRUE, sep=";")
RO2008 <- read.csv2("./RO2008.csv", header=TRUE, sep=";")
RR2008 <- read.csv2("./RR2008.csv", header=TRUE, sep=";")
RS2008 <- read.csv2("./RS2008.csv", header=TRUE, sep=";")
SC2008 <- read.csv2("./SC2008.csv", header=TRUE, sep=";")
SE2008 <- read.csv2("./SE2008.csv", header=TRUE, sep=";")
SP2008 <- read.csv2("./SP2008.csv", header=TRUE, sep=";")
TO2008 <- read.csv2("./TO2008.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2008 <- as.data.frame(rbind(AC2008,AL2008,AM2008,AP2008,BA2008,CE2008,DF2008,
                               ES2008,GO2008,MA2008,MG2008,MS2008,MT2008,PA2008,
                               PB2008,PE2008,PI2008,PR2008,RJ2008,RN2008,RO2008,
                               RR2008,RS2008,SC2008,SE2008,SP2008,TO2008))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2008, file ="./SIH2008.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2008 <- read.csv2(unz("./SIH.zip", "SIH2008.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2008 <- as.data.frame(cbind(2008, t(dim(SIH2008))))
library(data.table)
setnames(dimSIH2008, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2008, file ="./dimSIH2008.csv")

# build and export data set of column names
colnamesSIH2008 <- as.data.frame(colnames(SIH2008))
colnames(colnamesSIH2008)[1] <- "2008"
write.csv2(colnamesSIH2008, file ="./colnamesSIH2008.csv")

################################## YEAR: 2009 ##################################

# first data loading
ano_ref <- "09"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2009 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2009 <- SIH2009 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2009 <- rbind(SIH2009, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP09"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2009 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2009 <- rbind(SP2009, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2009, file ="./SP2009.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2009 <- read.csv2("./AC2009.csv", header=TRUE, sep=";")
AL2009 <- read.csv2("./AL2009.csv", header=TRUE, sep=";")
AM2009 <- read.csv2("./AM2009.csv", header=TRUE, sep=";")
AP2009 <- read.csv2("./AP2009.csv", header=TRUE, sep=";")
BA2009 <- read.csv2("./BA2009.csv", header=TRUE, sep=";")
CE2009 <- read.csv2("./CE2009.csv", header=TRUE, sep=";")
DF2009 <- read.csv2("./DF2009.csv", header=TRUE, sep=";")
ES2009 <- read.csv2("./ES2009.csv", header=TRUE, sep=";")
GO2009 <- read.csv2("./GO2009.csv", header=TRUE, sep=";")
MA2009 <- read.csv2("./MA2009.csv", header=TRUE, sep=";")
MG2009 <- read.csv2("./MG2009.csv", header=TRUE, sep=";")
MS2009 <- read.csv2("./MS2009.csv", header=TRUE, sep=";")
MT2009 <- read.csv2("./MT2009.csv", header=TRUE, sep=";")
PA2009 <- read.csv2("./PA2009.csv", header=TRUE, sep=";")
PB2009 <- read.csv2("./PB2009.csv", header=TRUE, sep=";")
PE2009 <- read.csv2("./PE2009.csv", header=TRUE, sep=";")
PI2009 <- read.csv2("./PI2009.csv", header=TRUE, sep=";")
PR2009 <- read.csv2("./PR2009.csv", header=TRUE, sep=";")
RJ2009 <- read.csv2("./RJ2009.csv", header=TRUE, sep=";")
RN2009 <- read.csv2("./RN2009.csv", header=TRUE, sep=";")
RO2009 <- read.csv2("./RO2009.csv", header=TRUE, sep=";")
RR2009 <- read.csv2("./RR2009.csv", header=TRUE, sep=";")
RS2009 <- read.csv2("./RS2009.csv", header=TRUE, sep=";")
SC2009 <- read.csv2("./SC2009.csv", header=TRUE, sep=";")
SE2009 <- read.csv2("./SE2009.csv", header=TRUE, sep=";")
SP2009 <- read.csv2("./SP2009.csv", header=TRUE, sep=";")
TO2009 <- read.csv2("./TO2009.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2009 <- as.data.frame(rbind(AC2009,AL2009,AM2009,AP2009,BA2009,CE2009,DF2009,
                               ES2009,GO2009,MA2009,MG2009,MS2009,MT2009,PA2009,
                               PB2009,PE2009,PI2009,PR2009,RJ2009,RN2009,RO2009,
                               RR2009,RS2009,SC2009,SE2009,SP2009,TO2009))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2009, file ="./SIH2009.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2009 <- read.csv2(unz("./SIH.zip", "SIH2009.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2009 <- as.data.frame(cbind(2009, t(dim(SIH2009))))
library(data.table)
setnames(dimSIH2009, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2009, file ="./dimSIH2009.csv")

# build and export data set of column names
colnamesSIH2009 <- as.data.frame(colnames(SIH2009))
colnames(colnamesSIH2009)[1] <- "2009"
write.csv2(colnamesSIH2009, file ="./colnamesSIH2009.csv")

################################## YEAR: 2010 ##################################

# first data loading
ano_ref <- "10"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2010 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2010 <- SIH2010 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2010 <- rbind(SIH2010, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - all variables
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "10"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2010 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SIH2010 <- rbind(SIH2010, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP10"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2010 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2010 <- rbind(SP2010, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2010, file ="./SP2010.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2010 <- read.csv2("./AC2010.csv", header=TRUE, sep=";")
AL2010 <- read.csv2("./AL2010.csv", header=TRUE, sep=";")
AM2010 <- read.csv2("./AM2010.csv", header=TRUE, sep=";")
AP2010 <- read.csv2("./AP2010.csv", header=TRUE, sep=";")
BA2010 <- read.csv2("./BA2010.csv", header=TRUE, sep=";")
CE2010 <- read.csv2("./CE2010.csv", header=TRUE, sep=";")
DF2010 <- read.csv2("./DF2010.csv", header=TRUE, sep=";")
ES2010 <- read.csv2("./ES2010.csv", header=TRUE, sep=";")
GO2010 <- read.csv2("./GO2010.csv", header=TRUE, sep=";")
MA2010 <- read.csv2("./MA2010.csv", header=TRUE, sep=";")
MG2010 <- read.csv2("./MG2010.csv", header=TRUE, sep=";")
MS2010 <- read.csv2("./MS2010.csv", header=TRUE, sep=";")
MT2010 <- read.csv2("./MT2010.csv", header=TRUE, sep=";")
PA2010 <- read.csv2("./PA2010.csv", header=TRUE, sep=";")
PB2010 <- read.csv2("./PB2010.csv", header=TRUE, sep=";")
PE2010 <- read.csv2("./PE2010.csv", header=TRUE, sep=";")
PI2010 <- read.csv2("./PI2010.csv", header=TRUE, sep=";")
PR2010 <- read.csv2("./PR2010.csv", header=TRUE, sep=";")
RJ2010 <- read.csv2("./RJ2010.csv", header=TRUE, sep=";")
RN2010 <- read.csv2("./RN2010.csv", header=TRUE, sep=";")
RO2010 <- read.csv2("./RO2010.csv", header=TRUE, sep=";")
RR2010 <- read.csv2("./RR2010.csv", header=TRUE, sep=";")
RS2010 <- read.csv2("./RS2010.csv", header=TRUE, sep=";")
SC2010 <- read.csv2("./SC2010.csv", header=TRUE, sep=";")
SE2010 <- read.csv2("./SE2010.csv", header=TRUE, sep=";")
SP2010 <- read.csv2("./SP2010.csv", header=TRUE, sep=";")
TO2010 <- read.csv2("./TO2010.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2010 <- as.data.frame(rbind(AC2010,AL2010,AM2010,AP2010,BA2010,CE2010,DF2010,
                               ES2010,GO2010,MA2010,MG2010,MS2010,MT2010,PA2010,
                               PB2010,PE2010,PI2010,PR2010,RJ2010,RN2010,RO2010,
                               RR2010,RS2010,SC2010,SE2010,SP2010,TO2010))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2010, file ="./SIH2010.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2010 <- read.csv2(unz("./SIH.zip", "SIH2010.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2010 <- as.data.frame(cbind(2010, t(dim(SIH2010))))
library(data.table)
setnames(dimSIH2010, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2010, file ="./dimSIH2010.csv")

# build and export data set of column names
colnamesSIH2010 <- as.data.frame(colnames(SIH2010))
colnames(colnamesSIH2010)[1] <- "2010"
write.csv2(colnamesSIH2010, file ="./colnamesSIH2010.csv")

################################## YEAR: 2011 ##################################

# first data loading
ano_ref <- "11"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2011 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2011 <- SIH2011 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2011 <- rbind(SIH2011, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP11"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2011 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2011 <- rbind(SP2011, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2011, file ="./SP2011.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2011 <- read.csv2("./AC2011.csv", header=TRUE, sep=";")
AL2011 <- read.csv2("./AL2011.csv", header=TRUE, sep=";")
AM2011 <- read.csv2("./AM2011.csv", header=TRUE, sep=";")
AP2011 <- read.csv2("./AP2011.csv", header=TRUE, sep=";")
BA2011 <- read.csv2("./BA2011.csv", header=TRUE, sep=";")
CE2011 <- read.csv2("./CE2011.csv", header=TRUE, sep=";")
DF2011 <- read.csv2("./DF2011.csv", header=TRUE, sep=";")
ES2011 <- read.csv2("./ES2011.csv", header=TRUE, sep=";")
GO2011 <- read.csv2("./GO2011.csv", header=TRUE, sep=";")
MA2011 <- read.csv2("./MA2011.csv", header=TRUE, sep=";")
MG2011 <- read.csv2("./MG2011.csv", header=TRUE, sep=";")
MS2011 <- read.csv2("./MS2011.csv", header=TRUE, sep=";")
MT2011 <- read.csv2("./MT2011.csv", header=TRUE, sep=";")
PA2011 <- read.csv2("./PA2011.csv", header=TRUE, sep=";")
PB2011 <- read.csv2("./PB2011.csv", header=TRUE, sep=";")
PE2011 <- read.csv2("./PE2011.csv", header=TRUE, sep=";")
PI2011 <- read.csv2("./PI2011.csv", header=TRUE, sep=";")
PR2011 <- read.csv2("./PR2011.csv", header=TRUE, sep=";")
RJ2011 <- read.csv2("./RJ2011.csv", header=TRUE, sep=";")
RN2011 <- read.csv2("./RN2011.csv", header=TRUE, sep=";")
RO2011 <- read.csv2("./RO2011.csv", header=TRUE, sep=";")
RR2011 <- read.csv2("./RR2011.csv", header=TRUE, sep=";")
RS2011 <- read.csv2("./RS2011.csv", header=TRUE, sep=";")
SC2011 <- read.csv2("./SC2011.csv", header=TRUE, sep=";")
SE2011 <- read.csv2("./SE2011.csv", header=TRUE, sep=";")
SP2011 <- read.csv2("./SP2011.csv", header=TRUE, sep=";")
TO2011 <- read.csv2("./TO2011.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2011 <- as.data.frame(rbind(AC2011,AL2011,AM2011,AP2011,BA2011,CE2011,DF2011,
                               ES2011,GO2011,MA2011,MG2011,MS2011,MT2011,PA2011,
                               PB2011,PE2011,PI2011,PR2011,RJ2011,RN2011,RO2011,
                               RR2011,RS2011,SC2011,SE2011,SP2011,TO2011))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2011, file ="./SIH2011.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2011 <- read.csv2(unz("./SIH.zip", "SIH2011.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2011 <- as.data.frame(cbind(2011, t(dim(SIH2011))))
library(data.table)
setnames(dimSIH2011, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2011, file ="./dimSIH2011.csv")

# build and export data set of column names
colnamesSIH2011 <- as.data.frame(colnames(SIH2011))
colnames(colnamesSIH2011)[1] <- "2011"
write.csv2(colnamesSIH2011, file ="./colnamesSIH2011.csv")

################################## YEAR: 2012 ##################################

# first data loading
ano_ref <- "12"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2012 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2012 <- SIH2012 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2012 <- rbind(SIH2012, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP12"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2012 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2012 <- rbind(SP2012, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2012, file ="./SP2012.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2012 <- read.csv2("./AC2012.csv", header=TRUE, sep=";")
AL2012 <- read.csv2("./AL2012.csv", header=TRUE, sep=";")
AM2012 <- read.csv2("./AM2012.csv", header=TRUE, sep=";")
AP2012 <- read.csv2("./AP2012.csv", header=TRUE, sep=";")
BA2012 <- read.csv2("./BA2012.csv", header=TRUE, sep=";")
CE2012 <- read.csv2("./CE2012.csv", header=TRUE, sep=";")
DF2012 <- read.csv2("./DF2012.csv", header=TRUE, sep=";")
ES2012 <- read.csv2("./ES2012.csv", header=TRUE, sep=";")
GO2012 <- read.csv2("./GO2012.csv", header=TRUE, sep=";")
MA2012 <- read.csv2("./MA2012.csv", header=TRUE, sep=";")
MG2012 <- read.csv2("./MG2012.csv", header=TRUE, sep=";")
MS2012 <- read.csv2("./MS2012.csv", header=TRUE, sep=";")
MT2012 <- read.csv2("./MT2012.csv", header=TRUE, sep=";")
PA2012 <- read.csv2("./PA2012.csv", header=TRUE, sep=";")
PB2012 <- read.csv2("./PB2012.csv", header=TRUE, sep=";")
PE2012 <- read.csv2("./PE2012.csv", header=TRUE, sep=";")
PI2012 <- read.csv2("./PI2012.csv", header=TRUE, sep=";")
PR2012 <- read.csv2("./PR2012.csv", header=TRUE, sep=";")
RJ2012 <- read.csv2("./RJ2012.csv", header=TRUE, sep=";")
RN2012 <- read.csv2("./RN2012.csv", header=TRUE, sep=";")
RO2012 <- read.csv2("./RO2012.csv", header=TRUE, sep=";")
RR2012 <- read.csv2("./RR2012.csv", header=TRUE, sep=";")
RS2012 <- read.csv2("./RS2012.csv", header=TRUE, sep=";")
SC2012 <- read.csv2("./SC2012.csv", header=TRUE, sep=";")
SE2012 <- read.csv2("./SE2012.csv", header=TRUE, sep=";")
SP2012 <- read.csv2("./SP2012.csv", header=TRUE, sep=";")
TO2012 <- read.csv2("./TO2012.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2012 <- as.data.frame(rbind(AC2012,AL2012,AM2012,AP2012,BA2012,CE2012,DF2012,
                               ES2012,GO2012,MA2012,MG2012,MS2012,MT2012,PA2012,
                               PB2012,PE2012,PI2012,PR2012,RJ2012,RN2012,RO2012,
                               RR2012,RS2012,SC2012,SE2012,SP2012,TO2012))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2012, file ="./SIH2012.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2012 <- read.csv2(unz("./SIH.zip", "SIH2012.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2012 <- as.data.frame(cbind(2012, t(dim(SIH2012))))
library(data.table)
setnames(dimSIH2012, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2012, file ="./dimSIH2012.csv")

# build and export data set of column names
colnamesSIH2012 <- as.data.frame(colnames(SIH2012))
colnames(colnamesSIH2012)[1] <- "2012"
write.csv2(colnamesSIH2012, file ="./colnamesSIH2012.csv")

################################## YEAR: 2013 ##################################

# first data loading
ano_ref <- "13"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2013 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2013 <- SIH2013 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2013 <- rbind(SIH2013, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP13"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2013 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2013 <- rbind(SP2013, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2013, file ="./SP2013.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2013 <- read.csv2("./AC2013.csv", header=TRUE, sep=";")
AL2013 <- read.csv2("./AL2013.csv", header=TRUE, sep=";")
AM2013 <- read.csv2("./AM2013.csv", header=TRUE, sep=";")
AP2013 <- read.csv2("./AP2013.csv", header=TRUE, sep=";")
BA2013 <- read.csv2("./BA2013.csv", header=TRUE, sep=";")
CE2013 <- read.csv2("./CE2013.csv", header=TRUE, sep=";")
DF2013 <- read.csv2("./DF2013.csv", header=TRUE, sep=";")
ES2013 <- read.csv2("./ES2013.csv", header=TRUE, sep=";")
GO2013 <- read.csv2("./GO2013.csv", header=TRUE, sep=";")
MA2013 <- read.csv2("./MA2013.csv", header=TRUE, sep=";")
MG2013 <- read.csv2("./MG2013.csv", header=TRUE, sep=";")
MS2013 <- read.csv2("./MS2013.csv", header=TRUE, sep=";")
MT2013 <- read.csv2("./MT2013.csv", header=TRUE, sep=";")
PA2013 <- read.csv2("./PA2013.csv", header=TRUE, sep=";")
PB2013 <- read.csv2("./PB2013.csv", header=TRUE, sep=";")
PE2013 <- read.csv2("./PE2013.csv", header=TRUE, sep=";")
PI2013 <- read.csv2("./PI2013.csv", header=TRUE, sep=";")
PR2013 <- read.csv2("./PR2013.csv", header=TRUE, sep=";")
RJ2013 <- read.csv2("./RJ2013.csv", header=TRUE, sep=";")
RN2013 <- read.csv2("./RN2013.csv", header=TRUE, sep=";")
RO2013 <- read.csv2("./RO2013.csv", header=TRUE, sep=";")
RR2013 <- read.csv2("./RR2013.csv", header=TRUE, sep=";")
RS2013 <- read.csv2("./RS2013.csv", header=TRUE, sep=";")
SC2013 <- read.csv2("./SC2013.csv", header=TRUE, sep=";")
SE2013 <- read.csv2("./SE2013.csv", header=TRUE, sep=";")
SP2013 <- read.csv2("./SP2013.csv", header=TRUE, sep=";")
TO2013 <- read.csv2("./TO2013.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2013 <- as.data.frame(rbind(AC2013,AL2013,AM2013,AP2013,BA2013,CE2013,DF2013,
                               ES2013,GO2013,MA2013,MG2013,MS2013,MT2013,PA2013,
                               PB2013,PE2013,PI2013,PR2013,RJ2013,RN2013,RO2013,
                               RR2013,RS2013,SC2013,SE2013,SP2013,TO2013))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2013, file ="./SIH2013.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2013 <- read.csv2(unz("./SIH.zip", "SIH2013.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2013 <- as.data.frame(cbind(2013, t(dim(SIH2013))))
library(data.table)
setnames(dimSIH2013, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2013, file ="./dimSIH2013.csv")

# build and export data set of column names
colnamesSIH2013 <- as.data.frame(colnames(SIH2013))
colnames(colnamesSIH2013)[1] <- "2013"
write.csv2(colnamesSIH2013, file ="./colnamesSIH2013.csv")

################################## YEAR: 2014 ##################################

# first data loading
ano_ref <- "14"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2014 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2014 <- SIH2014 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2014 <- rbind(SIH2014, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP14"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2014 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2014 <- rbind(SP2014, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2014, file ="./SP2014.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2014 <- read.csv2("./AC2014.csv", header=TRUE, sep=";")
AL2014 <- read.csv2("./AL2014.csv", header=TRUE, sep=";")
AM2014 <- read.csv2("./AM2014.csv", header=TRUE, sep=";")
AP2014 <- read.csv2("./AP2014.csv", header=TRUE, sep=";")
BA2014 <- read.csv2("./BA2014.csv", header=TRUE, sep=";")
CE2014 <- read.csv2("./CE2014.csv", header=TRUE, sep=";")
DF2014 <- read.csv2("./DF2014.csv", header=TRUE, sep=";")
ES2014 <- read.csv2("./ES2014.csv", header=TRUE, sep=";")
GO2014 <- read.csv2("./GO2014.csv", header=TRUE, sep=";")
MA2014 <- read.csv2("./MA2014.csv", header=TRUE, sep=";")
MG2014 <- read.csv2("./MG2014.csv", header=TRUE, sep=";")
MS2014 <- read.csv2("./MS2014.csv", header=TRUE, sep=";")
MT2014 <- read.csv2("./MT2014.csv", header=TRUE, sep=";")
PA2014 <- read.csv2("./PA2014.csv", header=TRUE, sep=";")
PB2014 <- read.csv2("./PB2014.csv", header=TRUE, sep=";")
PE2014 <- read.csv2("./PE2014.csv", header=TRUE, sep=";")
PI2014 <- read.csv2("./PI2014.csv", header=TRUE, sep=";")
PR2014 <- read.csv2("./PR2014.csv", header=TRUE, sep=";")
RJ2014 <- read.csv2("./RJ2014.csv", header=TRUE, sep=";")
RN2014 <- read.csv2("./RN2014.csv", header=TRUE, sep=";")
RO2014 <- read.csv2("./RO2014.csv", header=TRUE, sep=";")
RR2014 <- read.csv2("./RR2014.csv", header=TRUE, sep=";")
RS2014 <- read.csv2("./RS2014.csv", header=TRUE, sep=";")
SC2014 <- read.csv2("./SC2014.csv", header=TRUE, sep=";")
SE2014 <- read.csv2("./SE2014.csv", header=TRUE, sep=";")
SP2014 <- read.csv2("./SP2014.csv", header=TRUE, sep=";")
TO2014 <- read.csv2("./TO2014.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2014 <- as.data.frame(rbind(AC2014,AL2014,AM2014,AP2014,BA2014,CE2014,DF2014,
                               ES2014,GO2014,MA2014,MG2014,MS2014,MT2014,PA2014,
                               PB2014,PE2014,PI2014,PR2014,RJ2014,RN2014,RO2014,
                               RR2014,RS2014,SC2014,SE2014,SP2014,TO2014))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2014, file ="./SIH2014.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2014 <- read.csv2(unz("./SIH.zip", "SIH2014.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2014 <- as.data.frame(cbind(2014, t(dim(SIH2014))))
library(data.table)
setnames(dimSIH2014, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2014, file ="./dimSIH2014.csv")

# build and export data set of column names
colnamesSIH2014 <- as.data.frame(colnames(SIH2014))
colnames(colnamesSIH2014)[1] <- "2014"
write.csv2(colnamesSIH2014, file ="./colnamesSIH2014.csv")

################################## YEAR: 2015 ##################################

# first data loading
ano_ref <- "15"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2015 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2015 <- SIH2015 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2015 <- rbind(SIH2015, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP15"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2015 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2015 <- rbind(SP2015, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2015, file ="./SP2015.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2015 <- read.csv2("./AC2015.csv", header=TRUE, sep=";")
AL2015 <- read.csv2("./AL2015.csv", header=TRUE, sep=";")
AM2015 <- read.csv2("./AM2015.csv", header=TRUE, sep=";")
AP2015 <- read.csv2("./AP2015.csv", header=TRUE, sep=";")
BA2015 <- read.csv2("./BA2015.csv", header=TRUE, sep=";")
CE2015 <- read.csv2("./CE2015.csv", header=TRUE, sep=";")
DF2015 <- read.csv2("./DF2015.csv", header=TRUE, sep=";")
ES2015 <- read.csv2("./ES2015.csv", header=TRUE, sep=";")
GO2015 <- read.csv2("./GO2015.csv", header=TRUE, sep=";")
MA2015 <- read.csv2("./MA2015.csv", header=TRUE, sep=";")
MG2015 <- read.csv2("./MG2015.csv", header=TRUE, sep=";")
MS2015 <- read.csv2("./MS2015.csv", header=TRUE, sep=";")
MT2015 <- read.csv2("./MT2015.csv", header=TRUE, sep=";")
PA2015 <- read.csv2("./PA2015.csv", header=TRUE, sep=";")
PB2015 <- read.csv2("./PB2015.csv", header=TRUE, sep=";")
PE2015 <- read.csv2("./PE2015.csv", header=TRUE, sep=";")
PI2015 <- read.csv2("./PI2015.csv", header=TRUE, sep=";")
PR2015 <- read.csv2("./PR2015.csv", header=TRUE, sep=";")
RJ2015 <- read.csv2("./RJ2015.csv", header=TRUE, sep=";")
RN2015 <- read.csv2("./RN2015.csv", header=TRUE, sep=";")
RO2015 <- read.csv2("./RO2015.csv", header=TRUE, sep=";")
RR2015 <- read.csv2("./RR2015.csv", header=TRUE, sep=";")
RS2015 <- read.csv2("./RS2015.csv", header=TRUE, sep=";")
SC2015 <- read.csv2("./SC2015.csv", header=TRUE, sep=";")
SE2015 <- read.csv2("./SE2015.csv", header=TRUE, sep=";")
SP2015 <- read.csv2("./SP2015.csv", header=TRUE, sep=";")
TO2015 <- read.csv2("./TO2015.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2015 <- as.data.frame(rbind(AC2015,AL2015,AM2015,AP2015,BA2015,CE2015,DF2015,
                               ES2015,GO2015,MA2015,MG2015,MS2015,MT2015,PA2015,
                               PB2015,PE2015,PI2015,PR2015,RJ2015,RN2015,RO2015,
                               RR2015,RS2015,SC2015,SE2015,SP2015,TO2015))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2015, file ="./SIH2015.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2015 <- read.csv2(unz("./SIH.zip", "SIH2015.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2015 <- as.data.frame(cbind(2015, t(dim(SIH2015))))
library(data.table)
setnames(dimSIH2015, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2015, file ="./dimSIH2015.csv")

# build and export data set of column names
colnamesSIH2015 <- as.data.frame(colnames(SIH2015))
colnames(colnamesSIH2015)[1] <- "2015"
write.csv2(colnamesSIH2015, file ="./colnamesSIH2015.csv")

################################## YEAR: 2016 ##################################

# first data loading
ano_ref <- "16"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2016 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2016 <- SIH2016 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2016 <- rbind(SIH2016, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP16"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2016 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2016 <- rbind(SP2016, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2016, file ="./SP2016.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2016 <- read.csv2("./AC2016.csv", header=TRUE, sep=";")
AL2016 <- read.csv2("./AL2016.csv", header=TRUE, sep=";")
AM2016 <- read.csv2("./AM2016.csv", header=TRUE, sep=";")
AP2016 <- read.csv2("./AP2016.csv", header=TRUE, sep=";")
BA2016 <- read.csv2("./BA2016.csv", header=TRUE, sep=";")
CE2016 <- read.csv2("./CE2016.csv", header=TRUE, sep=";")
DF2016 <- read.csv2("./DF2016.csv", header=TRUE, sep=";")
ES2016 <- read.csv2("./ES2016.csv", header=TRUE, sep=";")
GO2016 <- read.csv2("./GO2016.csv", header=TRUE, sep=";")
MA2016 <- read.csv2("./MA2016.csv", header=TRUE, sep=";")
MG2016 <- read.csv2("./MG2016.csv", header=TRUE, sep=";")
MS2016 <- read.csv2("./MS2016.csv", header=TRUE, sep=";")
MT2016 <- read.csv2("./MT2016.csv", header=TRUE, sep=";")
PA2016 <- read.csv2("./PA2016.csv", header=TRUE, sep=";")
PB2016 <- read.csv2("./PB2016.csv", header=TRUE, sep=";")
PE2016 <- read.csv2("./PE2016.csv", header=TRUE, sep=";")
PI2016 <- read.csv2("./PI2016.csv", header=TRUE, sep=";")
PR2016 <- read.csv2("./PR2016.csv", header=TRUE, sep=";")
RJ2016 <- read.csv2("./RJ2016.csv", header=TRUE, sep=";")
RN2016 <- read.csv2("./RN2016.csv", header=TRUE, sep=";")
RO2016 <- read.csv2("./RO2016.csv", header=TRUE, sep=";")
RR2016 <- read.csv2("./RR2016.csv", header=TRUE, sep=";")
RS2016 <- read.csv2("./RS2016.csv", header=TRUE, sep=";")
SC2016 <- read.csv2("./SC2016.csv", header=TRUE, sep=";")
SE2016 <- read.csv2("./SE2016.csv", header=TRUE, sep=";")
SP2016 <- read.csv2("./SP2016.csv", header=TRUE, sep=";")
TO2016 <- read.csv2("./TO2016.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2016 <- as.data.frame(rbind(AC2016,AL2016,AM2016,AP2016,BA2016,CE2016,DF2016,
                               ES2016,GO2016,MA2016,MG2016,MS2016,MT2016,PA2016,
                               PB2016,PE2016,PI2016,PR2016,RJ2016,RN2016,RO2016,
                               RR2016,RS2016,SC2016,SE2016,SP2016,TO2016))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2016, file ="./SIH2016.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2016 <- read.csv2(unz("./SIH.zip", "SIH2016.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2016 <- as.data.frame(cbind(2016, t(dim(SIH2016))))
library(data.table)
setnames(dimSIH2016, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2016, file ="./dimSIH2016.csv")

# build and export data set of column names
colnamesSIH2016 <- as.data.frame(colnames(SIH2016))
colnames(colnamesSIH2016)[1] <- "2016"
write.csv2(colnamesSIH2016, file ="./colnamesSIH2016.csv")

################################## YEAR: 2017 ##################################

# first data loading
ano_ref <- "17"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2017 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2017 <- SIH2017 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2017 <- rbind(SIH2017, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP17"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2017 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2017 <- rbind(SP2017, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2017, file ="./SP2017.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2017 <- read.csv2("./AC2017.csv", header=TRUE, sep=";")
AL2017 <- read.csv2("./AL2017.csv", header=TRUE, sep=";")
AM2017 <- read.csv2("./AM2017.csv", header=TRUE, sep=";")
AP2017 <- read.csv2("./AP2017.csv", header=TRUE, sep=";")
BA2017 <- read.csv2("./BA2017.csv", header=TRUE, sep=";")
CE2017 <- read.csv2("./CE2017.csv", header=TRUE, sep=";")
DF2017 <- read.csv2("./DF2017.csv", header=TRUE, sep=";")
ES2017 <- read.csv2("./ES2017.csv", header=TRUE, sep=";")
GO2017 <- read.csv2("./GO2017.csv", header=TRUE, sep=";")
MA2017 <- read.csv2("./MA2017.csv", header=TRUE, sep=";")
MG2017 <- read.csv2("./MG2017.csv", header=TRUE, sep=";")
MS2017 <- read.csv2("./MS2017.csv", header=TRUE, sep=";")
MT2017 <- read.csv2("./MT2017.csv", header=TRUE, sep=";")
PA2017 <- read.csv2("./PA2017.csv", header=TRUE, sep=";")
PB2017 <- read.csv2("./PB2017.csv", header=TRUE, sep=";")
PE2017 <- read.csv2("./PE2017.csv", header=TRUE, sep=";")
PI2017 <- read.csv2("./PI2017.csv", header=TRUE, sep=";")
PR2017 <- read.csv2("./PR2017.csv", header=TRUE, sep=";")
RJ2017 <- read.csv2("./RJ2017.csv", header=TRUE, sep=";")
RN2017 <- read.csv2("./RN2017.csv", header=TRUE, sep=";")
RO2017 <- read.csv2("./RO2017.csv", header=TRUE, sep=";")
RR2017 <- read.csv2("./RR2017.csv", header=TRUE, sep=";")
RS2017 <- read.csv2("./RS2017.csv", header=TRUE, sep=";")
SC2017 <- read.csv2("./SC2017.csv", header=TRUE, sep=";")
SE2017 <- read.csv2("./SE2017.csv", header=TRUE, sep=";")
SP2017 <- read.csv2("./SP2017.csv", header=TRUE, sep=";")
TO2017 <- read.csv2("./TO2017.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2017 <- as.data.frame(rbind(AC2017,AL2017,AM2017,AP2017,BA2017,CE2017,DF2017,
                               ES2017,GO2017,MA2017,MG2017,MS2017,MT2017,PA2017,
                               PB2017,PE2017,PI2017,PR2017,RJ2017,RN2017,RO2017,
                               RR2017,RS2017,SC2017,SE2017,SP2017,TO2017))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2017, file ="./SIH2017.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2017 <- read.csv2(unz("./SIH.zip", "SIH2017.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2017 <- as.data.frame(cbind(2017, t(dim(SIH2017))))
library(data.table)
setnames(dimSIH2017, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2017, file ="./dimSIH2017.csv")

# build and export data set of column names
colnamesSIH2017 <- as.data.frame(colnames(SIH2017))
colnames(colnamesSIH2017)[1] <- "2017"
write.csv2(colnamesSIH2017, file ="./colnamesSIH2017.csv")

################################## YEAR: 2018 ##################################

# first data loading
ano_ref <- "18"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2018 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2018 <- SIH2018 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2018 <- rbind(SIH2018, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP18"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2018 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2018 <- rbind(SP2018, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2018, file ="./SP2018.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2018 <- read.csv2("./AC2018.csv", header=TRUE, sep=";")
AL2018 <- read.csv2("./AL2018.csv", header=TRUE, sep=";")
AM2018 <- read.csv2("./AM2018.csv", header=TRUE, sep=";")
AP2018 <- read.csv2("./AP2018.csv", header=TRUE, sep=";")
BA2018 <- read.csv2("./BA2018.csv", header=TRUE, sep=";")
CE2018 <- read.csv2("./CE2018.csv", header=TRUE, sep=";")
DF2018 <- read.csv2("./DF2018.csv", header=TRUE, sep=";")
ES2018 <- read.csv2("./ES2018.csv", header=TRUE, sep=";")
GO2018 <- read.csv2("./GO2018.csv", header=TRUE, sep=";")
MA2018 <- read.csv2("./MA2018.csv", header=TRUE, sep=";")
MG2018 <- read.csv2("./MG2018.csv", header=TRUE, sep=";")
MS2018 <- read.csv2("./MS2018.csv", header=TRUE, sep=";")
MT2018 <- read.csv2("./MT2018.csv", header=TRUE, sep=";")
PA2018 <- read.csv2("./PA2018.csv", header=TRUE, sep=";")
PB2018 <- read.csv2("./PB2018.csv", header=TRUE, sep=";")
PE2018 <- read.csv2("./PE2018.csv", header=TRUE, sep=";")
PI2018 <- read.csv2("./PI2018.csv", header=TRUE, sep=";")
PR2018 <- read.csv2("./PR2018.csv", header=TRUE, sep=";")
RJ2018 <- read.csv2("./RJ2018.csv", header=TRUE, sep=";")
RN2018 <- read.csv2("./RN2018.csv", header=TRUE, sep=";")
RO2018 <- read.csv2("./RO2018.csv", header=TRUE, sep=";")
RR2018 <- read.csv2("./RR2018.csv", header=TRUE, sep=";")
RS2018 <- read.csv2("./RS2018.csv", header=TRUE, sep=";")
SC2018 <- read.csv2("./SC2018.csv", header=TRUE, sep=";")
SE2018 <- read.csv2("./SE2018.csv", header=TRUE, sep=";")
SP2018 <- read.csv2("./SP2018.csv", header=TRUE, sep=";")
TO2018 <- read.csv2("./TO2018.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2018 <- as.data.frame(rbind(AC2018,AL2018,AM2018,AP2018,BA2018,CE2018,DF2018,
                               ES2018,GO2018,MA2018,MG2018,MS2018,MT2018,PA2018,
                               PB2018,PE2018,PI2018,PR2018,RJ2018,RN2018,RO2018,
                               RR2018,RS2018,SC2018,SE2018,SP2018,TO2018))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2018, file ="./SIH2018.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2018 <- read.csv2(unz("./SIH.zip", "SIH2018.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2018 <- as.data.frame(cbind(2018, t(dim(SIH2018))))
library(data.table)
setnames(dimSIH2018, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2018, file ="./dimSIH2018.csv")

# build and export data set of column names
colnamesSIH2018 <- as.data.frame(colnames(SIH2018))
colnames(colnamesSIH2018)[1] <- "2018"
write.csv2(colnamesSIH2018, file ="./colnamesSIH2018.csv")

################################## YEAR: 2019 ##################################

# first data loading - select variables
ano_ref <- "19"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2019 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2019 <- SIH2019 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2019 <- rbind(SIH2019, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - subset
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "SP19"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 3, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SP2019 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SP2019 <- rbind(SP2019, temp)
  }
  print(i)
  cont=cont+1
}

# extract data - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SP2019, file ="./SP2019.csv")

# second data loading - subset
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
AC2019 <- read.csv2("./AC2019.csv", header=TRUE, sep=";")
AL2019 <- read.csv2("./AL2019.csv", header=TRUE, sep=";")
AM2019 <- read.csv2("./AM2019.csv", header=TRUE, sep=";")
AP2019 <- read.csv2("./AP2019.csv", header=TRUE, sep=";")
BA2019 <- read.csv2("./BA2019.csv", header=TRUE, sep=";")
CE2019 <- read.csv2("./CE2019.csv", header=TRUE, sep=";")
DF2019 <- read.csv2("./DF2019.csv", header=TRUE, sep=";")
ES2019 <- read.csv2("./ES2019.csv", header=TRUE, sep=";")
GO2019 <- read.csv2("./GO2019.csv", header=TRUE, sep=";")
MA2019 <- read.csv2("./MA2019.csv", header=TRUE, sep=";")
MG2019 <- read.csv2("./MG2019.csv", header=TRUE, sep=";")
MS2019 <- read.csv2("./MS2019.csv", header=TRUE, sep=";")
MT2019 <- read.csv2("./MT2019.csv", header=TRUE, sep=";")
PA2019 <- read.csv2("./PA2019.csv", header=TRUE, sep=";")
PB2019 <- read.csv2("./PB2019.csv", header=TRUE, sep=";")
PE2019 <- read.csv2("./PE2019.csv", header=TRUE, sep=";")
PI2019 <- read.csv2("./PI2019.csv", header=TRUE, sep=";")
PR2019 <- read.csv2("./PR2019.csv", header=TRUE, sep=";")
RJ2019 <- read.csv2("./RJ2019.csv", header=TRUE, sep=";")
RN2019 <- read.csv2("./RN2019.csv", header=TRUE, sep=";")
RO2019 <- read.csv2("./RO2019.csv", header=TRUE, sep=";")
RR2019 <- read.csv2("./RR2019.csv", header=TRUE, sep=";")
RS2019 <- read.csv2("./RS2019.csv", header=TRUE, sep=";")
SC2019 <- read.csv2("./SC2019.csv", header=TRUE, sep=";")
SE2019 <- read.csv2("./SE2019.csv", header=TRUE, sep=";")
SP2019 <- read.csv2("./SP2019.csv", header=TRUE, sep=";")
TO2019 <- read.csv2("./TO2019.csv", header=TRUE, sep=";")

# merge data sets - subset
SIH2019 <- as.data.frame(rbind(AC2019,AL2019,AM2019,AP2019,BA2019,CE2019,DF2019,
                               ES2019,GO2019,MA2019,MG2019,MS2019,MT2019,PA2019,
                               PB2019,PE2019,PI2019,PR2019,RJ2019,RN2019,RO2019,
                               RR2019,RS2019,SC2019,SE2019,SP2019,TO2019))

# extract data - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2019, file ="./SIH2019.csv")

# second data loading - complete
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2019 <- read.csv2(unz("./SIH.zip", "SIH2019.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2019 <- as.data.frame(cbind(2019, t(dim(SIH2019))))
library(data.table)
setnames(dimSIH2019, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2019, file ="./dimSIH2019.csv")

# build and export data set of column names
colnamesSIH2019 <- as.data.frame(colnames(SIH2019))
colnames(colnamesSIH2019)[1] <- "2019"
write.csv2(colnamesSIH2019, file ="./colnamesSIH2019.csv")

################################## YEAR: 2020 ##################################

# first data loading - select variables
ano_ref <- "20"
arquivos <- data.frame(arquivos = list.files("D:/SIH2020/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("SEXO", "NASC", "COD_IDADE", "IDADE", "RACA_COR", "INSTRU", 
             "NUM_FILHOS", "CBOR", "MUNIC_RES", "DT_INTER", "DT_SAIDA", 
             "DIAS_PERM", "MUNIC_MOV", "DIAG_PRINC", "COMPLEX", "MORTE", 
             "CID_MORTE", "VAL_TOT", "US_TOT")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2020 <- read.dbc(paste("D:/SIH2020/", i, sep=""))
    SIH2020 <- SIH2020 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("D:/SIH2020/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2020 <- rbind(SIH2020, temp)
  }
  print(i)
  cont=cont+1
}

# first data loading - all variables
wd1 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/DBC/"
setwd(wd1)
getwd()
ano_ref <- "20"
arquivos <- data.frame(arquivos = list.files("./"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH2020 <- read.dbc(paste("./", i, sep=""))
  } else {
    temp <- read.dbc(paste("./", i, sep=""))
    SIH2020 <- rbind(SIH2020, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
write.csv2(SIH2020, file ="./SIH2020.csv")

# second data loading
wd2 <- "C:/Users/Dell/OneDrive/R/Bancos de dados/SIH/CSV"
setwd(wd2)
getwd()
SIH2020 <- read.csv2(unz("./SIH.zip", "SIH2020.csv"), header=TRUE, sep=";")

# build and export data set of rows and columns (dimensions)
dimSIH2020 <- as.data.frame(cbind(2020, t(dim(SIH2020))))
library(data.table)
setnames(dimSIH2020, old = c("V1","V2","V3"), new = c("Year","Rows","Columns"))
wd3 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd3)
getwd()
write.csv2(dimSIH2020, file ="./dimSIH2020.csv")

# build and export data set of column names
colnamesSIH2020 <- as.data.frame(colnames(SIH2020))
colnames(colnamesSIH2020)[1] <- "2020"
write.csv2(colnamesSIH2020, file ="./colnamesSIH2020.csv")

################################################################################



########################## INSTALL AND LOAD PACKAGES ###########################

# clean everything done before
rm(list=ls())

# clean just some objects
rm(SIH2008,SIH2016,SIH2018)

# use more memory
memory.limit(9999999999)

# packages' names
packages <- c("tidyverse", "read.dbc")

# install packages if not installed yet
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# load packages
invisible(lapply(packages, library, character.only = TRUE))

################################## YEAR: 1998 ##################################

# first data loading
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

# extract data
write.csv2(SIH1998, file ="./Banco de dados/SIH/SIH1998.csv")
write.csv2(SIH1998, file ="./Banco de dados/csvs/SIH1998.csv")

# second data loading
SIH1998 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH1998.csv"),
                     header=TRUE, sep=";")

################################## YEAR: 1999 ##################################

# first data loading
ano_ref <- "99"
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
    SIH1999 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH1999 <- SIH1999 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH1999 <- rbind(SIH1999, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
write.csv2(SIH1999, file ="./Banco de dados/SIH/SIH1999.csv")
SIH1999 <- write.csv2(SIH1999, file ="./Banco de dados/csvs/SIH1999.csv")

# second data loading
SIH1999 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH1999.csv"),
                     header=TRUE, sep=";")

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

# extract data
<<<<<<< HEAD
SIH2000 <- write.csv2(SIH2000, file ="./Banco de dados/csvs/SIH2000.csv")
=======
write.csv2(SIH2000, file ="./Banco de dados/SIH/SIH2000.csv")
>>>>>>> f6be449c2269f7fa92c4161faee5e90fe6a4ee85

# second data loading
SIH2000 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2000.csv"),
                     header=TRUE, sep=";")

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

# extract data
<<<<<<< HEAD
SIH2001 <- write.csv2(SIH2001, file ="./Banco de dados/csvs/SIH2001.csv")
=======
write.csv2(SIH2001, file ="./Banco de dados/SIH/SIH2001.csv")
>>>>>>> f6be449c2269f7fa92c4161faee5e90fe6a4ee85

# second data loading
SIH2001 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2001.csv"),
                     header=TRUE, sep=";")

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

# extract data
<<<<<<< HEAD
SIH2002 <- write.csv2(SIH2002, file ="./Banco de dados/csvs/SIH2002.csv")
=======
write.csv2(SIH2002, file ="./Banco de dados/SIH/SIH2002.csv")
>>>>>>> f6be449c2269f7fa92c4161faee5e90fe6a4ee85

# second data loading
SIH2002 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2002.csv"),
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

# extract data
<<<<<<< HEAD
SIH2003 <- write.csv2(SIH2003, file ="./Banco de dados/csvs/SIH2003.csv")
=======
write.csv2(SIH2003, file ="./Banco de dados/SIH/SIH2003.csv")
>>>>>>> f6be449c2269f7fa92c4161faee5e90fe6a4ee85

# second data loading
SIH2003 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2003.csv"),
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

# extract data
<<<<<<< HEAD
SIH2004 <- write.csv2(SIH2004, file ="./Banco de dados/csvs/SIH2004.csv")
=======
write.csv2(SIH2004, file ="./Banco de dados/SIH/SIH2004.csv")
>>>>>>> f6be449c2269f7fa92c4161faee5e90fe6a4ee85

# second data loading
SIH2004 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2004.csv"),
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

# extract data

SIH2005 <- write.csv2(SIH2005, file ="./Banco de dados/csvs/SIH2005.csv")

# second data loading
SIH2005 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2005.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2006, file ="./Banco de dados/csvs/SIH2006.csv")

# second data loading
SIH2006 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2006.csv"),
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

# extract data
write.csv2(SIH2007, file ="./Banco de dados/csvs/SIH2007.csv")

# second data loading
SIH2007 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2007.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2008, file ="./Banco de dados/SIH/SIH2008.csv")

# second data loading
SIH2008 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2008.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2009, file ="./Banco de dados/SIH/SIH2009.csv")

# second data loading
SIH2009 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2009.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2010, file ="./Banco de dados/SIH/SIH2010.csv")

# second data loading
SIH2010 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2010.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2011, file ="./Banco de dados/SIH/SIH2011.csv")

# second data loading
SIH2011 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2011.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2012, file ="./Banco de dados/SIH/SIH2012.csv")

# second data loading
SIH2012 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2012.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2013, file ="./Banco de dados/SIH/SIH2013.csv")

# second data loading
SIH2013 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2013.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2014, file ="./Banco de dados/SIH/SIH2014.csv")

# second data loading
SIH2014 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2014.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2015, file ="./Banco de dados/SIH/SIH2015.csv")

# second data loading
SIH2015 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2015.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2016, file ="./Banco de dados/SIH/SIH2016.csv")

# second data loading
SIH2016 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2016.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2017, file ="./Banco de dados/SIH/SIH2017.csv")

# second data loading
SIH2017 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2017.csv"),
                     header=TRUE, sep=";")

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

# extract data
write.csv2(SIH2018, file ="./Banco de dados/SIH/SIH2018.csv")

# second data loading
SIH2018 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2018.csv"),
                     header=TRUE, sep=";")

################################## YEAR: 2019 ##################################

# first data loading
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

# extract data
write.csv2(SIH2019, file ="./Banco de dados/SIH/CSV/SIH2019.csv")

# second data loading
SIH2019 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2019.csv"),
                     header=TRUE, sep=";")

################################## YEAR: 2020 ##################################

# first data loading
ano_ref <- "20"
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
    SIH2020 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH2020 <- SIH2020 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH2020 <- rbind(SIH2020, temp)
  }
  print(i)
  cont=cont+1
}

# extract data
write.csv2(SIH2020, file ="./Banco de dados/SIH/SIH2020.csv")

# second data loading
SIH2020 <- read.csv2(unz("./Banco de dados/SIH.zip", "SIH2020.csv"),
                     header=TRUE, sep=";")














########################## INSTALL AND LOAD PACKAGES ###########################

# packages' names
packages <- c("tidyverse", "read.dbc")

# install packages if not installed yet
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# load packages
invisible(lapply(packages, library, character.only = TRUE))

################################## YEAR: 1992 ##################################

ano_ref <- "92"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 1993 ##################################

ano_ref <- "93"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 1994 ##################################

ano_ref <- "94"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
cont=0
for (i in arquivos$arquivos) {
  if(cont==0) {
    SIH1994 <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    SIH1994 <- SIH1994 %>% select(colunas)
  } else {
    temp <- read.dbc(paste("./Banco de dados/SIH/", i, sep=""))
    temp <- temp %>% select(colunas)
    SIH1994 <- rbind(SIH1994, temp)
  }
  print(i)
  cont=cont+1
}

################################## YEAR: 1995 ##################################

ano_ref <- "95"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 1996 ##################################

ano_ref <- "96"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 1997 ##################################

ano_ref <- "97"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 1998 ##################################

ano_ref <- "98"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 1999 ##################################

ano_ref <- "99"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2000 ##################################

ano_ref <- "00"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2001 ##################################

ano_ref <- "01"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2002 ##################################

ano_ref <- "02"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2003 ##################################

ano_ref <- "03"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2004 ##################################

ano_ref <- "04"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2005 ##################################

ano_ref <- "05"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2006 ##################################

ano_ref <- "06"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2007 ##################################

ano_ref <- "07"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2008 ##################################

ano_ref <- "08"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2009 ##################################

ano_ref <- "09"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2010 ##################################

ano_ref <- "10"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2011 ##################################

ano_ref <- "11"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2012 ##################################

ano_ref <- "12"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2013 ##################################

ano_ref <- "13"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2014 ##################################

ano_ref <- "14"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2015 ##################################

ano_ref <- "15"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2016 ##################################

ano_ref <- "16"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2017 ##################################

ano_ref <- "17"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2018 ##################################

ano_ref <- "18"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2019 ##################################

ano_ref <- "19"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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

################################## YEAR: 2020 ##################################

ano_ref <- "20"
arquivos <- data.frame(arquivos = list.files("./Banco de dados/SIH/"))
arquivos$ano <- substr(arquivos$arquivos, 5, 6)
arquivos <- arquivos %>% filter(ano == ano_ref)
colunas <- c("MUNIC_RES", "NASC", "SEXO",  "DT_INTER",  "DT_SAIDA", 
             "DIAG_PRINC", "DIAG_SECUN", "RACA_COR" , "MORTE", "COD_IDADE",
             "IDADE", "DIAS_PERM", "COMPLEX")
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














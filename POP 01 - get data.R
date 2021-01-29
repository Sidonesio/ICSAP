
# observation
# source
1996: https://sidra.ibge.gov.br/tabela/472
2007: https://sidra.ibge.gov.br/tabela/793
2010: https://sidra.ibge.gov.br/Tabela/1378
other: https://www.ibge.gov.br/estatisticas/downloads-estatisticas.html

# load library
library(readxl)

# assign working directory (wd) to an object
wd <- "C:/Users/usuario/OneDrive/R/Bancos de dados/Estimativa populacional"

# set working directory
setwd(wd)

# load data
POP1992 <- read_excel("./1992.xlsx", sheet = "dataset")
POP1993 <- read_excel("./1993.xlsx", sheet = "dataset")
POP1994 <- read_excel("./1994.xlsx", sheet = "dataset")
POP1995 <- read_excel("./1995.xlsx", sheet = "dataset")
POP1996 <- read_excel("./1996.xlsx", sheet = "dataset")
POP1997 <- read_excel("./1997.xlsx", sheet = "dataset")
POP1998 <- read_excel("./1998.xlsx", sheet = "dataset")
POP1999 <- read_excel("./1999.xlsx", sheet = "dataset")
POP2000 <- read_excel("./2000.xlsx", sheet = "dataset")
POP2001 <- read_excel("./2001.xlsx", sheet = "dataset")
POP2002 <- read_excel("./2002.xlsx", sheet = "dataset")
POP2003 <- read_excel("./2003.xlsx", sheet = "dataset")
POP2004 <- read_excel("./2004.xlsx", sheet = "dataset")
POP2005 <- read_excel("./2005.xlsx", sheet = "dataset")
POP2006 <- read_excel("./2006.xlsx", sheet = "dataset")
POP2007 <- read_excel("./2007.xlsx", sheet = "dataset")
POP2008 <- read_excel("./2008.xlsx", sheet = "dataset")
POP2009 <- read_excel("./2009.xlsx", sheet = "dataset")
POP2010 <- read_excel("./2010.xlsx", sheet = "dataset")
POP2011 <- read_excel("./2011.xlsx", sheet = "dataset")
POP2012 <- read_excel("./2012.xlsx", sheet = "dataset")
POP2013 <- read_excel("./2013.xlsx", sheet = "dataset")
POP2014 <- read_excel("./2014.xlsx", sheet = "dataset")
POP2015 <- read_excel("./2015.xlsx", sheet = "dataset")
POP2016 <- read_excel("./2016.xlsx", sheet = "dataset")
POP2017 <- read_excel("./2017.xlsx", sheet = "dataset")
POP2018 <- read_excel("./2018.xlsx", sheet = "dataset")
POP2019 <- read_excel("./2019.xlsx", sheet = "dataset")
POP2020 <- read_excel("./2020.xlsx", sheet = "dataset")

# create variable "year"
POP1992$ANO <- 1992
POP1993$ANO <- 1993
POP1994$ANO <- 1994
POP1995$ANO <- 1995
POP1996$ANO <- 1996
POP1997$ANO <- 1997
POP1998$ANO <- 1998
POP1999$ANO <- 1999
POP2000$ANO <- 2000
POP2001$ANO <- 2001
POP2002$ANO <- 2002
POP2003$ANO <- 2003
POP2004$ANO <- 2004
POP2005$ANO <- 2005
POP2006$ANO <- 2006
POP2007$ANO <- 2007
POP2008$ANO <- 2008
POP2009$ANO <- 2009
POP2010$ANO <- 2010
POP2011$ANO <- 2011
POP2012$ANO <- 2012
POP2013$ANO <- 2013
POP2014$ANO <- 2014
POP2015$ANO <- 2015
POP2016$ANO <- 2016
POP2017$ANO <- 2017
POP2018$ANO <- 2018
POP2019$ANO <- 2019
POP2020$ANO <- 2020

# create complete dataframe
POP_TOTAL <- rbind(POP1992, POP1993, POP1994, POP1995, POP1996, POP1997, POP1998,
                   POP1999, POP2000, POP2001, POP2002, POP2003, POP2004, POP2005,
                   POP2006, POP2007, POP2008, POP2009, POP2010, POP2011, POP2012,
                   POP2013, POP2014, POP2015, POP2016, POP2017, POP2018, POP2019,
                   POP2020)

# test
library(ggplot2)
library(dplyr)
g <- ggplot(data=filter(POP_TOTAL, MUNICIPIO=="Brasília"), aes(x=ANO,y=POPULACAO))
windows()
g + 
  geom_line() + 
  geom_point() +
  labs(title = "Estimativa Populacional - Brasília/DF",
       x = "Ano",
       y = "População") + 
  scale_x_continuous(breaks = seq(min(POP_TOTAL$ANO), max(POP_TOTAL$ANO), by = 3))

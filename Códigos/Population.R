

#################################### SOURCES ###################################

# estimativas populacionais de 1992 a 1999
https://www.ibge.gov.br/estatisticas/sociais/populacao/9103-estimativas-de-populacao.html?=&t=downloads

# estimativas populacionais de 2001 a 2020
https://sidra.ibge.gov.br/Tabela/6579

# contagem da populacao de 1996
https://sidra.ibge.gov.br/tabela/472

# contagem da populacao de 2007
https://sidra.ibge.gov.br/tabela/793

# censos demograficos de 2000 e 2010
https://sidra.ibge.gov.br/tabela/202

############################### PREPARE WORKSPACE ##############################

# packages used
library(readxl)
library(dplyr)

# view working directory
getwd()

#################################### CITIES ####################################

# load data
library(readxl)
pop1992 <- read_excel("./Bancos de dados/IBGE/Population/city1992.xlsx",
                      sheet = "dataset") 
pop1993 <- read_excel("./Bancos de dados/IBGE/Population/city1993.xlsx",
                      sheet = "dataset") 
pop1994 <- read_excel("./Bancos de dados/IBGE/Population/city1994.xlsx",
                      sheet = "dataset") 
pop1995 <- read_excel("./Bancos de dados/IBGE/Population/city1995.xlsx",
                      sheet = "dataset") 
pop1996 <- read_excel("./Bancos de dados/IBGE/Population/city1996.xlsx",
                      sheet = "dataset") 
pop1997 <- read_excel("./Bancos de dados/IBGE/Population/city1997.xlsx",
                      sheet = "dataset") 
pop1998 <- read_excel("./Bancos de dados/IBGE/Population/city1998.xlsx",
                      sheet = "dataset") 
pop1999 <- read_excel("./Bancos de dados/IBGE/Population/city1999.xlsx",
                      sheet = "dataset") 
pop2000 <- read_excel("./Bancos de dados/IBGE/Population/city2000.xlsx",
                      sheet = "dataset") 
pop2001 <- read_excel("./Bancos de dados/IBGE/Population/city2001.xlsx",
                      sheet = "dataset") 
pop2002 <- read_excel("./Bancos de dados/IBGE/Population/city2002.xlsx",
                      sheet = "dataset") 
pop2003 <- read_excel("./Bancos de dados/IBGE/Population/city2003.xlsx",
                      sheet = "dataset")
pop2004 <- read_excel("./Bancos de dados/IBGE/Population/city2004.xlsx",
                      sheet = "dataset")
pop2005 <- read_excel("./Bancos de dados/IBGE/Population/city2005.xlsx",
                      sheet = "dataset")
pop2006 <- read_excel("./Bancos de dados/IBGE/Population/city2006.xlsx",
                      sheet = "dataset")
pop2007 <- read_excel("./Bancos de dados/IBGE/Population/city2007.xlsx",
                      sheet = "dataset")
pop2008 <- read_excel("./Bancos de dados/IBGE/Population/city2008.xlsx",
                      sheet = "dataset")
pop2009 <- read_excel("./Bancos de dados/IBGE/Population/city2009.xlsx",
                      sheet = "dataset")
pop2010 <- read_excel("./Bancos de dados/IBGE/Population/city2010.xlsx",
                      sheet = "dataset")
pop2011 <- read_excel("./Bancos de dados/IBGE/Population/city2011.xlsx",
                      sheet = "dataset")
pop2012 <- read_excel("./Bancos de dados/IBGE/Population/city2012.xlsx",
                      sheet = "dataset")
pop2013 <- read_excel("./Bancos de dados/IBGE/Population/city2013.xlsx",
                      sheet = "dataset")
pop2014 <- read_excel("./Bancos de dados/IBGE/Population/city2014.xlsx",
                      sheet = "dataset")
pop2015 <- read_excel("./Bancos de dados/IBGE/Population/city2015.xlsx",
                      sheet = "dataset")
pop2016 <- read_excel("./Bancos de dados/IBGE/Population/city2016.xlsx",
                      sheet = "dataset")
pop2017 <- read_excel("./Bancos de dados/IBGE/Population/city2017.xlsx",
                      sheet = "dataset")
pop2018 <- read_excel("./Bancos de dados/IBGE/Population/city2018.xlsx",
                     sheet = "dataset")
pop2019 <- read_excel("./Bancos de dados/IBGE/Population/city2019.xlsx",
                      sheet = "dataset")
pop2020 <- read_excel("./Bancos de dados/IBGE/Population/city2020.xlsx",
                      sheet = "dataset")

# create variable "ANO"
pop1992$ANO <- 1992
pop1993$ANO <- 1993
pop1994$ANO <- 1994
pop1995$ANO <- 1995
pop1996$ANO <- 1996
pop1997$ANO <- 1997
pop1998$ANO <- 1998
pop1999$ANO <- 1999
pop2000$ANO <- 2000
pop2001$ANO <- 2001
pop2002$ANO <- 2002
pop2003$ANO <- 2003
pop2004$ANO <- 2004
pop2005$ANO <- 2005
pop2006$ANO <- 2006
pop2007$ANO <- 2007
pop2008$ANO <- 2008
pop2009$ANO <- 2009
pop2010$ANO <- 2010
pop2011$ANO <- 2011
pop2012$ANO <- 2012
pop2013$ANO <- 2013
pop2014$ANO <- 2014
pop2015$ANO <- 2015
pop2016$ANO <- 2016
pop2017$ANO <- 2017
pop2018$ANO <- 2018
pop2019$ANO <- 2019
pop2020$ANO <- 2020

# create data frame "population all cities all years"
popCities <- rbind(pop1992, pop1993, pop1994, pop1995, pop1996, pop1997, pop1998,
                   pop1999, pop2000, pop2001, pop2002, pop2003, pop2004, pop2005,
                   pop2006, pop2007, pop2008, pop2009, pop2010, pop2011, pop2011,
                   pop2012, pop2013, pop2014, pop2015, pop2016, pop2017, pop2018,
                   pop2019, pop2020)

# export data frame "population all cities all years"
write.csv(popCities,"./Arquivos exportados/popCities.csv")

################################### COUNTRY ####################################

popBR <- read_excel("./Bancos de dados/IBGE/Population/br.xlsx",
                    sheet = "dataset")



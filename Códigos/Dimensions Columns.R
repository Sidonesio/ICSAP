
# prepare working directory
wd <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd)
getwd()

# read data frame colnames
COL1992 <- read.csv2("./colnamesSIH1992.csv")
COL1993 <- read.csv2("./colnamesSIH1993.csv")
COL1994 <- read.csv2("./colnamesSIH1994.csv")
COL1995 <- read.csv2("./colnamesSIH1995.csv")
COL1996 <- read.csv2("./colnamesSIH1996.csv")
COL1997 <- read.csv2("./colnamesSIH1997.csv")
COL1998 <- read.csv2("./colnamesSIH1998.csv")
COL1999 <- read.csv2("./colnamesSIH1999.csv")
COL2000 <- read.csv2("./colnamesSIH2000.csv")
COL2001 <- read.csv2("./colnamesSIH2001.csv")
COL2002 <- read.csv2("./colnamesSIH2002.csv")
COL2003 <- read.csv2("./colnamesSIH2003.csv")
COL2004 <- read.csv2("./colnamesSIH2004.csv")
COL2005 <- read.csv2("./colnamesSIH2005.csv")
COL2006 <- read.csv2("./colnamesSIH2006.csv")
COL2007 <- read.csv2("./colnamesSIH2007.csv")
COL2008 <- read.csv2("./colnamesSIH2008.csv")
COL2009 <- read.csv2("./colnamesSIH2009.csv")
COL2010 <- read.csv2("./colnamesSIH2010.csv")
COL2011 <- read.csv2("./colnamesSIH2011.csv")
COL2012 <- read.csv2("./colnamesSIH2012.csv")
COL2013 <- read.csv2("./colnamesSIH2013.csv")
COL2014 <- read.csv2("./colnamesSIH2014.csv")
COL2015 <- read.csv2("./colnamesSIH2015.csv")
COL2016 <- read.csv2("./colnamesSIH2016.csv")
COL2017 <- read.csv2("./colnamesSIH2017.csv")
COL2018 <- read.csv2("./colnamesSIH2018.csv")
COL2019 <- read.csv2("./colnamesSIH2019.csv")
COL2020 <- read.csv2("./colnamesSIH2020.csv")

# remove first variable X from colnames data frames when necessary
COL1994 <- COL1994[-1,]
COL1996 <- COL1996[-1,]
COL2001 <- COL2001[-1,]
COL2003 <- COL2003[-1,]
COL2004 <- COL2004[-1,]
COL2006 <- COL2006[-1,]
COL2007 <- COL2007[-1,]
COL2008 <- COL2008[-1,]
COL2009 <- COL2009[-1,]
COL2010 <- COL2010[-1,]
COL2011 <- COL2011[-1,]
COL2012 <- COL2012[-1,]
COL2013 <- COL2013[-1,]
COL2014 <- COL2014[-1,]
COL2015 <- COL2015[-1,]
COL2016 <- COL2016[-1,]
COL2017 <- COL2017[-1,]
COL2018 <- COL2018[-1,]
COL2019 <- COL2019[-1,]

# read data frames dimensions
DIM1992 <- read.csv2("./dimSIH1992.csv")
DIM1993 <- read.csv2("./dimSIH1993.csv")
DIM1994 <- read.csv2("./dimSIH1994.csv")
DIM1995 <- read.csv2("./dimSIH1995.csv")
DIM1996 <- read.csv2("./dimSIH1996.csv")
DIM1997 <- read.csv2("./dimSIH1997.csv")
DIM1998 <- read.csv2("./dimSIH1998.csv")
DIM1999 <- read.csv2("./dimSIH1999.csv")
DIM2000 <- read.csv2("./dimSIH2000.csv")
DIM2001 <- read.csv2("./dimSIH2001.csv")
DIM2002 <- read.csv2("./dimSIH2002.csv")
DIM2003 <- read.csv2("./dimSIH2003.csv")
DIM2004 <- read.csv2("./dimSIH2004.csv")
DIM2005 <- read.csv2("./dimSIH2005.csv")
DIM2006 <- read.csv2("./dimSIH2006.csv")
DIM2007 <- read.csv2("./dimSIH2007.csv")
DIM2008 <- read.csv2("./dimSIH2008.csv")
DIM2009 <- read.csv2("./dimSIH2009.csv")
DIM2010 <- read.csv2("./dimSIH2010.csv")
DIM2011 <- read.csv2("./dimSIH2011.csv")
DIM2012 <- read.csv2("./dimSIH2012.csv")
DIM2013 <- read.csv2("./dimSIH2013.csv")
DIM2014 <- read.csv2("./dimSIH2014.csv")
DIM2015 <- read.csv2("./dimSIH2015.csv")
DIM2016 <- read.csv2("./dimSIH2016.csv")
DIM2017 <- read.csv2("./dimSIH2017.csv")
DIM2018 <- read.csv2("./dimSIH2018.csv")
DIM2019 <- read.csv2("./dimSIH2019.csv")
DIM2020 <- read.csv2("./dimSIH2020.csv")

# create data frames dimensions with all years
DIMtotal <- rbind(DIM1992,DIM1993,DIM1994,DIM1995,DIM1996,DIM1997,DIM1998,
                  DIM1999,DIM2000,DIM2001,DIM2002,DIM2003,DIM2004,DIM2005,
                  DIM2006,DIM2007,DIM2008,DIM2009,DIM2010,DIM2011,DIM2012,
                  DIM2013,DIM2014,DIM2015,DIM2016,DIM2017,DIM2018,DIM2019,
                  DIM2020)

# remove firts column X
DIMtotal$X <- NULL

# fix values where they are incorrect
# because of first value X on colnames data frames

DIMtotal[3,3] <- 39
DIMtotal[5,3] <- 41
DIMtotal[10,3] <- 60
DIMtotal[12,3] <- 69
DIMtotal[13,3] <- 71
DIMtotal[15,3] <- 78
DIMtotal[16,3] <- 75
DIMtotal[17,3] <- 86
DIMtotal[18,3] <- 86
DIMtotal[19,3] <- 86
DIMtotal[20,3] <- 93
DIMtotal[21,3] <- 93
DIMtotal[22,3] <- 95
DIMtotal[23,3] <- 113
DIMtotal[24,3] <- 113
DIMtotal[25,3] <- 113
DIMtotal[26,3] <- 113
DIMtotal[27,3] <- 113
DIMtotal[28,3] <- 113

# export data frame dimensions
write.csv2(DIMtotal, "./Dimesions.csv")

# reset row names when necessary
row.names(COL1994) <- NULL
row.names(COL1996) <- NULL
row.names(COL2001) <- NULL
row.names(COL2003) <- NULL
row.names(COL2004) <- NULL
row.names(COL2006) <- NULL
row.names(COL2007) <- NULL
row.names(COL2008) <- NULL
row.names(COL2009) <- NULL
row.names(COL2010) <- NULL
row.names(COL2011) <- NULL
row.names(COL2012) <- NULL
row.names(COL2013) <- NULL
row.names(COL2014) <- NULL
row.names(COL2015) <- NULL
row.names(COL2016) <- NULL
row.names(COL2017) <- NULL
row.names(COL2018) <- NULL
row.names(COL2019) <- NULL

# set correct values on column X
COL1994$X <- c(1:39)
COL1996$X <- c(1:41)
COL2001$X <- c(1:60)
COL2003$X <- c(1:69)
COL2004$X <- c(1:71)
COL2006$X <- c(1:78)
COL2007$X <- c(1:75)
COL2008$X <- c(1:86)
COL2009$X <- c(1:86)
COL2010$X <- c(1:86)
COL2011$X <- c(1:93)
COL2012$X <- c(1:93)
COL2013$X <- c(1:95)
COL2014$X <- c(1:113)
COL2015$X <- c(1:113)
COL2016$X <- c(1:113)
COL2017$X <- c(1:113)
COL2018$X <- c(1:113)
COL2019$X <- c(1:113)

# merge all data frames in just one
COLtotal <- merge(COL1992, COL1993, by.x = "X1992", by.y = "X1993", all = TRUE)
COLtotal <- merge(COLtotal, COL1994, by.x = "X1992", by.y = "X1994", all = TRUE)
COLtotal <- merge(COLtotal, COL1995, by.x = "X1992", by.y = "X1995", all = TRUE)
COLtotal <- merge(COLtotal, COL1996, by.x = "X1992", by.y = "X1996", all = TRUE)
COLtotal <- merge(COLtotal, COL1997, by.x = "X1992", by.y = "X1997", all = TRUE)
COLtotal <- merge(COLtotal, COL1998, by.x = "X1992", by.y = "X1998", all = TRUE)
COLtotal <- merge(COLtotal, COL1999, by.x = "X1992", by.y = "X1999", all = TRUE)
COLtotal <- merge(COLtotal, COL2000, by.x = "X1992", by.y = "X2000", all = TRUE)
COLtotal <- merge(COLtotal, COL2001, by.x = "X1992", by.y = "X2001", all = TRUE)
COLtotal <- merge(COLtotal, COL2002, by.x = "X1992", by.y = "X2002", all = TRUE)
COLtotal <- merge(COLtotal, COL2003, by.x = "X1992", by.y = "X2003", all = TRUE)
COLtotal <- merge(COLtotal, COL2004, by.x = "X1992", by.y = "X2004", all = TRUE)
COLtotal <- merge(COLtotal, COL2005, by.x = "X1992", by.y = "X2005", all = TRUE)
COLtotal <- merge(COLtotal, COL2006, by.x = "X1992", by.y = "X2006", all = TRUE)
COLtotal <- merge(COLtotal, COL2007, by.x = "X1992", by.y = "X2007", all = TRUE)
COLtotal <- merge(COLtotal, COL2008, by.x = "X1992", by.y = "X2008", all = TRUE)
COLtotal <- merge(COLtotal, COL2009, by.x = "X1992", by.y = "X2009", all = TRUE)
COLtotal <- merge(COLtotal, COL2010, by.x = "X1992", by.y = "X2010", all = TRUE)
COLtotal <- merge(COLtotal, COL2011, by.x = "X1992", by.y = "X2011", all = TRUE)
COLtotal <- merge(COLtotal, COL2012, by.x = "X1992", by.y = "X2012", all = TRUE)
COLtotal <- merge(COLtotal, COL2013, by.x = "X1992", by.y = "X2013", all = TRUE)
COLtotal <- merge(COLtotal, COL2014, by.x = "X1992", by.y = "X2014", all = TRUE)
COLtotal <- merge(COLtotal, COL2015, by.x = "X1992", by.y = "X2015", all = TRUE)
COLtotal <- merge(COLtotal, COL2016, by.x = "X1992", by.y = "X2016", all = TRUE)
COLtotal <- merge(COLtotal, COL2017, by.x = "X1992", by.y = "X2017", all = TRUE)
COLtotal <- merge(COLtotal, COL2018, by.x = "X1992", by.y = "X2018", all = TRUE)
COLtotal <- merge(COLtotal, COL2019, by.x = "X1992", by.y = "X2019", all = TRUE)
COLtotal <- merge(COLtotal, COL2020, by.x = "X1992", by.y = "X2020", all = TRUE)

# set column names properly
names(COLtotal)[1] <- "TOTAL"
names(COLtotal)[2] <- "COL1992"
names(COLtotal)[3] <- "COL1993"
names(COLtotal)[4] <- "COL1994"
names(COLtotal)[5] <- "COL1995"
names(COLtotal)[6] <- "COL1996"
names(COLtotal)[7] <- "COL1997"
names(COLtotal)[8] <- "COL1998"
names(COLtotal)[9] <- "COL1999"
names(COLtotal)[10] <- "COL2000"
names(COLtotal)[11] <- "COL2001"
names(COLtotal)[12] <- "COL2002"
names(COLtotal)[13] <- "COL2003"
names(COLtotal)[14] <- "COL2004"
names(COLtotal)[15] <- "COL2005"
names(COLtotal)[16] <- "COL2006"
names(COLtotal)[17] <- "COL2007"
names(COLtotal)[18] <- "COL2008"
names(COLtotal)[19] <- "COL2009"
names(COLtotal)[20] <- "COL2010"
names(COLtotal)[21] <- "COL2011"
names(COLtotal)[22] <- "COL2012"
names(COLtotal)[23] <- "COL2013"
names(COLtotal)[24] <- "COL2014"
names(COLtotal)[25] <- "COL2015"
names(COLtotal)[26] <- "COL2016"
names(COLtotal)[27] <- "COL2017"
names(COLtotal)[28] <- "COL2018"
names(COLtotal)[29] <- "COL2019"
names(COLtotal)[30] <- "COL2020"

# export data frame columns
write.csv2(COLtotal, "./Variables.csv")


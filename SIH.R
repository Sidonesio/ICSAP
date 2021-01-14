




getwd()

SIH2008 <- read.table("./Banco de dados/SIH/SIH2008.csv", sep = "\t", header = TRUE)


                      
                      

"./Banco de dados/SIH/ETLSIH/home/dataiku/dss/exports/data/ETLSIH.ST_2008.csv"

data <- read.table(unz("Sales.zip", "Sales.dat"), nrows=10, header=T, quote="\"", sep=",")



## Função para fazer download de arquivos .dbc do SIHSUS a partir do FTP do Datasus
download.dbc <- function(ftp_path,
                        dest_files_path = getwd(),
                        estados = NULL, anos = NULL, meses = NULL){
  require(RCurl)
  require(tidyverse)
  require(stringr)
  
  anos <- str_pad(as.numeric(anos)-2000, 2, pad = "0")
  meses <- str_pad(meses, 2, pad = "0")
  
  url <- ftp_path
  #userpwd <- "bissoli:i5CH9i77%"
  #recupera o nome dos arquivos em ftp_path
  filenames <- getURL(url, userpwd = NULL,
                      ftp.use.epsv = FALSE,dirlistonly = TRUE)
  filenames <- unlist(strsplit(filenames,"\n"))
  filenames <- data.frame(filename=filenames)
  filenames <- data.frame(lapply(filenames, as.character), stringsAsFactors=FALSE)
  
  #filtra os estados desejados se estes forem especificados
  if(!is.null(estados)){
    filenames <- filenames %>%
      filter(str_detect(filename, paste(estados,sep="",collapse = '|')))
  }
  #filtra os anos e meses desejados se estes forem especificados
  aamm <- as.vector(outer(anos, meses, paste, sep=""))
  #filtra os anos e meses desejados se estes forem especificados
  if(!is.null(aamm)){
    filenames <- filenames %>%
      filter(str_detect(filename, paste(aamm,sep="",collapse = '|')))
  }
  
  #faz download dos arquivos selecionados e salva os arquivos em dest_files_path
  for (filename in filenames$filename) {
    download.file(paste(url, filename, sep = ""), paste(dest_files_path, "/", filename, sep = ""))
  }
  
  #retorna um data.frame com os nomes e caminho dos arquivos
  return(data.frame(file_name=filenames$filename,file_path=dest_files_path))
}




#============[INTERAÇÂO DSS]============
library(dataiku)
library(dplyr)
#===========================================

#Caminho para função "download.dbc"
path.script = "https://github.com/bigdata-icict/ETL-Dataiku-DSS/raw/master/SIH/download.dbc.r"

#Caminho FTP Datasus
ftp_path = "ftp://ftp.datasus.gov.br/dissemin/publicos/SIHSUS/200801_/Dados/"

#============[EDITAR]============
#Local para salvamento dos arquivos .dbc
path.data = "./Banco de dados/SIH"
#================================

#============[OPCIONAL]============
#filtros de estado e/ou anos
estados = NULL #outro exemplo: c("RJ")
anos = 1992:2020 #outro exemplo: 2000:2014
meses = 1:12 #outro exemplo: 1:12
#==================================

#Carrega função "download.dbc"
if(!exists("download.dbc", mode="function")) source(path.script)

# Computa retorno da receita: nome dos arquivos .dbc baixados
datasus_files_list <- download.dbc(ftp_path = ftp_path,
                                   dest_files_path = path.data,
                                   estados = estados,
                                   anos = anos,
                                   meses=meses)

#=============[INTERAÇÂO DSS]=============== -> Alternativa: salvar data.frame em arquivo .csv 
# Retornando resultados para dataset do DSS
dkuWriteDataset(datasus_files_list,"datasus",schema = TRUE)
#===========================================










# load packages needed to run tutorial
# install packages if not installed
loadlibrary <- function(x){
  if (!require(x,character.only = TRUE)) {
    install.packages(x, repos='http://cran.fiocruz.br/', dep=TRUE)
    if(!require(x,character.only = TRUE)) stop("Package not found")
  }
}

# access Elastic Search (ES) index
loadlibrary("elasticsearchr") 

# load other packages
packages <- c("dplyr","curl","jsonlite","ggplot2")
lapply(packages, loadlibrary)

# tell R what are the connection parameters to ES index
es_host <- "dados-pcdas.icict.fiocruz.br"
es_port <- 443
es_transport_schema <- "https"
es_user <- "bissoli"
es_pwd <- "i5CH9i77%"

# URL connection with ES
es_url <- paste(es_transport_schema,"://",es_user,":",es_pwd,"@",es_host,":",
                es_port,sep="")



es_sih <- elasticsearchr::elastic(es_url, "datasus-sih")


print(es_sih)






URL <- "https://bigdata-arquivos.icict.fiocruz.br/SIH/ETLSIH.zip"
download.file(URL, destfile = "./Banco de dados/SIH.zip")
dateDOwnload <- date()

# read data
SIH2009 <- read.table("./Banco de dados/SIH/SIH2009.csv", 
                      sep = "", quote="", header = TRUE)





library(devtools) # load package
install_github("rfsaldanha/microdatasus") # install package
library(microdatasus) # load package

# download and read data set
sih1992 <- fetch_datasus(year_start = 1992, month_start = 1,
                       year_end = 1993, month_end = 12,
                       uf = "all", 
                       information_system = "SIH-RD")






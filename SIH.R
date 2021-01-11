
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
es_user <- "sbissoli76@gmail.com"
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






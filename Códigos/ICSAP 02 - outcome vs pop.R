
# packages
library(bestNormalize)
library(ggplot2)

# read data
wd1 <- "C:/Users/Dell/OneDrive/R/ICSAP/Arquivos exportados"
setwd(wd1)
getwd()
df1 <- read.csv2("./CityICSAP2.csv", colClasses=c("COD_MUNIC" = "character"))

# distribution and summary statistics ICSAPrate
windows()
par(mfrow = c(1, 1))
hist(df1$ICSAPrate)
summary(df1$ICSAPrate)

# distribution and summary statistics ICSAPprop
hist(df1$ICSAPprop)
summary(df1$ICSAPprop)

# distribution and summary statistics POPULACAO
hist(df1$POPULACAO)
summary(df1$POPULACAO)

# choose normalization method for variables
library(bestNormalize)
bestNormalize(df1$ICSAPprop)
bestNormalize(df1$ICSAPrate)
bestNormalize(df1$POPULACAO)

# run best normalization method
ICSAPpropNorm <- bestNormalize(df1$ICSAPprop)
ICSAPrateNorm <- bestNormalize(df1$ICSAPrate)
PopNorm <- bestNormalize(df1$POPULACAO)

# scatterplot ICSAPrate vs POPULACAO
library(ggplot2)
g <- ggplot(data = df1, aes(x = POPULACAO, y = ICSAPrate))
par(mfrow = c(1, 1))
g + 
  geom_point(alpha = .4, color = "blue4") + 
  geom_smooth(colour = "red")

# combine data frame
df2 <- as.data.frame(cbind(PopNorm$x.t, ICSAPrateNorm$x.t, ICSAPpropNorm$x.t))
colnames(df2)[1] <- "PopNorm"
colnames(df2)[2] <- "ICSAPrateNorm"
colnames(df2)[3] <- "ICSAPpropNorm"

# scatterplot ICSAPrateNorm vs PopNorm
g <- ggplot(data = df2, aes(x = PopNorm, y = ICSAPrateNorm))
g + 
  geom_point(alpha = .4, color = "blue4") + 
  geom_smooth(colour = "red")

# correlation ICSAPrateNorm vs PopNorm
cor.test(df2$PopNorm, df2$ICSAPrateNorm)

# simple linear regression ICSAPrateNorm vs PopNorm
fit <- lm(ICSAPrateNorm ~ PopNorm, data = df2)
summary(fit)

# check residuals
windows()
par(mfrow = c(2, 2))
plot(fit)
par(mfrow = c(1, 1))
hist(fit$residuals)

# scatterplot ICSAPpropNorm vs PopNorm
g <- ggplot(data = df2, aes(x = PopNorm, y = ICSAPpropNorm))
par(mfrow = c(1, 1))
g + 
  geom_point(alpha = .4, color = "blue4") + 
  geom_smooth(colour = "red")

# correlation ICSAPpropNorm vs PopNorm
cor.test(df2$PopNorm, df2$ICSAPpropNorm)

# simple linear regression ICSAPpropNorm vs PopNorm
fit <- lm(ICSAPpropNorm ~ PopNorm, data = df2)
summary(fit)

# check residuals
windows()
par(mfrow = c(2, 2))
plot(fit)
par(mfrow = c(1, 1))
hist(fit$residuals)

# simple linear regression ICSAPrate vs Population
fit <- lm(ICSAPrate ~ POPULACAO, data = df1)
summary(fit)
par(mfrow = c(2, 2))
plot(fit)

# simple linear regression ICSAPprop vs Population
fit <- lm(ICSAPprop ~ POPULACAO, data = df1)
summary(fit)
par(mfrow = c(2, 2))
plot(fit)

# simple linear regression ICSAPprop vs PopNorm
fit <- lm(df1$ICSAPprop ~ df2$PopNorm)
summary(fit)
par(mfrow = c(2, 2))
plot(fit)


#===============================================================================
#
# DEVOIR MAISON 
#
#===============================================================================
station <- read.table("H:/personnel/Modélisation statistique/regressionLineaire/station.txt", header=TRUE)
attach(station)

plot(station)
library(PCAmixdata)
res <- PCAmix(station, graph=FALSE)
round(res$eig, digit=2)
head(station)



# y variable à expliquer : les ventes des stations services
res <- lm(ventes~., data=station)
summary(res)
summary(ventes)

step(res)

res1 <- lm(ventes~trafic+nbpompes)
shapiro.test(res1$residuals)

plot(res1$fitted, res1$residuals)
abline(h=0)

outlier<-which(abs(res1$residuals)<-10)
outlier
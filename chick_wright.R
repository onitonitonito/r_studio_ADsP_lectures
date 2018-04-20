rm(list=ls())

library(MASS)
data("ChickWeight")
colnames(ChickWeight)

"______ 자료유형 분석 _________"
head(ChickWeight)
summary(ChickWeight)
length(ChickWeight$weight)
plot(ChickWeight)

# ChickWeight$Diet
# ChickWeight$Chick

y <- ChickWeight[ChickWeight$Diet==1,]$weight
x <- ChickWeight[ChickWeight$Diet==1,]$Time

plot(x,y)
m1 = lm(formula=x~y, data=ChickWeight)
abline(m1, lty="dotted")

summary(m1)

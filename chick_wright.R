rm(list=ls())

library(MASS)
data("ChickWeight")
colnames(ChickWeight)

"______ 자료유형 분석 _________"
ChickWeight
head(ChickWeight)
summary(ChickWeight)
length(ChickWeight$weight)
plot(ChickWeight)

# ChickWeight$Diet
# ChickWeight$Chick

x <- ChickWeight[ChickWeight$Diet==1,]$weight
y <- ChickWeight[ChickWeight$Diet==1,]$Time


m1 = lm(y~x, data=ChickWeight)
plot(y,x)

abline(m1, lty="dotted")

summary(m1)

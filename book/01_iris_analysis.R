rm(list=ls())

setwd("~/Github/r_studio_ADsP_lectures/book")
getwd()

setwd("~/Github/r_studio_ADsP_lectures")
getwd()

###-----------------------------------------------------------------------------
### 1.descriptive statistics
###-----------------------------------------------------------------------------

data(iris)
length(iris$Species)
colnames(iris)
head(iris)
summary(iris)
plot(iris)

se_L <- iris$Sepal.Length
mean(se_L)
median(se_L)

sd(se_L)
var(se_L)

hist(se_L)

quantile(se_L)
quantile(se_L, 3/4)

max(se_L)
min(se_L)

y <- iris[iris$Species == 'setosa',]$Petal.Length
x <- iris[iris$Species == 'setosa',]$Petal.Width

y1 <- iris$Petal.Length
x1 <- iris$Petal.Width

hist(x)
hist(y)
plot(y, x)

hist(x1)
hist(y1)
plot(y1, x1)

m1 = lm(formula=y1~x1, data=iris)
abline(m1, lty="dotted")

summary(m1)

rm(list=ls())
###-----------------------------------------------------------------------------
### 1.descriptive statistics
###-----------------------------------------------------------------------------

data(iris)
colnames(iris)
head(iris)
summary(iris)

se_L <- iris$Sepal.Length
mean(se_L)
median(se_L)

sd(se_L)
var(se_L)

quantile(se_L)
quantile(se_L, 3/4)

max(se_L)
min(se_L)

y <- iris[iris$Species == 'setosa',]$Petal.Length
x <- iris[iris$Species == 'setosa',]$Petal.Width
plot(x, y)

m1 = lm(formula=y~x, data=iris)
abline(m1, lty="dotted")
summary(m1)

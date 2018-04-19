library(Hmisc)
rm(list=ls())

set.seed(2)
x <- runif(10,0,11)
y <- runif(10, 11, 20)

df <- data.frame(x,y)
df

plot(x,y)

kk <- lm(y ~ x, data=df)
abline(kk, lty="dotted")
kk

summary(kk)    # 선형회귀에 대한 검증값을 설명해 준다.

rcorr(x, y)


"_________ summary(kk) __________________________________

Call:
lm(formula = y ~ x, data = df)

Residuals:
Min      1Q  Median      3Q     Max
-3.5672 -1.9257 -0.2518  2.0570  4.1008

Coefficients:
Estimate Std. Error t value Pr(>|t|)
(Intercept) 15.82328    1.94450   8.137 3.86e-05 ***
x           -0.09608    0.28313  -0.339    0.743
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.917 on 8 degrees of freedom
Multiple R-squared:  0.01419,	Adjusted R-squared:  -0.109
F-statistic: 0.1152 on 1 and 8 DF,  p-value: 0.7431
"


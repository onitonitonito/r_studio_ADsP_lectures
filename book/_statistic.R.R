init <- function()
  {
    rm(list=ls())
    setwd("~/Github/r_studio_ADsP_lectures")
    getwd()
  }

###-----------------------------------------------------------------------------
### 1.descriptive statistics
###-----------------------------------------------------------------------------
init()

?iris
data(iris)
head(iris)
summary(iris)

Se_L <- iris$Sepal.Length
mean(Se_L)
median(Se_L)
sd(Se_L)
var(Se_L)
quantile(Se_L)
quantile(Se_L, 3/4)
max(Se_L)
min(Se_L)

install.packages("MASS")
library(MASS)

data(Animals, package="MASS")
Animals

summary(Cars93)


An_B <- Animals$body
mean(An_B)
median(An_B)
sd(An_B)
var(An_B)
quantile(An_B, 1/4)
quantile(An_B, 3/4)
max(An_B)
min(An_B)
quantile(An_B)

An_b <- Animals$brain
mean(An_b)
median(An_b)
sd(An_b)
var(An_b)
quantile(An_b, 1/4)
quantile(An_b, 3/4)
max(An_b)
min(An_b)
quantile(An_b)



###-----------------------------------------------------------------------------
### 3. correlation analysis
###-----------------------------------------------------------------------------
init()

1+1
14-10
4*6
28/7
38%%7

oddcount <- function(x) {
    k <- 0
    for(n in x) {
        if(n%%2==1) k <- k + 1
      }
    return(k)
  }

oddcount(c(1,3,4))
oddcount(c(1,2,3,4,5,6,7))


data(mtcars)
plot(mtcars)

colnames(mtcars)
head(mtcars)
summary(mtcars)

a <- mtcars$mpg
b <- mtcars$hp
c<-mtcars$wt
plot(a, b)
plot(a, c)



cov(a,c)
cor(a,c)

cor(mtcars)
cov(mtcars)


install.packages("Hmisc")
library(Hmisc)

rcorr(a, c, type="pearson")
rcorr(as.matrix(mtcars), type="spearman")
rcorr(as.matrix(mtcars), type="spearman")$r



test <- read.csv("D:/데이터분석 강의/4.2/data/4.2_001.csv")
test<-test[,-1]
library(Hmisc)
rcorr(as.matrix(test), type="spearman")        # type = spearman | pearson
rcorr(as.matrix(test), type="spearman")$r


test2 <- read.csv("D:/데이터분석 강의/4.2/data/4.2_002.csv")
test2
rcorr(as.matrix(test2), type="pearson")



###-----------------------------------------------------------------------------
### 4. regression analysis
###-----------------------------------------------------------------------------

set.seed(2)
x <- runif(10, 0, 11)
y <- runif(10, 11, 20)
dfrm <- data.frame(x, y)
dfrm

lm (y ~ x, data=dfrm)
# y = 15.82328 - 0.09608 * x


set.seed(2)
y <- runif(10, -10, 20)
u <- runif(10, 0, 11)
v <- runif(10, 11, 20)
w <- runif(10, 1, 30)
dfrm <- data.frame(y, u, v, w)
dfrm
m <- lm(y ~ u + v + w)
m
#  y = 3.8503 - 0.2090 * u + 0.4120 * v - 0.1609 * w

summary(m)

# F통계량 : 0.1029
# p-value : 0.9554 (유의수준 5%하에 유의하지 않음 0.05)
# 회귀계수 : u,v,w 모두 p-value가 0.05 보다 커서 회귀계수의 추정들이 통계적으로 유의하지 않음
# 결정계수 R-squared = 0.04894, Adjusted R-squared = -0.4266 : 회귀식이 데이터를 적절하게 설명하지 못함


install.packages("MASS")
library(MASS)
head(ChikWeight)

data(ChickWeight, package="datasets")
head(ChickWeight)

Chick <- ChickWeight[ChickWeight$Diet == 1, ]
Chick
Chick <- ChickWeight[ChickWeight$Chick == 1, ]
Chick

m <- lm(weight~Time, data=Chick)
m

#  weight = 24.465 + 7.988 * time

summary(m)

# F통계량 : 232.9
# p-value : 0.0000002974 (유의수준 5%하에 회귀모형이 통계적으로 유의함)
# 회귀계수 : time 의 p-value가 0.05 보다 작아서 회귀계수의 추정이 통계적으로 유의함
# 결정계수 R-squared = 0.9588, Adjusted R-squared = 0.9547 : 회귀식이 데이터를 적절하게 설명함


# 예제: cars 데이터를 활용한 곡선회귀분석

data(cars, package="datasets")
cars

speed2 <- cars$speed^2
cars <- cbind(speed2, cars)
cars

m <- lm(dist ~ speed + speed2, data=cars)
m

#  dist = 2.47014 + 0.91329 *speed  +0.09996 * speed^2

summary(m)

# F통계량 : 47.14
# p-value : 5.852e-12 (유의수준 5%하에 회귀모형이 통계적으로 유의함)
# 회귀계수 : speed 의 p-value가 0.05 보다 커서 회귀계수의 추정이 통계적으로 유의하지 못함
# 결정계수 R-squared = 0.6673, Adjusted R-squared = 0.6532 : 회귀식이 데이터를 적절하게 설명한다.


#2차 곡선 회귀분석

x <- c(1:9)
y <- c(5, 3, 2, 3, 4, 6, 10, 12, 18)
df1 <- data.frame(x, y)
df1
plot(df1)

x2 <- x^2
df2 <- cbind(x2, df1)
df2

m <- lm(y ~ x, data=df1)
m

#  y = -1.167 + 1.633 *x

summary(m)

# F통계량 : 16.99
# p-value : 0.0044 (유의수준 5%하에 회귀모형이 통계적으로 유의함)
# 회귀계수 : speed 의 p-value가 0.05 보다 작아 회귀계수의 추정이 통계적으로 유의함
# 결정계수 R-squared = 0.7083, Adjusted R-squared = 0.666 : 회귀식이 데이터를 적절하게 설명한다.



m2 <- lm(y ~ x + x2, data=df2)
m2
#  y = 7.1667 + -2.9121 *x +0.4545 *x^2
summary(m2)

# F통계량 : 292.2
# p-value : 1.05e-06 (유의수준 5%하에 회귀모형이 통계적으로 유의함)
# 회귀계수 : speed 의 p-value가 0.05 보다 작아 회귀계수의 추정이 통계적으로 유의함
# 결정계수 R-squared = 0.9898, Adjusted R-squared = 0.9864 : 회귀식이 데이터를 적절하게 설명한다.







###-----------------------------------------------------------------------------
###  logistic regression analysis
###-----------------------------------------------------------------------------

library(boot)
data(nodal)
nodal
rd <- nodal[,-1]
gfit <- glm(r~., data=rd, family="binomial")
summary(gfit)

# 최종 회귀식
a<-c(2,4,6,7)
rd<-nodal[,a]
rd
gfit <- glm(r~., data=rd, family="binomial")
summary(gfit)




###-----------------------------------------------------------------------------
###  regression analysis  (variable selection)
###-----------------------------------------------------------------------------

#Backward selection

x1 <- c(7, 1, 11, 11, 7, 11, 3, 1, 2,21, 1,11, 10)
x2 <- c(26, 29, 56, 31, 52, 55, 71,31, 54, 47, 40, 66, 68)
x3 <- c(6, 15, 8, 8, 6, 9, 17, 22, 18, 4, 23, 9, 8)
x4 <- c(60, 52, 20, 47, 33, 22, 6, 44, 22, 26, 34, 12, 12)
y <- c(78.5, 74.3, 104.3, 87.6, 95.9, 109.2, 102.7, 72.5, 93.1, 115.9, 83.8, 113.3, 109.4)
df <- data.frame(x1, x2, x3, x4, y)
df
plot(df)

a <- lm(y ~ x1 + x2 + x3 + x4, data=df)
summary(a)

b <- lm(y ~ x1 + x2 + x4, data=df)
summary(b)

c <- lm(y ~ x1 + x2, data=df)
summary(c)



#--- direction : forward, backward, both

step(lm(y ~ 1, data=df), scope=list(lower = ~ 1, upper = ~ x1 + x2 + x3 + x4), direction = "forward")


step(lm(y ~ x1 + x2 + x3 + x4, data=df), scope=list(lower = ~ 1, upper = ~ x1 + x2 + x3 + x4), direction = "backward")


step(lm(y ~ 1, data=df), scope=list(lower = ~ 1, upper = ~ x1 + x2 + x3 + x4), direction = "both")


#MASS 패키지의 hills 데이터를 활용해서 time을 종속변수로 전진선택법으로 회귀분석


data(hills, package="MASS")
head(hills)

step(lm(time ~ 1, data=hills), scope=list(lower = ~ 1, upper = ~ dist + climb + time), direction = "forward")



# 데이터 셋을 불러들여 setp 함수를 통한 회귀분석 실시


#data <- read.table("E:/ADSP/교육자료/4.2/data/4.2_003.csv", header=TRUE, sep=",",
stringsAsFactors=FALSE, na.strings=c('NIL'),
comment.char="#", encoding="UTF-8")
Bio <- read.csv("E:/ADSP/교육자료/4.2/data/4.2_003.csv", header=T, encoding="UTF-8")
head(Bio)

step(lm(Pemax ~ 1, data=Bio), scope=list(lower = ~ 1, upper = ~ age + height + weight + BMP + RV + FRC + TLC), direction = "forward")

step(lm(Pemax ~ age + height + weight + BMP + RV + FRC + TLC, data=Bio), scope=list(lower = ~ 1, upper = ~ age + height + weight + BMP + RV + FRC + TLC), direction = "backward")

step(lm(Pemax ~ 1, data=Bio), scope=list(lower = ~ 1, upper = ~ age + height + weight + BMP + RV + FRC + TLC), direction = "both")







###-----------------------------------------------------------------------------
### chpt 3. time series
###-----------------------------------------------------------------------------


install.packages("TTR")
library(TTR)

install.packages("forecast")
library(forecast)


#------------------------------------------------------------------
# decompose non-seasonal data
# 영국 왕들의 사망시 나이 데이터
#------------------------------------------------------------------


kings <- c(60, 43, 67, 50, 56, 42, 50, 65, 68, 43,
           65, 34, 47, 34, 49, 41, 13, 35, 53, 56,
           16, 43, 69, 59, 48, 59, 86, 55, 68, 51,
           33, 49, 67, 77, 81, 67, 71, 81, 68, 70,
           77, 56)
#kings <- read.table("http://robjhyndman.com/tsdldata/misc/kings.dat", header=TRUE, sep=",",
#                   stringsAsFactors=FALSE, na.strings=c('NIL'),
#                   comment.char="#", encoding="UTF-8")
#kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat")
#write.table(data, file="data/data.csv", append=FALSE, quote=FALSE, sep=",", row.names=FALSE)

kingstimeseries <- ts(kings)            #ts함수를 활용하여 데이터를 시계열데이터로 변환
kingstimeseries
plot.ts(kingstimeseries)                #plot.ts 함수를 활용하여 시계열데이터를 도식화


#SMA 함수를 이용해 간단한 시계열의 트랜드를 보여주는 분해시계열의 이동평균 그래프 그리기
kingstimeseriesSMA3<-SMA(kingstimeseries,n=3)
plot.ts(kingstimeseriesSMA3)

kingstimeseriesSMA8<-SMA(kingstimeseries,n=8)
plot.ts(kingstimeseriesSMA8)

kingstimeseriesSMA12<-SMA(kingstimeseries,n=12)
plot.ts(kingstimeseriesSMA12)

par(mfrow=c(2,2))                        # 하나의 그래프 화면에 함꼐 표현하기
plot.ts(kingstimeseries)
plot.ts(kingstimeseriesSMA3)
plot.ts(kingstimeseriesSMA8)
plot.ts(kingstimeseriesSMA12)



# 차분하여 정상성 확인하기 (difference)
# diff 함수를 활용하여 데이터 차분하기

kingstimeseriesdiff1 <- diff(kingstimeseries, differences = 1)
kingstimeseriesdiff2 <- diff(kingstimeseries, differences = 2)
kingstimeseriesdiff3 <- diff(kingstimeseries, differences = 3)
kingstimeseriesdiff1
kingstimeseriesdiff2
kingstimeseriesdiff3


par(mfrow=c(2,2))
plot.ts(kingstimeseriesdiff1)           #1차 차분한 결과, 평균과 분산이 시간에 의존하지 않음
plot.ts(kingstimeseriesdiff2)
plot.ts(kingstimeseriesdiff3)


mean(kingstimeseriesdiff1)
sd(kingstimeseriesdiff1)

mean(kingstimeseriesdiff2)
sd(kingstimeseriesdiff2)

mean(kingstimeseriesdiff3)
sd(kingstimeseriesdiff3)



# ARIMA 모델 결정하기 ARIMA(p, 1, q)
# acf함수와 pacf 함수를 사용하여 모형 결정하기


acf(kingstimeseriesdiff1, lag.max=20)          #1차 차분한 데이터로 (ACF) 확인
acf(kingstimeseriesdiff1, lag.max=20, plot=FALSE)
#--- lag = 0 지점은 읽지 않음
#--- lag = 1 인 지점만 점선 구간밖에 있음
#--- lag = 2 인 지점부터 모두 점선 구간안에 있음 lag가 2에서 절단점을 가짐 -> MA(1)모형


pacf(kingstimeseriesdiff1, lag.max=20)         #1차 차분한 데이터로 (PACF) 확인
pacf(kingstimeseriesdiff1, lag.max=20, plot=FALSE)
#--- lag = 0 지점은 자료 없음
#--- lag = 1, 2, 3 지점만 점선 구간밖에 있음
#--- lag = 4 인 지점부터 모두 점선 구간안에 있음 lag가 4에서 절단점을 가짐 -> AR(3) 紐⑦삎



# forecast package 에 내장된 auto.arima 함수를 이용한 모형 찾기

auto.arima(kings)
#--- ARIMA(0, 1, 1) 을 가장 적절한 모형으로 선택


#  ARIMA 모형을 통해 미래 예측하기
# ARIMA모형으로 데이터 보정하기(fitting)

kingstimeseriesARIMA<- arima(kingstimeseries, order=c(0, 1, 1))
kingstimeseriesARIMA

# forecast.Arima 함수를 통해 미래 예측하기

kingstimeseriesforecasts<-forecast.Arima(kingstimeseriesARIMA)
kingstimeseriesforecasts

# 5명을 예측하고자 한다면 h=5로 지정가능

kingstimeseriesforecasts<-forecast.Arima(kingstimeseriesARIMA,h=5)
kingstimeseriesforecasts

# 미래 예측에 대한 도표 그리기

plot.forecast(kingstimeseriesforecasts)





#------------------------------------------------------------------
# decompose seasonal data
# "뉴욕에서 1946년 1월부터 1959년 12월까지 월별 출생자 수 데이터
#-------------------------------------------------------------------



births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
births

#월별 데이터 형태의 시계열자료로 변환
birthstimeseries <- ts(births, frequency=12, start=c(1946, 1))
birthstimeseries

#월별 시계열 자료를 plot.ts 함수로 도식화
plot.ts(birthstimeseries)

#--- 계절정을 띄는 시계열 자료임
#--- 1~3월에는 출생자 수가 증가하고 이후 다시 떨어지다가
#--- 9~12월에 다시 증가
#--- 계절성을 띄는 시계열자료는 경향성, 계절성, 불규칙성 요소로 구성됨

# 시계열 자료를 요소별로 분해하기
birthstimeseriescomponents <- decompose(birthstimeseries)
plot(birthstimeseriescomponents)

birthstimeseriescomponents$x
birthstimeseriescomponents$trend
birthstimeseriescomponents$seasonal
birthstimeseriescomponents$random


# 시계열 자료에서 계정성 요소를 제거하기
birthstimeseries_seasonally_adjusted<-birthstimeseries -birthstimeseriescomponents$seasonal
plot(birthstimeseries_seasonally_adjusted)


#차분하여 정상성 확인하기 (difference)

# diff 함수를 활용하여 데이터 차분하기
births_adjusted<-birthstimeseries_seasonally_adjusted
births_adjusted_diff1 <- diff(births_adjusted, differences = 1)


#1차 차분한 결과, 평균과 분산이 시간에 의존하지 않는 것으로 가정하고 진행
plot.ts(births_adjusted_diff1)

mean(births_adjusted_diff1)
sd(births_adjusted_diff1)


# ARIMA 모델 결정하기 ARIMA(p, 1, q)

# acf함수와 pacf 함수를 사용하여 모형 결정하기


acf(births_adjusted_diff1, lag.max=100)          #1차 차분한 데이터로 (ACF) 확인

pacf(births_adjusted_diff1, lag.max=100)         #1차 차분한 데이터로 (PACF) 확인



# forecast package 에 내장된 auto.arima 함수를 이용한 모형 찾기

auto.arima(births)
#--- ARIMA(1, 1, 0) 을 가장 적절한 모형으로 선택


#  ARIMA 모형을 통해 미래 예측하기
# ARIMA모형으로 데이터 보정하기(fitting)

birthstimeseriesARIMA<- arima(birthstimeseries, order=c(1, 1, 0))
birthstimeseriesARIMA

# forecast.Arima 함수를 통해 미래 예측하기

birthstimeseriesforecasts<-forecast.Arima(birthstimeseriesARIMA)
birthstimeseriesforecasts

# 미래 예측에 대한 도표 그리기
par(mfrow=c(2,1))
plot.forecast(birthstimeseriesforecasts)



# forecast 함수를 활용한 시계열 구하기

forecast(birthstimeseries, h=12)
plot(forecast(birthstimeseries, h=12))








#-----------------------------------------------------------------------------
#--- "1987년 1월부터 1993년 12월까지 비치리조트 기념품 매장의 매출액"
#-----------------------------------------------------------------------------


souvenir <- scan("http://robjhyndman.com/tsdldata/data/fancy.dat")
souvenir

# 기념품 자료를 시계열 자료로 변환
souvenirtimeseries <- ts(souvenir, frequency=12, start=c(1987, 1))
souvenirtimeseries

plot.ts(souvenirtimeseries)

#자료의 분산이 일정하지 않은 비정상성 시계열-->변환을 통해 정성화
logsouvenirtimeseries<-log(souvenirtimeseries)
plot.ts(logsouvenirtimeseries)









#차분하여 정상성 확인하기 (difference)

# diff 함수를 활용하여 데이터 차분하기

logsouvenirtimeseriesdiff1 <- diff(logsouvenirtimeseries, differences = 1)
logsouvenirtimeseriesdiff2 <- diff(logsouvenirtimeseries, differences = 2)
logsouvenirtimeseriesdiff3 <- diff(logsouvenirtimeseries, differences = 3)
logsouvenirtimeseriesdiff1
logsouvenirtimeseriesdiff2
logsouvenirtimeseriesdiff3


par(mfrow=c(2,2))
plot.ts(logsouvenirtimeseries)
plot.ts(logsouvenirtimeseriesdiff1)           #1차 차분한 결과, 평균과 분산이 시간에 의존하지 않음
plot.ts(logsouvenirtimeseriesdiff2)
plot.ts(logsouvenirtimeseriesdiff3)


mean(logsouvenirtimeseriesdiff1)
sd(logsouvenirtimeseriesdiff1)


# ARIMA 모델 결정하기 ARIMA(p, 1, q)

# acf함수와 pacf 함수를 사용하여 모형 결정하기


acf(logsouvenirtimeseriesdiff1, lag.max=100)          #1차 차분한 데이터로 (ACF) 확인

pacf(logsouvenirtimeseriesdiff1, lag.max=100)         #1차 차분한 데이터로 (PACF) 확인


# forecast package 에 내장된 auto.arima 함수를 이용한 모형 찾기

auto.arima(souvenir)
#--- ARIMA(1, 1, 1) 을 가장 적절한 모형으로 선택


#  ARIMA 모형을 통해 미래 예측하기
# ARIMA모형으로 데이터 보정하기(fitting)

souvenirtimeseriesARIMA<- arima(souvenirtimeseries, order=c(1, 1, 1))
souvenirtimeseriesARIMA

# forecast.Arima 함수를 통해 미래 예측하기

souvenirtimeseriesforecasts<-forecast.Arima(souvenirtimeseriesARIMA)
souvenirtimeseriesforecasts

# 미래 예측에 대한 도표 그리기

plot.forecast(souvenirtimeseriesforecasts)


# forecast 함수를 활용한 시계열 구하기

forecast(souvenirtimeseries, h=12)
plot(forecast(souvenirtimeseries, h=12))



#--------------------------------------------------------------------------
#   비정상시계열의 차분을 통한 시계열 분석의 활용 예2
#
#   1866년에서 1911년까지의 매년 여성의 스커트 지름길이 자료
#--------------------------------------------------------------------------

skirts <- scan("http://robjhyndman.com/tsdldata/roberts/skirts.dat", skip=5)

# 시계열 자료로 변환
skirtstimeseries <- ts(skirts, start=c(1866))
skirtstimeseries
plot(skirtstimeseries)
#plot.ts(skirtstimeseries)

#시간에 따른 평균이 일정하지 않음

# 평균이 일정하지 않은 비정상시계열 ->차분을 통해 정상화 (difference)
skirtstimeseriesdiff1 <- diff(skirtstimeseries, differences=1)
skirtstimeseriesdiff2 <- diff(skirtstimeseries, differences=2)
skirtstimeseriesdiff3 <- diff(skirtstimeseries, differences=3)

par(mfrow=c(2,2))
plot.ts(skirtstimeseries)
plot.ts(skirtstimeseriesdiff1)           #1차 차분한 결과, 평균과 분산이 시간에 의존하지 않음
plot.ts(skirtstimeseriesdiff2)
plot.ts(skirtstimeseriesdiff3)



mean(skirtstimeseriesdiff1)
sd(skirtstimeseriesdiff1)


# ARIMA 모델 결정하기 ARIMA(p, 1, q)

# acf함수와 pacf 함수를 사용하여 모형 결정하기


acf(skirtstimeseriesdiff2, lag.max=20)          #1차 차분한 데이터로 (ACF) 확인

pacf(skirtstimeseriesdiff2, lag.max=20)         #1차 차분한 데이터로 (PACF) 확인


# forecast package 에 내장된 auto.arima 함수를 이용한 모형 찾기

auto.arima(skirts)
#--- ARIMA(1, 2, 0) 을 가장 적절한 모형으로 선택


#  ARIMA 모형을 통해 미래 예측하기
# ARIMA모형으로 데이터 보정하기(fitting)

skirtstimeseriesARIMA<- arima(skirtstimeseries, order=c(1, 2, 0))
skirtstimeseriesARIMA

# forecast.Arima 함수를 통해 미래 예측하기

skirtstimeseriesforecasts<-forecast.Arima(skirtstimeseriesARIMA)
skirtstimeseriesforecasts

# 미래 예측에 대한 도표 그리기

plot.forecast(skirtstimeseriesforecasts)


# forecast 함수를 활용한 시계열 구하기

forecast(skirtstimeseries, h=12)
plot(forecast(skirtstimeseries, h=12))



#-----------------------------------------------------------------------------
#   정상시계열의 예 2
#
#   1500년 부터 1969년까지의 화산폭발 먼지량
#-----------------------------------------------------------------------------


volcanodust <- scan("http://robjhyndman.com/tsdldata/annual/dvi.dat", skip=1)
volcanodustseries <- ts(volcanodust, start=c(1500))
volcanodustseries
plot(volcanodustseries)
#plot.ts(volcanodustseries)

# 평균과 분산이 시간에 따라 의존하지 않으므로 정상성을 만족
# 차분이나 변환 없이 시계열 분석 진행

acf(volcanodustseries, lag.max=20)
acf(volcanodustseries, lag.max=20, plot=FALSE)
#--- lag = 4부터 점선을 초과하지 않으므로 절단점이 4 -> MA(3) 모형

pacf(volcanodustseries, lag.max=20)
pacf(volcanodustseries, lag.max=20, plot=FALSE)
#--- lag = 3부터 점선을 초과하지 않으므로 절단점이 3 -> AR(2) 모형

auto.arima(volcanodustseries)
#--- ARIMA(1, 0, 2) 모형

#--- MA(3), AR(2), ARMA(1,2) 모형중 가장 간단한 모형인 AR(2)을 선정

#--- AR(2)모형으로 시계열 보정 (fitting)
volcanodustseries_ARIMA <- arima(volcanodustseries, order=c(2, 0, 0))

#  미래의 값을 예측하기
volcanodustseries_forecast <- forecast.Arima(volcanodustseries_ARIMA, h=31)
plot.forecast(volcanodustseries_forecast)
volcanodustseries_forecast


#############################################
#
#   계량적  MDS(다차원척도법)
#
#############################################


library(MASS)
loc<-cmdscale(eurodist)
x<-loc[,1]
y<- -loc[,2]
plot(x,y,type="n",asp=1,main="Metric MDS")
text(x,y,rownames(loc),cex=0.9)
abline(v=0, h=0, lty=2, lwd=0.5)

data(mtcars)
mt<-mtcars
mt.x<-as.matrix(mt[,-1])
mt.dist<-dist(mt.x)
loc<-cmdscale(mt.dist)
plot(loc[,1],loc[,2],type="n",asp=1,main="Metric MDS")
text(loc[,1],loc[,2],rownames(loc),cex=0.7)
abline(v=0, h=0, lty=2, lwd=0.5)

##########################################################
#
#    isoMDS(Kruskal's Non-metric Multidimetional Scaling)
#    sammon (Non-Linear Mapping)
#
##########################################################

library(MASS)
data(swiss)
swiss.x<-as.matrix(swiss[,-1])
swiss.dist<-dist(swiss.x)
swiss.mds<-isoMDS(swiss.dist)
plot(swiss.mds$points, type="n", main="Nonmetric MDS : iosMDS")
text(swiss.mds$points, labels=as.character(1:nrow(swiss.x)))
abline(v=0, h=0, lty=2, lwd=0.5)



swiss.x<-as.matrix(swiss[,-1])
swiss.sammon <- sammon(dist(swiss.x))
plot(swiss.sammon$points, type="n", main="Nonmetric MDS : sammon")
text(swiss.sammon$points,labels=as.character(1:nrow(swiss.x)))
abline(v=0, h=0, lty=2, lwd=0.5)



library(MASS)
data(mtcars)
mt<-mtcars
mt.x<-as.matrix(mt[,-1])
mt.dist<-dist(mt.x)
mt.mds<-isoMDS(mt.dist)
plot(mt.mds$points, type="n", main="Nonmetric MDS : iosMDS")
text(mt.mds$points, labels=rownames(mt.x),cex=0.7)
abline(v=0, h=0, lty=2, lwd=0.5)

#############################################
#
#   주성분분석
#
#############################################

library(datasets)
data(USArrests)
pairs(USArrests, panel=panel.smooth,
      main="USArrests data")

US.prin<-princomp(USArrests,cor=TRUE)
summary(US.prin)
screeplot(US.prin,npcs=5, type="lines")
loadings(US.prin)
US.prin$scores
biplot(US.prin)






#############################################
#
#   차원축소 PCA 예제 2
#
#############################################

# csv 파일 불러오기 (file importing)
f_2007 <- read.csv("c:/r_class/finance_2007.csv",
                   header = TRUE, stringsAsFactors = FALSE)
# V1 : 총자본순이익율
# V2 : 자기자본순이익율
# V3 : 자기자본비율
# V4 : 부채비율
# V5 : 자기자본회전율



# 표준화 변환 (standardization)
f_2007 <- transform(f_2007,
                    V1_s = scale(V1),
                    V2_s = scale(V2),
                    V3_s = scale(V3),
                    V4_s = scale(V4),
                    V5_s = scale(V5))




# variable selection
f_2007_2 <-f_2007[,c("company", "V1_s", "V2_s", "V3_s", "V4_s", "V5_s")]

# Correlation analysis
cor(f_2007_2[,-1])
round(cor(f_2007_2[,-1]), digits=3) # 반올림

# Scatter plot matrix
plot(f_2007_2[,-1])


# 주성분분석 PCA(Principal Component Analysis)
secu_prcomp <- prcomp(f_2007_2[,c(2:6)]) # 첫번째 변수 회사명은 빼고 분석

summary(secu_prcomp)

print(secu_prcomp)


# Scree Plot
plot(prcomp(f_2007_2[,c(2:6)]), type="l",
     sub = "Scree Plot")

# Biplot
biplot(prcomp(f_2007_2[,c(2:6)]), cex = c(0.7, 0.8))



# 관측치별 주성분1, 주성분2 점수 계산(PC1 score, PC2 score)
secu_pc1 <- predict(secu_prcomp)[,1]
secu_pc2 <- predict(secu_prcomp)[,2]

# 관측치별 이름 매핑(rownames mapping)
text(secu_pc1, secu_pc2, labels = f_2007_2$company,
     cex = 0.7, pos = 3, col = "blue")













###########################################################
## PCA (Principal Component Analysis)
## User Defined Function
##  - finding PC k which Cummulative Proportion is over 0.8
###########################################################

pca <- function(dataset){
  pc = prcomp(dataset, scale = TRUE)

  k = 0
  R = 0

  while(R < 0.8) {
    k = k + 1
    R = sum(pc[[1]][1:k]^2)/sum(pc[[1]]^2)

    cat("When number of Principal Component(k) is ", k,
        ", Cummulative Proportion(R) is ", R, "\n", "\n", sep="")
  }

  SelectedDataSet = pc[[5]][,1:k]
  return(SelectedDataSet)
}

pca(f_2007_2[,c(2:6)])




## PCA for College data
data(College)
cdat = College[,2:18]
dim(cdat)
names(cdat)

## PCA
pc.col <- princomp(cdat) #default - centers and scales

#default R plots with princomp
biplot(pc.col, cex=.7)
screeplot(pc.col)

# #scatter plots - patterns among observations
i = 1; j = 2;
plot(pc.col$scores[,i],pc.col$scores[,j],pch=16,cex=.2)
text(pc.col$scores[,i],pc.col$scores[,j],rownames(cdat),cex=.6)

#look at a particular college
ind = match("Harvard University",rownames(cdat))
text(pc.col$scores[ind,i],pc.col$scores[ind,j],rownames(cdat)[ind],cex=.7,col=2)

#loadings - variables that contribute to these patterns
par(mfrow=c(2,1))
barplot(pc.col$loadings[,1],cex.names=.6,main="PC 1 Loadings")
barplot(pc.col$loadings[,2],cex.names=.6,main="PC 2 Loadings")

#variance explained
screeplot(pc.col)

varex <- 100*pc.col$sdev^2/sum(pc.col$sdev^2)
plot(varex,type="l",ylab="% Variance Explained",xlab="Component")

#cumulative variance explained
cvarex = NULL
for(i in 1:ncol(cdat)){
  cvarex[i] = sum(varex[1:i])
}
plot(cvarex,type="l",ylab="Cumulative Variance Explained",xlab="Component")

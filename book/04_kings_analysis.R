rm(list=ls())
getwd()

##-----------------------------------------------------------------------------
## chpt 3. time series
## library : TTR, forcast
##-----------------------------------------------------------------------------

#install.packages("TTR")
library(TTR)

#install.packages("forecast")
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

### ----------------------------------------------------------------
#kings <- read.table("http://robjhyndman.com/tsdldata/misc/kings.dat", header=TRUE, sep=",",
#                   stringsAsFactors=FALSE, na.strings=c('NIL'),
#                   comment.char="#", encoding="UTF-8")
#kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat", what = real, Age)
#write.table(data, file="data/data.csv", append=FALSE, quote=FALSE, sep=",", row.names=FALSE)
### ----------------------------------------------------------------

kingstimeseries <- ts(kings)            #ts함수를 활용하여 데이터를 시계열데이터로 변환
kingstimeseries
"____ (SET) TIME SERIES DATA ___
Time Series:   Start = 1 / End = 42 / Frequency = 1
"
plot.ts(kingstimeseries)                #plot.ts 함수를 활용하여 시계열데이터를 도식화


#SMA 함수를 이용해 간단한 시계열트랜드를 보여주는 분해시계열 이동평균그래프 그리기
kingstimeseriesSMA3 <- SMA(kingstimeseries,n=3)
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


# 차분하여 정상성 확인하기 (difference) - diff 함수를 활용하여 데이터 차분하기
kingstimeseriesdiff1 <- diff(kingstimeseries, differences = 1)
kingstimeseriesdiff2 <- diff(kingstimeseries, differences = 2)
kingstimeseriesdiff3 <- diff(kingstimeseries, differences = 3)

kingstimeseriesdiff1
kingstimeseriesdiff2
kingstimeseriesdiff3


par(mfrow=c(2,2))
plot.ts(kingstimeseriesdiff1)   #1차 차분한 결과, 평균과 분산이 시간에 의존하지 않음
plot.ts(kingstimeseriesdiff2)
plot.ts(kingstimeseriesdiff3)


# 차분을 높일수록, 평균은높아지고, 분산은 커진다.
mean(kingstimeseriesdiff1)
sd(kingstimeseriesdiff1)

mean(kingstimeseriesdiff2)
sd(kingstimeseriesdiff2)

mean(kingstimeseriesdiff3)
sd(kingstimeseriesdiff3)


# ARIMA모델 결졍하기 ARIMA(p, 1, q) - AR(p),차분홧수, MA(q)
# acf()함수와 pacf()를 사용하여 결정한다.

par(mfrow=c(2,2))
acf(kingstimeseriesdiff1, lag.max=20)          #1?? ?????? ?????ͷ? (ACF) Ȯ??
acf(kingstimeseriesdiff1, lag.max=20, plot=FALSE)
#--- lag = 0 지점은 읽지 않음
#--- lag = 1 인 지점만 점선 구간밖에 있음
#--- lag = 2 인 지점부터 모두 점선 구간안에 있음 lag가 2에서 절단점을 가짐 -> MA(1)모형


pacf(kingstimeseriesdiff1, lag.max=20)         #1?? ?????? ?????ͷ? (PACF) Ȯ??
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

kingstimeseriesforecasts<-forecast(kingstimeseriesARIMA)
kingstimeseriesforecasts

# 5명을 예측하고자 한다면 h=5로 지정가능

kingstimeseriesforecasts<-forecast(kingstimeseriesARIMA,h=5)
kingstimeseriesforecasts

# 미래 예측에 대한 도표 그리기

par(mfrow=c(1,1))
plot(kingstimeseriesforecasts)

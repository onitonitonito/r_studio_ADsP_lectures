
###-----------------------------------------------------------------------------
### 1.descriptive statistics
###-----------------------------------------------------------------------------

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

1+1
14-10
4*6
28/7
38%%7

oddcount<-function(x){
  k<-0
  for(n in x){
  if(n%%2==1)k<-k+1
  }
  return(k)
}


oddcount(c(1,3,4))

oddcount(c(1,2,3,4,5,6,7))

data(mtcars)
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



test <- read.csv("D:/µ¥ÀÌÅÍºĞ¼® °­ÀÇ/4.2/data/4.2_001.csv")
test<-test[,-1]
library(Hmisc)
rcorr(as.matrix(test), type="spearman")        # type = spearman | pearson
rcorr(as.matrix(test), type="spearman")$r


test2 <- read.csv("D:/µ¥ÀÌÅÍºĞ¼® °­ÀÇ/4.2/data/4.2_002.csv")
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

# FÅë°è·® : 0.1029
# p-value : 0.9554 (À¯ÀÇ¼öÁØ 5%ÇÏ¿¡ À¯ÀÇÇÏÁö ¾ÊÀ½ 0.05)
# È¸±Í°è¼ö : u,v,w ¸ğµÎ p-value°¡ 0.05 º¸´Ù Ä¿¼­ È¸±Í°è¼öÀÇ ÃßÁ¤µéÀÌ Åë°èÀûÀ¸·Î À¯ÀÇÇÏÁö ¾ÊÀ½
# °áÁ¤°è¼ö R-squared = 0.04894, Adjusted R-squared = -0.4266 : È¸±Í½ÄÀÌ µ¥ÀÌÅÍ¸¦ ÀûÀıÇÏ°Ô ¼³¸íÇÏÁö ¸øÇÔ


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

# FÅë°è·® : 232.9
# p-value : 0.0000002974 (À¯ÀÇ¼öÁØ 5%ÇÏ¿¡ È¸±Í¸ğÇüÀÌ Åë°èÀûÀ¸·Î À¯ÀÇÇÔ)
# È¸±Í°è¼ö : time ÀÇ p-value°¡ 0.05 º¸´Ù ÀÛ¾Æ¼­ È¸±Í°è¼öÀÇ ÃßÁ¤ÀÌ Åë°èÀûÀ¸·Î À¯ÀÇÇÔ
# °áÁ¤°è¼ö R-squared = 0.9588, Adjusted R-squared = 0.9547 : È¸±Í½ÄÀÌ µ¥ÀÌÅÍ¸¦ ÀûÀıÇÏ°Ô ¼³¸íÇÔ


# ¿¹Á¦: cars µ¥ÀÌÅÍ¸¦ È°¿ëÇÑ °î¼±È¸±ÍºĞ¼®

data(cars, package="datasets")
cars

speed2 <- cars$speed^2
cars <- cbind(speed2, cars)
cars

m <- lm(dist ~ speed + speed2, data=cars)
m

#  dist = 2.47014 + 0.91329 *speed  +0.09996 * speed^2 

summary(m)

# FÅë°è·® : 47.14
# p-value : 5.852e-12 (À¯ÀÇ¼öÁØ 5%ÇÏ¿¡ È¸±Í¸ğÇüÀÌ Åë°èÀûÀ¸·Î À¯ÀÇÇÔ)
# È¸±Í°è¼ö : speed ÀÇ p-value°¡ 0.05 º¸´Ù Ä¿¼­ È¸±Í°è¼öÀÇ ÃßÁ¤ÀÌ Åë°èÀûÀ¸·Î À¯ÀÇÇÏÁö ¸øÇÔ
# °áÁ¤°è¼ö R-squared = 0.6673, Adjusted R-squared = 0.6532 : È¸±Í½ÄÀÌ µ¥ÀÌÅÍ¸¦ ÀûÀıÇÏ°Ô ¼³¸íÇÑ´Ù.


#2Â÷ °î¼± È¸±ÍºĞ¼®
          
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

# FÅë°è·® : 16.99
# p-value : 0.0044 (À¯ÀÇ¼öÁØ 5%ÇÏ¿¡ È¸±Í¸ğÇüÀÌ Åë°èÀûÀ¸·Î À¯ÀÇÇÔ)
# È¸±Í°è¼ö : speed ÀÇ p-value°¡ 0.05 º¸´Ù ÀÛ¾Æ È¸±Í°è¼öÀÇ ÃßÁ¤ÀÌ Åë°èÀûÀ¸·Î À¯ÀÇÇÔ
# °áÁ¤°è¼ö R-squared = 0.7083, Adjusted R-squared = 0.666 : È¸±Í½ÄÀÌ µ¥ÀÌÅÍ¸¦ ÀûÀıÇÏ°Ô ¼³¸íÇÑ´Ù.



m2 <- lm(y ~ x + x2, data=df2)
m2
#  y = 7.1667 + -2.9121 *x +0.4545 *x^2 
summary(m2)

# FÅë°è·® : 292.2
# p-value : 1.05e-06 (À¯ÀÇ¼öÁØ 5%ÇÏ¿¡ È¸±Í¸ğÇüÀÌ Åë°èÀûÀ¸·Î À¯ÀÇÇÔ)
# È¸±Í°è¼ö : speed ÀÇ p-value°¡ 0.05 º¸´Ù ÀÛ¾Æ È¸±Í°è¼öÀÇ ÃßÁ¤ÀÌ Åë°èÀûÀ¸·Î À¯ÀÇÇÔ
# °áÁ¤°è¼ö R-squared = 0.9898, Adjusted R-squared = 0.9864 : È¸±Í½ÄÀÌ µ¥ÀÌÅÍ¸¦ ÀûÀıÇÏ°Ô ¼³¸íÇÑ´Ù.







###-----------------------------------------------------------------------------
###  logistic regression analysis
###-----------------------------------------------------------------------------

library(boot)
data(nodal)
nodal
rd <- nodal[,-1]
gfit <- glm(r~., data=rd, family="binomial")
summary(gfit)

# ÃÖÁ¾ È¸±Í½Ä
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


#MASS ÆĞÅ°ÁöÀÇ hills µ¥ÀÌÅÍ¸¦ È°¿ëÇØ¼­ timeÀ» Á¾¼Óº¯¼ö·Î ÀüÁø¼±ÅÃ¹ıÀ¸·Î È¸±ÍºĞ¼®


data(hills, package="MASS")
head(hills)

step(lm(time ~ 1, data=hills), scope=list(lower = ~ 1, upper = ~ dist + climb + time), direction = "forward")



# µ¥ÀÌÅÍ ¼ÂÀ» ºÒ·¯µé¿© setp ÇÔ¼ö¸¦ ÅëÇÑ È¸±ÍºĞ¼® ½Ç½Ã


#data <- read.table("E:/ADSP/±³À°ÀÚ·á/4.2/data/4.2_003.csv", header=TRUE, sep=",", 
                   stringsAsFactors=FALSE, na.strings=c('NIL'), 
                   comment.char="#", encoding="UTF-8") 
Bio <- read.csv("E:/ADSP/±³À°ÀÚ·á/4.2/data/4.2_003.csv", header=T, encoding="UTF-8")
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
# ¿µ±¹ ¿ÕµéÀÇ »ç¸Á½Ã ³ªÀÌ µ¥ÀÌÅÍ
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

kingstimeseries <- ts(kings)            #tsÇÔ¼ö¸¦ È°¿ëÇÏ¿© µ¥ÀÌÅÍ¸¦ ½Ã°è¿­µ¥ÀÌÅÍ·Î º¯È¯          
kingstimeseries
plot.ts(kingstimeseries)                #plot.ts ÇÔ¼ö¸¦ È°¿ëÇÏ¿© ½Ã°è¿­µ¥ÀÌÅÍ¸¦ µµ½ÄÈ­


#SMA ÇÔ¼ö¸¦ ÀÌ¿ëÇØ °£´ÜÇÑ ½Ã°è¿­ÀÇ Æ®·£µå¸¦ º¸¿©ÁÖ´Â ºĞÇØ½Ã°è¿­ÀÇ ÀÌµ¿Æò±Õ ±×·¡ÇÁ ±×¸®±â
kingstimeseriesSMA3<-SMA(kingstimeseries,n=3)  
plot.ts(kingstimeseriesSMA3)

kingstimeseriesSMA8<-SMA(kingstimeseries,n=8)  
plot.ts(kingstimeseriesSMA8)

kingstimeseriesSMA12<-SMA(kingstimeseries,n=12)  
plot.ts(kingstimeseriesSMA12)

par(mfrow=c(2,2))                        #ÇÏ³ªÀÇ ±×·¡ÇÁ È­¸é¿¡ ÇÔ²¾ Ç¥ÇöÇÏ±â
plot.ts(kingstimeseries)
plot.ts(kingstimeseriesSMA3)
plot.ts(kingstimeseriesSMA8)
plot.ts(kingstimeseriesSMA12)



#Â÷ºĞÇÏ¿© Á¤»ó¼º È®ÀÎÇÏ±â (difference)

# diff ÇÔ¼ö¸¦ È°¿ëÇÏ¿© µ¥ÀÌÅÍ Â÷ºĞÇÏ±â

kingstimeseriesdiff1 <- diff(kingstimeseries, differences = 1)
kingstimeseriesdiff2 <- diff(kingstimeseries, differences = 2)
kingstimeseriesdiff3 <- diff(kingstimeseries, differences = 3)
kingstimeseriesdiff1
kingstimeseriesdiff2
kingstimeseriesdiff3


par(mfrow=c(2,2)) 
plot.ts(kingstimeseriesdiff1)           #1Â÷ Â÷ºĞÇÑ °á°ú, Æò±Õ°ú ºĞ»êÀÌ ½Ã°£¿¡ ÀÇÁ¸ÇÏÁö ¾ÊÀ½
plot.ts(kingstimeseriesdiff2)
plot.ts(kingstimeseriesdiff3)


mean(kingstimeseriesdiff1)
sd(kingstimeseriesdiff1)

mean(kingstimeseriesdiff2)
sd(kingstimeseriesdiff2)

mean(kingstimeseriesdiff3)
sd(kingstimeseriesdiff3)



# ARIMA ¸ğµ¨ °áÁ¤ÇÏ±â ARIMA(p, 1, q)

# acfÇÔ¼ö¿Í pacf ÇÔ¼ö¸¦ »ç¿ëÇÏ¿© ¸ğÇü °áÁ¤ÇÏ±â


acf(kingstimeseriesdiff1, lag.max=20)          #1Â÷ Â÷ºĞÇÑ µ¥ÀÌÅÍ·Î (ACF) È®ÀÎ
acf(kingstimeseriesdiff1, lag.max=20, plot=FALSE)
#--- lag = 0 ÁöÁ¡Àº ÀĞÁö ¾ÊÀ½
#--- lag = 1 ÀÎ ÁöÁ¡¸¸ Á¡¼± ±¸°£¹Û¿¡ ÀÖÀ½
#--- lag = 2 ÀÎ ÁöÁ¡ºÎÅÍ ¸ğµÎ Á¡¼± ±¸°£¾È¿¡ ÀÖÀ½ lag°¡ 2¿¡¼­ Àı´ÜÁ¡À» °¡Áü -> MA(1)¸ğÇü


pacf(kingstimeseriesdiff1, lag.max=20)         #1Â÷ Â÷ºĞÇÑ µ¥ÀÌÅÍ·Î (PACF) È®ÀÎ
pacf(kingstimeseriesdiff1, lag.max=20, plot=FALSE)
#--- lag = 0 ÁöÁ¡Àº ÀÚ·á ¾øÀ½
#--- lag = 1, 2, 3 ÁöÁ¡¸¸ Á¡¼± ±¸°£¹Û¿¡ ÀÖÀ½
#--- lag = 4 ÀÎ ÁöÁ¡ºÎÅÍ ¸ğµÎ Á¡¼± ±¸°£¾È¿¡ ÀÖÀ½ lag°¡ 4¿¡¼­ Àı´ÜÁ¡À» °¡Áü -> AR(3) ëª¨í˜•



# forecast package ¿¡ ³»ÀåµÈ auto.arima ÇÔ¼ö¸¦ ÀÌ¿ëÇÑ ¸ğÇü Ã£±â

auto.arima(kings)                       
#--- ARIMA(0, 1, 1) À» °¡Àå ÀûÀıÇÑ ¸ğÇüÀ¸·Î ¼±ÅÃ


#  ARIMA ¸ğÇüÀ» ÅëÇØ ¹Ì·¡ ¿¹ÃøÇÏ±â 
# ARIMA¸ğÇüÀ¸·Î µ¥ÀÌÅÍ º¸Á¤ÇÏ±â(fitting)

kingstimeseriesARIMA<- arima(kingstimeseries, order=c(0, 1, 1))
kingstimeseriesARIMA

# forecast.Arima ÇÔ¼ö¸¦ ÅëÇØ ¹Ì·¡ ¿¹ÃøÇÏ±â

kingstimeseriesforecasts<-forecast.Arima(kingstimeseriesARIMA)
kingstimeseriesforecasts

# 5¸íÀ» ¿¹ÃøÇÏ°íÀÚ ÇÑ´Ù¸é h=5·Î ÁöÁ¤°¡´É

kingstimeseriesforecasts<-forecast.Arima(kingstimeseriesARIMA,h=5)
kingstimeseriesforecasts

# ¹Ì·¡ ¿¹Ãø¿¡ ´ëÇÑ µµÇ¥ ±×¸®±â

plot.forecast(kingstimeseriesforecasts)





#------------------------------------------------------------------
# decompose seasonal data
# "´º¿å¿¡¼­ 1946³â 1¿ùºÎÅÍ 1959³â 12¿ù±îÁö ¿ùº° Ãâ»ıÀÚ ¼ö µ¥ÀÌÅÍ
#-------------------------------------------------------------------



births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
births

#¿ùº° µ¥ÀÌÅÍ ÇüÅÂÀÇ ½Ã°è¿­ÀÚ·á·Î º¯È¯
birthstimeseries <- ts(births, frequency=12, start=c(1946, 1))        
birthstimeseries
                   
#¿ùº° ½Ã°è¿­ ÀÚ·á¸¦ plot.ts ÇÔ¼ö·Î µµ½ÄÈ­
plot.ts(birthstimeseries) 
                       
#--- °èÀıÁ¤À» ¶ç´Â ½Ã°è¿­ ÀÚ·áÀÓ
#--- 1~3¿ù¿¡´Â Ãâ»ıÀÚ ¼ö°¡ Áõ°¡ÇÏ°í ÀÌÈÄ ´Ù½Ã ¶³¾îÁö´Ù°¡
#--- 9~12¿ù¿¡ ´Ù½Ã Áõ°¡
#--- °èÀı¼ºÀ» ¶ç´Â ½Ã°è¿­ÀÚ·á´Â °æÇâ¼º, °èÀı¼º, ºÒ±ÔÄ¢¼º ¿ä¼Ò·Î ±¸¼ºµÊ
€
# ½Ã°è¿­ ÀÚ·á¸¦ ¿ä¼Òº°·Î ºĞÇØÇÏ±â
birthstimeseriescomponents <- decompose(birthstimeseries)               
plot(birthstimeseriescomponents)

birthstimeseriescomponents$x
birthstimeseriescomponents$trend
birthstimeseriescomponents$seasonal
birthstimeseriescomponents$random


# ½Ã°è¿­ ÀÚ·á¿¡¼­ °èÁ¤¼º ¿ä¼Ò¸¦ Á¦°ÅÇÏ±â
birthstimeseries_seasonally_adjusted<-birthstimeseries -birthstimeseriescomponents$seasonal
plot(birthstimeseries_seasonally_adjusted)


#Â÷ºĞÇÏ¿© Á¤»ó¼º È®ÀÎÇÏ±â (difference)

# diff ÇÔ¼ö¸¦ È°¿ëÇÏ¿© µ¥ÀÌÅÍ Â÷ºĞÇÏ±â
births_adjusted<-birthstimeseries_seasonally_adjusted
births_adjusted_diff1 <- diff(births_adjusted, differences = 1)


#1Â÷ Â÷ºĞÇÑ °á°ú, Æò±Õ°ú ºĞ»êÀÌ ½Ã°£¿¡ ÀÇÁ¸ÇÏÁö ¾Ê´Â °ÍÀ¸·Î °¡Á¤ÇÏ°í ÁøÇà
plot.ts(births_adjusted_diff1)          

mean(births_adjusted_diff1)
sd(births_adjusted_diff1)


# ARIMA ¸ğµ¨ °áÁ¤ÇÏ±â ARIMA(p, 1, q)

# acfÇÔ¼ö¿Í pacf ÇÔ¼ö¸¦ »ç¿ëÇÏ¿© ¸ğÇü °áÁ¤ÇÏ±â


acf(births_adjusted_diff1, lag.max=100)          #1Â÷ Â÷ºĞÇÑ µ¥ÀÌÅÍ·Î (ACF) È®ÀÎ

pacf(births_adjusted_diff1, lag.max=100)         #1Â÷ Â÷ºĞÇÑ µ¥ÀÌÅÍ·Î (PACF) È®ÀÎ



# forecast package ¿¡ ³»ÀåµÈ auto.arima ÇÔ¼ö¸¦ ÀÌ¿ëÇÑ ¸ğÇü Ã£±â

auto.arima(births)                       
#--- ARIMA(1, 1, 0) À» °¡Àå ÀûÀıÇÑ ¸ğÇüÀ¸·Î ¼±ÅÃ


#  ARIMA ¸ğÇüÀ» ÅëÇØ ¹Ì·¡ ¿¹ÃøÇÏ±â 
# ARIMA¸ğÇüÀ¸·Î µ¥ÀÌÅÍ º¸Á¤ÇÏ±â(fitting)

birthstimeseriesARIMA<- arima(birthstimeseries, order=c(1, 1, 0))
birthstimeseriesARIMA

# forecast.Arima ÇÔ¼ö¸¦ ÅëÇØ ¹Ì·¡ ¿¹ÃøÇÏ±â

birthstimeseriesforecasts<-forecast.Arima(birthstimeseriesARIMA)
birthstimeseriesforecasts

# ¹Ì·¡ ¿¹Ãø¿¡ ´ëÇÑ µµÇ¥ ±×¸®±â
par(mfrow=c(2,1))
plot.forecast(birthstimeseriesforecasts)



# forecast ÇÔ¼ö¸¦ È°¿ëÇÑ ½Ã°è¿­ ±¸ÇÏ±â

forecast(birthstimeseries, h=12)
plot(forecast(birthstimeseries, h=12))








#-----------------------------------------------------------------------------
#--- "1987³â 1¿ùºÎÅÍ 1993³â 12¿ù±îÁö ºñÄ¡¸®Á¶Æ® ±â³äÇ° ¸ÅÀåÀÇ ¸ÅÃâ¾×"
#-----------------------------------------------------------------------------


souvenir <- scan("http://robjhyndman.com/tsdldata/data/fancy.dat")
souvenir 

# ±â³äÇ° ÀÚ·á¸¦ ½Ã°è¿­ ÀÚ·á·Î º¯È¯
souvenirtimeseries <- ts(souvenir, frequency=12, start=c(1987, 1))     
souvenirtimeseries
                   
plot.ts(souvenirtimeseries)                         

#ÀÚ·áÀÇ ºĞ»êÀÌ ÀÏÁ¤ÇÏÁö ¾ÊÀº ºñÁ¤»ó¼º ½Ã°è¿­-->º¯È¯À» ÅëÇØ Á¤¼ºÈ­
logsouvenirtimeseries<-log(souvenirtimeseries)
plot.ts(logsouvenirtimeseries)









#Â÷ºĞÇÏ¿© Á¤»ó¼º È®ÀÎÇÏ±â (difference)

# diff ÇÔ¼ö¸¦ È°¿ëÇÏ¿© µ¥ÀÌÅÍ Â÷ºĞÇÏ±â

logsouvenirtimeseriesdiff1 <- diff(logsouvenirtimeseries, differences = 1)
logsouvenirtimeseriesdiff2 <- diff(logsouvenirtimeseries, differences = 2)
logsouvenirtimeseriesdiff3 <- diff(logsouvenirtimeseries, differences = 3)
logsouvenirtimeseriesdiff1
logsouvenirtimeseriesdiff2
logsouvenirtimeseriesdiff3


par(mfrow=c(2,2)) 
plot.ts(logsouvenirtimeseries)
plot.ts(logsouvenirtimeseriesdiff1)           #1Â÷ Â÷ºĞÇÑ °á°ú, Æò±Õ°ú ºĞ»êÀÌ ½Ã°£¿¡ ÀÇÁ¸ÇÏÁö ¾ÊÀ½
plot.ts(logsouvenirtimeseriesdiff2)
plot.ts(logsouvenirtimeseriesdiff3)


mean(logsouvenirtimeseriesdiff1)
sd(logsouvenirtimeseriesdiff1)


# ARIMA ¸ğµ¨ °áÁ¤ÇÏ±â ARIMA(p, 1, q)

# acfÇÔ¼ö¿Í pacf ÇÔ¼ö¸¦ »ç¿ëÇÏ¿© ¸ğÇü °áÁ¤ÇÏ±â


acf(logsouvenirtimeseriesdiff1, lag.max=100)          #1Â÷ Â÷ºĞÇÑ µ¥ÀÌÅÍ·Î (ACF) È®ÀÎ

pacf(logsouvenirtimeseriesdiff1, lag.max=100)         #1Â÷ Â÷ºĞÇÑ µ¥ÀÌÅÍ·Î (PACF) È®ÀÎ


# forecast package ¿¡ ³»ÀåµÈ auto.arima ÇÔ¼ö¸¦ ÀÌ¿ëÇÑ ¸ğÇü Ã£±â

auto.arima(souvenir)                       
#--- ARIMA(1, 1, 1) À» °¡Àå ÀûÀıÇÑ ¸ğÇüÀ¸·Î ¼±ÅÃ


#  ARIMA ¸ğÇüÀ» ÅëÇØ ¹Ì·¡ ¿¹ÃøÇÏ±â 
# ARIMA¸ğÇüÀ¸·Î µ¥ÀÌÅÍ º¸Á¤ÇÏ±â(fitting)

souvenirtimeseriesARIMA<- arima(souvenirtimeseries, order=c(1, 1, 1))
souvenirtimeseriesARIMA

# forecast.Arima ÇÔ¼ö¸¦ ÅëÇØ ¹Ì·¡ ¿¹ÃøÇÏ±â

souvenirtimeseriesforecasts<-forecast.Arima(souvenirtimeseriesARIMA)
souvenirtimeseriesforecasts

# ¹Ì·¡ ¿¹Ãø¿¡ ´ëÇÑ µµÇ¥ ±×¸®±â

plot.forecast(souvenirtimeseriesforecasts)


# forecast ÇÔ¼ö¸¦ È°¿ëÇÑ ½Ã°è¿­ ±¸ÇÏ±â

forecast(souvenirtimeseries, h=12)
plot(forecast(souvenirtimeseries, h=12))



#--------------------------------------------------------------------------
#   ºñÁ¤»ó½Ã°è¿­ÀÇ Â÷ºĞÀ» ÅëÇÑ ½Ã°è¿­ ºĞ¼®ÀÇ È°¿ë ¿¹2
#
#   1866³â¿¡¼­ 1911³â±îÁöÀÇ ¸Å³â ¿©¼ºÀÇ ½ºÄ¿Æ® Áö¸§±æÀÌ ÀÚ·á
#--------------------------------------------------------------------------

skirts <- scan("http://robjhyndman.com/tsdldata/roberts/skirts.dat", skip=5)

# ½Ã°è¿­ ÀÚ·á·Î º¯È¯
skirtstimeseries <- ts(skirts, start=c(1866))       
skirtstimeseries
plot(skirtstimeseries)            
#plot.ts(skirtstimeseries)  
                     
#½Ã°£¿¡ µû¸¥ Æò±ÕÀÌ ÀÏÁ¤ÇÏÁö ¾ÊÀ½

# Æò±ÕÀÌ ÀÏÁ¤ÇÏÁö ¾ÊÀº ºñÁ¤»ó½Ã°è¿­ ->Â÷ºĞÀ» ÅëÇØ Á¤»óÈ­ (difference)
skirtstimeseriesdiff1 <- diff(skirtstimeseries, differences=1)
skirtstimeseriesdiff2 <- diff(skirtstimeseries, differences=2)
skirtstimeseriesdiff3 <- diff(skirtstimeseries, differences=3)

par(mfrow=c(2,2)) 
plot.ts(skirtstimeseries)
plot.ts(skirtstimeseriesdiff1)           #1Â÷ Â÷ºĞÇÑ °á°ú, Æò±Õ°ú ºĞ»êÀÌ ½Ã°£¿¡ ÀÇÁ¸ÇÏÁö ¾ÊÀ½
plot.ts(skirtstimeseriesdiff2)
plot.ts(skirtstimeseriesdiff3)



mean(skirtstimeseriesdiff1)
sd(skirtstimeseriesdiff1)


# ARIMA ¸ğµ¨ °áÁ¤ÇÏ±â ARIMA(p, 1, q)

# acfÇÔ¼ö¿Í pacf ÇÔ¼ö¸¦ »ç¿ëÇÏ¿© ¸ğÇü °áÁ¤ÇÏ±â


acf(skirtstimeseriesdiff2, lag.max=20)          #1Â÷ Â÷ºĞÇÑ µ¥ÀÌÅÍ·Î (ACF) È®ÀÎ

pacf(skirtstimeseriesdiff2, lag.max=20)         #1Â÷ Â÷ºĞÇÑ µ¥ÀÌÅÍ·Î (PACF) È®ÀÎ


# forecast package ¿¡ ³»ÀåµÈ auto.arima ÇÔ¼ö¸¦ ÀÌ¿ëÇÑ ¸ğÇü Ã£±â

auto.arima(skirts)                       
#--- ARIMA(1, 2, 0) À» °¡Àå ÀûÀıÇÑ ¸ğÇüÀ¸·Î ¼±ÅÃ


#  ARIMA ¸ğÇüÀ» ÅëÇØ ¹Ì·¡ ¿¹ÃøÇÏ±â 
# ARIMA¸ğÇüÀ¸·Î µ¥ÀÌÅÍ º¸Á¤ÇÏ±â(fitting)

skirtstimeseriesARIMA<- arima(skirtstimeseries, order=c(1, 2, 0))
skirtstimeseriesARIMA

# forecast.Arima ÇÔ¼ö¸¦ ÅëÇØ ¹Ì·¡ ¿¹ÃøÇÏ±â

skirtstimeseriesforecasts<-forecast.Arima(skirtstimeseriesARIMA)
skirtstimeseriesforecasts

# ¹Ì·¡ ¿¹Ãø¿¡ ´ëÇÑ µµÇ¥ ±×¸®±â

plot.forecast(skirtstimeseriesforecasts)


# forecast ÇÔ¼ö¸¦ È°¿ëÇÑ ½Ã°è¿­ ±¸ÇÏ±â

forecast(skirtstimeseries, h=12)
plot(forecast(skirtstimeseries, h=12))



#-----------------------------------------------------------------------------
#   Á¤»ó½Ã°è¿­ÀÇ ¿¹ 2  
#
#   1500³â ºÎÅÍ 1969³â±îÁöÀÇ È­»êÆø¹ß ¸ÕÁö·®
#-----------------------------------------------------------------------------


volcanodust <- scan("http://robjhyndman.com/tsdldata/annual/dvi.dat", skip=1)
volcanodustseries <- ts(volcanodust, start=c(1500))    
volcanodustseries
plot(volcanodustseries)                             
#plot.ts(volcanodustseries)  

# Æò±Õ°ú ºĞ»êÀÌ ½Ã°£¿¡ µû¶ó ÀÇÁ¸ÇÏÁö ¾ÊÀ¸¹Ç·Î Á¤»ó¼ºÀ» ¸¸Á·
# Â÷ºĞÀÌ³ª º¯È¯ ¾øÀÌ ½Ã°è¿­ ºĞ¼® ÁøÇà                       

acf(volcanodustseries, lag.max=20)              
acf(volcanodustseries, lag.max=20, plot=FALSE)
#--- lag = 4ºÎÅÍ Á¡¼±À» ÃÊ°úÇÏÁö ¾ÊÀ¸¹Ç·Î Àı´ÜÁ¡ÀÌ 4 -> MA(3) ¸ğÇü

pacf(volcanodustseries, lag.max=20)              
pacf(volcanodustseries, lag.max=20, plot=FALSE)
#--- lag = 3ºÎÅÍ Á¡¼±À» ÃÊ°úÇÏÁö ¾ÊÀ¸¹Ç·Î Àı´ÜÁ¡ÀÌ 3 -> AR(2) ¸ğÇü

auto.arima(volcanodustseries)
#--- ARIMA(1, 0, 2) ¸ğÇü

#--- MA(3), AR(2), ARMA(1,2) ¸ğÇüÁß °¡Àå °£´ÜÇÑ ¸ğÇüÀÎ AR(2)À» ¼±Á¤

#--- AR(2)¸ğÇüÀ¸·Î ½Ã°è¿­ º¸Á¤ (fitting)
volcanodustseries_ARIMA <- arima(volcanodustseries, order=c(2, 0, 0))

#  ¹Ì·¡ÀÇ °ªÀ» ¿¹ÃøÇÏ±â
volcanodustseries_forecast <- forecast.Arima(volcanodustseries_ARIMA, h=31)
plot.forecast(volcanodustseries_forecast)             
volcanodustseries_forecast


#############################################
#
#   °è·®Àû  MDS(´ÙÂ÷¿øÃ´µµ¹ı)
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
#   ÁÖ¼ººĞºĞ¼®
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
#   Â÷¿øÃà¼Ò PCA ¿¹Á¦ 2
#
#############################################

# csv ÆÄÀÏ ºÒ·¯¿À±â (file importing)
f_2007 <- read.csv("c:/r_class/finance_2007.csv",
                    header = TRUE, stringsAsFactors = FALSE)
 # V1 : ÃÑÀÚº»¼øÀÌÀÍÀ²
 # V2 : ÀÚ±âÀÚº»¼øÀÌÀÍÀ²
 # V3 : ÀÚ±âÀÚº»ºñÀ²
 # V4 : ºÎÃ¤ºñÀ²
 # V5 : ÀÚ±âÀÚº»È¸ÀüÀ²



 # Ç¥ÁØÈ­ º¯È¯ (standardization)
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
 round(cor(f_2007_2[,-1]), digits=3) # ¹İ¿Ã¸²
 
 # Scatter plot matrix
 plot(f_2007_2[,-1])
 
 
 # ÁÖ¼ººĞºĞ¼® PCA(Principal Component Analysis)
 secu_prcomp <- prcomp(f_2007_2[,c(2:6)]) # Ã¹¹øÂ° º¯¼ö È¸»ç¸íÀº »©°í ºĞ¼®
 
 summary(secu_prcomp)
 
 print(secu_prcomp)
 
 
 # Scree Plot
 plot(prcomp(f_2007_2[,c(2:6)]), type="l",
     sub = "Scree Plot")
 
 # Biplot
 biplot(prcomp(f_2007_2[,c(2:6)]), cex = c(0.7, 0.8))
 
 
 
 # °üÃøÄ¡º° ÁÖ¼ººĞ1, ÁÖ¼ººĞ2 Á¡¼ö °è»ê(PC1 score, PC2 score)
 secu_pc1 <- predict(secu_prcomp)[,1]
 secu_pc2 <- predict(secu_prcomp)[,2]

 # °üÃøÄ¡º° ÀÌ¸§ ¸ÅÇÎ(rownames mapping)
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
 
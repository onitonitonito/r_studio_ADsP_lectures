rm(list=ls())
setwd("~/GitHub/r_studio_ADsP_lectures")

### ----------------------------------------------------------------
# kings <- read.table(
#  "http://robjhyndman.com/tsdldata/misc/kings.dat",
#   header=TRUE, sep=",", stringsAsFactors=FALSE, na.strings=c('NIL'),
#   comment.char="#", encoding="UTF-8")
### ----------------------------------------------------------------

SalePrice <- read.csv("./_static/Boston_sale_price_train.csv")

# fix(SalePrice)
head(SalePrice)
colnames(SalePrice)


# ________함수정의 _______________
show_phist <- function(y, x1, x2, data1)  {
    par(mfrow=c(2,2))

    plot( y ~ x1)
    m1 <- lm(y ~ x1 , data = data1)
    abline(m1$coefficients)
    hist(x1)


    plot( y ~ x2)
    m2 <- lm(y ~ x2 , data = data1)
    abline(m2$coefficients)
    hist(x2)

    par(mfrow=c(1,1))
  }


y <- SalePrice$SalePrice         # 집값

# 집이 지어진 년도 / 리모델링을 한 집의 준공년도
x1 <- SalePrice$YearBuilt
x2 <- SalePrice$YearRemodAdd

x3 <- SalePrice$GrLivArea
x4 <- SalePrice$LotArea

# 2개의 백터값으로 반환했기 때문에 받아주는 변수가 있어야 한다.
show_phist(y, (x1), (x2), SalePrice)     # 2개변수의 플롯(plot) + 분포(hist)
show_phist(y, (x3), (x4), SalePrice)     # 2개변수의 플롯(plot) + 분포(hist)
show_phist(y, log(x3), log(x4), SalePrice)

par(mfrow=c(2,2))
plot(y~log(x4))
m4 <- lm(y~log(x4), data = SalePrice)
abline(m4$coefficients)
hist(log(x4))


# 건물 기초의 종류 / 외장재의 재료가 집값에 미치는 영향
par(mfrow=c(2,2))
plot(SalePrice$Foundation)       # 건물기초의 종류
plot(y ~ SalePrice$Foundation)   # 기초의 종류가 집값에 미치는 영향

plot(SalePrice$Exterior1st)      # 건출 주외관 재료
plot(y ~ SalePrice$Exterior1st)  #  건물외관이 집값에 미치는 영향
par(mfrow=c(1,1))


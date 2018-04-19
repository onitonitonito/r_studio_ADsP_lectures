rm(list=ls())

getwd()
setwd("D:\\My Documents\\GitHub\\r_studio_ADsP_lectures")
getwd()

SalePrice <- read.csv("./_static/Boston_sale_price_train.csv")

SalePrice
head(SalePrice)

colnames(SalePrice)

hist(SalePrice$YearBuilt)
hist(SalePrice$YearRemodAdd)
hist(SalePrice$GarageArea)

y <- SalePrice$SalePrice         # 집값


# -------------------------------------
plot (y ~ SalePrice$YearBuilt)
x <- SalePrice$YearBuilt         # 준공 년도
# m1 <- lm(y ~ SalePrice$YearBuilt , data=SalePrice)  # 인자에러- 오토믹벨류
m1 <- lm(y ~ x , data=SalePrice)
m1
abline(m1$coefficients)

# -------------------------------------
plot(y ~ SalePrice$GrLivArea)
x <- SalePrice$GrLivArea
m2 <- lm(y ~ x , data=SalePrice)
m2
abline(m1$coefficients)


plot(SalePrice$Foundation)       # 건물기초의 종류
plot(y ~ SalePrice$Foundation)   # 기초의 종류가 집값에 미치는 영향

plot(SalePrice$Exterior1st)      # 건물 외관의 종류
plot(y ~ SalePrice$Exterior1st)  #  건물외관이 집값에 미치는 영향

plot(SalePrice$Exterior2nd)

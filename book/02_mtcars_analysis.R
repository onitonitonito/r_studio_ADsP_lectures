library(Hmisc)

rm(list=ls())
data("mtcars")


# [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear" "carb"
colnames(mtcars)
mtcars

a <- mtcars$mpg   # 연비(mpg)
b <- mtcars$hp    # 마력(hp)
c <- mtcars$wt    # 중량(tonf)

plot(a ~ b)
cov(a, b)
cor(a,b)

plot(a ~ c)
cov(a, c)
cor(a,c)


# 전체를 한번에 매트릭스 행렬로 보고싶을때
cov(mtcars)   # 음/양의 상관관계를 보여주는 매트릭스
cor(mtcars)   # corelation 관계 매트릭스


# Hmisc 라이브러리를 로드해야 한다.
rcorr(a, b)
rcorr(a, c)


plot(b, c)     # 중량과 마력과의 관계
rcorr(b, c)


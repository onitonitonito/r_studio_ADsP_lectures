"_________ 기업의 연봉을 대표하는 값은? __________
(1) 최빈값 : 가장 자주 출현하는 빈도의 데이터 값
(2) 평균값 : 모든 값을 레코드 갯수로 나눈 평균값
(3) 중앙값 : median - 순서대로 일렬로 세웠을때 중앙 포지션
- 1/4 값(1st. Qu) = 25% 값
- 1/2 값(2nd. Qu) = median 값   ... first quantile
- 3/4 값(3rd. QU)
(4) 퍼센타일(%) =
"

# ------- 변수초기화 / 워킹폴더 세팅 ---------------------------
rm(list = ls())
setwd("~/Github/r_studio_ADsP_lectures/_static")
# --------------------------------------------------------------


library(MASS)      # MASS 라이브러리를 불러온다. -- 애니멀 데이터 세팅

head(Animals)      # 칼럼=(body/brain),레코드=Name

x <- Animals$body
y <- Animals$brain


plot(y~x)               # 비정상 - x/y축 범위가 너무크다

plot(Animals$body)      # (x)바디의 범주를 확인해 보면 튀는 값이 '1'개 있음
plot(log(Animals$body)) # (X)바디 범주에 로그함수()를 적용하여 {정상화}

plot(Animals$brain)     # (y)두뇌의 범주를 확인해 보니, 2개의 튀는값 존재
plot(log(Animals$brain))

brain_ex <- Animals$brain[Animals$brain >= 2000]
body_ex <- Animals$body[Animals$body >= 20000]

length(brain_ex)
length(body_ex)




plot(log(y) ~ log(x))

m1 <- lm(y~x, data = Animals)
m1$coefficients

"
(Intercept)             x
5.763724e+02 -4.326372e-04 "

abline(m1$coefficients, lty="dotted")

summary(Animals$body)
summary(Animals$brain)


#" ______ Animal Data SET : 내용 ___________
#> summary(Animals$body)
#    Min.  1st Qu.   Median     Mean  3rd Qu.     Max.
#    0.02     3.10    53.83  4278.44   479.00 87000.00
#
#> summary(Animals$brain)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#   0.40   22.23  137.00  574.52  420.00 5712.00
#"

" ___ 데이터의 안정화 = 로그스케일? / 엑스포넨셜 스케일? .. 을 쓸것인가?
  - 데이터 분석 = 3/4 qu < mean  .... 서드퀀 < 평균값이 크면, 비정상적이다.
  - 공룡 3개, 코끼리 2개 가 포함되어 있다 ... 삭제할 것인가?
  - 인간의 뇌무게가 너무 무겁다 ... 놔둘것인가? 삭제할 것인가?
"

plot(Animals$brain~Animals$body)             # Y축 ~ X축 순서로 플롯입력
plot(log(Animals$brain)~log(Animals$body))   # 맥스값이 너무 클경우 로그스케일로 변환


"(이상치 3개 발견! - 공룡)  .. 경향에 반하는 3개 데이터를 포함해서 회귀분석을 실시한다.
 이상치를 제외하는것 보다, 이상치(공룡)을 포함하면-- 기울기가 낮아진다."


m1 <- lm(log(brain)~log(body), data=Animals)
m1

"
Call:
lm(formula = log(brain) ~ log(body), data = Animals)

Coefficients:
(Intercept)    log(body)
      2.555        0.496  "

?abline
abline(m1$coefficients, lty="dotted")

m1$coefficients


# --------------------------------------------------------------------
# sink("fileout_3.txt", append=TRUE)
# pdf("fileout_3.pdf")
# close function
# dev.off()
# sink()
# --------------------------------------------------------------------


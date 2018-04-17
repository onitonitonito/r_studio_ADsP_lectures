# First R script Test -- Directory handle


setwd("C:\\_R_class\\r_studio_ADsP_lectures")
getwd()


# 대입 연산자
# (1) 일반 대입연산자           = '<-'
# (2) 함수 인자에서 대입연산자  = '='
# (3) 전역변수일때 대입연산자   = '<<-'

a <- data.frame(height=c(187,190,165,155,166,194),
                weight=c(89,76,94,55,56,98))
fix(a)      # data.frame 'a' 에 대한 편집입력기 (팝업)
a


rm(a)
rm(list=ls())

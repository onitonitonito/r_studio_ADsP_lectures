# R 둘러보기   ###

###### 작업 공간 할당하기 ###
getwd()


# C:\_R_class\ADsP_lecture
dir.create("C:\\_R_class\\ADsP_lecture")
setwd("C:\\_R_class\\ADsP_lecture")

getwd()


#### 커맨드 입력하기  ######
1 + 1


# 불완전한 커맨드 입력
max(4,6,8)
max(4,6,9)


# 여러줄을 한꺼번에 실행
a <- 1 + 1; b <- a / 2



# 도움말 기능 활용하기   #
help.start()
help(max)
?max
RSiteSearch("max")



# 명령어, 히스토리 활용하기  #
#예를 들어서 아래와 같은 명령어들을 실행시켰다면
ls()
a <- rnorm(20)   # 노말 랜덤숫자 20개를 추출해준다 (0~1)
b <- hist(a)
a

history()                       # 위의 명령어들을 다시 불러들인다
savehistory(file="myhistory")   # 명령어 히스토리를 저장
loadhistory(file="myhistory")     # 명령어 히스토리 불러오기


# _____ 패키지  활용하기 _______ #

path.package()                 #현재 활성화된 패키지들이 무엇인지 확인
data(Animals)                  #하드디스크에 MASS 패키지를 실행하지 않았기 때문에 파일이 없는것으로 나옴

library(MASS)                  #MASS 패키지를 라이브러리에 설치
data(Animals)                  #데이터 확인 가능
summary(Animals)

.libPaths()                    #현재 패키지들이 저장되는 장소
library(acepack)
installed.packages()           #현재 저장되어 있는 패키지들이 저장되는 장소 및 기능설명
nrow(installed.packages())

install.packages("boot")       #하드디스크에 존재하지 않는 boot 패키지 다운로드 및 설치

library(help=boot)             #다운로드 된 boot 패키지의 help 다큐먼트를 보여줌
help(package=boot)             #웹을 통해 boot 패키지의 다큐먼트를 보여줌
??boot                         #웹을 통해 boot 패키지의 다큐먼트를 보여줌

update.packages()              #패키지 업데이트 하기
remove.packages("boot")        #패키지 삭제하기

# 참고) R 실행 시 패키지도 함께 자동 실행되도록 설정하기
# 수정할 파일: C:\Program Files\R\R-자신의버전번호\etc\Rprofile.site




#######    출력하기   ##############
##################################

pi
sqrt(2)

print(pi)
print(sqrt(2))


#######    여러 인자를 한줄에 출력하기   ##############
## R에서는 프린트 문의 기능이 매우 열악해서, Cat를 주로 사용한다.
print("THe zoro occur at", 2 * pi, "radians.")     # 에러가 발생한다.

#cat함수는 print의 대안으로 여러개의 항목을 묶어서 연결된 결과로 출력해줌
cat("The zoro occur at", 2 * pi, "radians.", "\n")

#cat함수는 간단한 벡터도 출력 가능
f <- c(0,1,1,2,3,5,8,13)
cat("The Fibonacci numbers are:",f,"....\n")


#######    변수 설정하기   ##############
######################################
# 대입연산자 (<-)

x <- 3
y <- 2
z <- sqrt(x^2 + 2*y)

z

#R은 동적 타입 언어이다.

x <- c("a", "b", "c", "d")
x

a <<- 3     # (전역변수) 화살표 2개를 사용한다.
a

b = 4       # 함수() 안에 들어가는 연산자는 '이퀄'을 사용한다.
b

5 -> c      # 방향성에 관계없이도 사용 가능하다.
c



#변수 목록 보기

x <- 10
y <- 30
z <-c ("one", "two", "three")
f <- function(n,p) sqrt(p*(1-p)/n)
f (200,0.4)
ls()

#변수 목록 뿐아니라 구조를 보여주는 함수
ls()
ls.str()            # 변수 세팅에 대하여 상세하게 보여준다
ls.str(Animals)     # 특정 데이터만 별도로 보고 싶을 경우


rm(a)                      # 변수 삭제 , 한번 변수를 삭제하면 영원히 삭제 됨
rm(b,c,z)                  # 한꺼번에 변수 삭제 가능
ls()


.kkk<-12
objects()                  #변수를 조회하는 함수
objects(all.names=TRUE)    # .으로 시작하는 변수는 숨김변수이므로 이런 변수까지 조회하는 함수



# ______warning_____
# 변수목록을 리스트 인자에 지정한 다음 삭제하게 됨에 따라 기존에 있는
# 모든 변수를 삭제하게 됨, (조심해야 함 = 테러용이다? = 무슨말이지?)

rm(list=ls())
ls()


# ____ R 에서 사용하는 오브젝트 ____
# (1) 오브젝트 : 스칼라 __ 벡터 __
# 0 차원 = 스칼라 = PI, 3, 'a'
# 1 차원 = 벡터 = [1,2,3,4]
# 2 차원 = 매트릭스 [[1,2],[3,4]]
# 3 차원 = 어레이 [[[1,2,],[3,4]],[[1,2,],[3,4]]]


# _ 1.벡터(동질성) 와 2.데이터셋(이질성)
# _ 팩터(Factor) = 카테고리로 되어있는 자료 = 남/여, 학교, 학점
# _ 캐릭터는 고유의 값이다. (UID) ... 캐릭터 자료는 분석대상이 아니다.
# ____ 주소 = ~구 (팩터) .. 여러명이 될수 있다 vs (캐릭터) = 전체고유 주소
# _데이터 프레임의 특성 (이질성) : 리스트도 (이질성)
# 자료의 갯수가 동일 해야 함 (빈곳은 채워줘야 함)


#######  벡터 생성하기  ##############
# 동질성이 확보되야 한다  숫자면, 숫자 / 문자면, 문자
# 한가지가 바뀌면, 모두가 다 바뀌어 버린다.
# '문자'를 우선시한다

c(0, 1, 1, 2, 3, 5, 8, 13)     # 1차원 백터 = Cobine() 함수를 사용해서 결함시킴.
c(1*pi, 2*pi, 3*pi, 4*pi)
c("I", "love", "you.")
c(TRUE, TRUE, FALSE, FALSE)


d <- c(1, 2, 3)
e <- c(4, 5, 6)
f <- c("a", "b", "c")

#벡터의 인자 자체가 벡터인 경우 벡터를 풀어서 하나로 합친다.

g<-c(d,e,c(7,8,9))
g

#벡터의 인자 중 하나라도 문자가 포함되어 있는 경우 모든 원소들은 문자형으로 정의 된다.

h<-c(d,f)      # 숫자와 문자를 결함하면 모두 '문자'가 됨  ... "1" "2" "3" "a" "b" "c"
h

rm(d,e,f,g,h)
rm(x,y)

mode(g)
mode(h)


####### 기본적인 통계량 계산하기  ###########
#######################################


a <- c(0,1,1,2,3,5,8,13)
b <- log(a+1)
c <- c(0,1,1,2,3,5,8,13,NA)

#평균 (통계에서는 Average 가 아닌 Mean 을 사용한다)
mean(a)                   # 4.125 ---  정상적으로 계산됨
mean(0,1,1,2,3,5,8,13)    # 숫자를 입력하면 계산 안해줌 '0' 이 나옴

#중앙값
median(a)                 # 2.5 --- 중간값 2.5가 적절히 계산됨
median(0,1,1,2,3,5,8,13)  # 숫자를 나열하면 에러 = Error in median(0,1,2...)


#표준편차 (Standard Deviation = SD)
sd(a)
sd(0,1,1,2,3,5,8,13)

#분산 (Variation )
var(a)
var(0,1,1,2,3,5,8,13)

#상관계수 (Corelative Coefficieant = CC)
cor(a,b)

#공분산 (covariance)
cov(a,b)


#평균, 중간값, 표준편차는 데이터 프레임에서 각 변수들을 기준으로 값을 산출
#분산은 공분산 행렬을 제공, 상관계수는 상관계수 행렬을 제공


## 단하나의 NA 값이 포함되어도 결과는 NA로 나오므로 아래와 같이 활용
c        # 결측값(NA)를 포함하고 있는 자료
mean(c)  # NA가 나옴  ... 10개의 데이터중 1개의 NA가 있는 경우
sd(c)    # NA 가 나옴...  마찬가지로 표준편차도 안나옴 (NA)


mean(c, na.rm=TRUE)  # 평균을 낼때, NA값을 지우고 계산
sd(c, na.rm=TRUE)    # 표준편차를 낼때 NA값을 지우고 계산한다고 써줘야 함


height <- c(187, 178, 176, 169, 181, 172)
weight <- c(82, 72, 70, 65, 74, NA)

dfm_1<-data.frame(height, weight)
dfm_1

dfm<-data.frame(height=c(187,178,176,169,181,172),
                weight=c(82,72,70,65,74,68))
dfm


mean(dfm)      # NA를 반환한다 - 인자가 수치형/논리형이 아니므로 NA를 반환한다.

mean(dfm$height)
sd(dfm$height)

median(dfm$height)
cor(dfm$height,dfm$weight)
cor(dfm)
cov(dfm$height,dfm$weight)
cov(dfm)


####### 수열 생성하기  ##############
##################################

1:10

# by의 디폴트는 1

seq(from=1, to=10, by=2)
rep(1,times=5)

0:9
5:10
9:0


# 수열의 길이를 지정하고자 할때


seq(from=0, to=50, length.out=6)
seq(from=1.0, to=2.0, length.out=6)
rep(pi, times=5)



############ 벡터의 비교  ##############
####################################

a <- 3.1
a == pi
a != pi
a < pi
a > pi
a <= pi
a >= pi

z <- c(3, pi, 4)   # 1차원 '벡터'
z1 <- c(pi,pi,4)   # 1차원 '벡터'

z2 = pi   # 0차원 '스칼라'

z == z1   # 같은 위치의 원소끼리 비교 F T T
z == z2   # 백터와 스칼라비교 : 1:1 로 반복비교 F T F

# 스칼라와 벡터를 비교하면, 스칼라는 벡터만큼 '자기복제'를 한다
# 스칼라의 자기복제 (Recycle)로 빈 칸에 복사값을 채운다.
z + z2    # 자기복제로 갯수를 맞춘후 연산을 한다.
# 6.141593 6.283185 7.141593

# 갯수가 부족한 1차원 벡터값도 자기복제를 순서대로 반복함
# 갯수가 안떨어지면 워닝메시지를 주지만, 실행은 된다.
z3 = c(1, 2, 3, 4, 5)
z4 = c(1, 2)
z3 + z4     # z4 = c(1,2,1,2,1) --> (2 4 4 6 6)


any(z==z1)  #벡터의 값들 중 하나라도 같은가?
all(z==z1)  #벡터의 값들이 모두 같은가?   all(z==0) 모든 값들이 0인가?는 많이 활용된다.






############ 벡터에 있는 원소 선택하기  ########
###########################################

a <-c (0,1,1,2,3,5,8,13,NA)
a
a[1]
a[2]
a[3]

a[1:3]
a[4:7]

a[c(1,3,5,7)]   # 1,3,5,7번째 = 0 1 3 8

a[1,3,5,7]      # 에러발생 (컴바인 함수()를 사용해야 함) : incorrect number of dimensions

# 인덱스가 음수인 경우는 1번째 값을 제외하라는 의미

a[-1]           # 첫번째를 제외한 모두
a[-(2:3)]       # 2~3을 제외한 모두
a[-c(1,3,5,7)]  # 음수는 '제외한 모두'를 의미한다.


# 중앙값보다 큰 모든 원소를 선택
# 중앙값 = 일열로 크기별로 세웠을때, 중앙의 원소
# __ 홀수 일경우는 센터값이 있다
# __ 짝수 일 경우는 중앙, 좌/우 2개의 값을 평균낸다.

a <-c (0,1,1,2,3,5,8,13)   # NA 값을 처리해 줘야 함 (에러a <-c (0,1,1,2,3,5,8,13,NA)
a
median(a)
a > median(a)
a [a>median(a)]

# 상하위 5% 안에 있는 모든 원소를 선택
a[a<quantile(a,0.05)|a>quantile(a,0.95)]

# 평균에서 + - 표준편차를 넘는 모든 원소 선택

a-mean(a)>2*sd(a)
a[abs(a-mean(a))>2*sd(a)]

# NA나 NULL이 아닌 모든 원소를 선택
a <- c(1,2,NA,3,4)
a
mean(a)

b<-c(1,2,NULL,3,4)
b
mean(b)

a
a[!is.na(a) & !is.null(a)]

a <-c (0,1,1,2,3,5,8,13)   # NA 값을 처리해 줘야 함 (에러a <-c (0,1,1,2,3,5,8,13,NA)
names(a) <- c("1st","2nd","3th","4th","5th","6th","7th","8th")
a
a["2nd"]

a["4th"]




############    벡터 연산 수행하기      ########
###########################################

v1<-c(10,11,12,13,14)
v2<-c(1,2,3,4,5)
v1+v2
v1-v2
v1*v2
v1/v2
v1^v2


v1+2
v1-2
v1*2
v1/2
v1^2

mean(v1)
v1 - mean(v1)
(v1 - mean(v1)) / sd(v1)



############    연산자 우선순위       ########
###########################################
# PPT 참조




############     R  함수 정의        ########
###########################################
#
#   function(매개변수1, 매개변수2, 매개변수3,....) expr
#
#   function(매개변수1, 매개변수2, 매개변수3,....) {
#        expr1
#        expr2
#        expr3
#        .....
#        }
#
##############################################?
sdt<-function(x) (x-mean(x))/sd(x)   #정규분포를 표준정규분포로 표준화

x<-c(7,8,9,10,11,12)
sdt(x)


hei<-c(187,178,176,169,181,172)
wei<-c(82,72,70,65,74,82)



#########################################
# BMI 지수를 만들어 내는 함수를 개발한다.
# 함수명은 BMI이고
# BMI=(키-100)/몸무게
# 데이터는 아래와 같다
#
# hei<-c(187,178,176,169,181,172)
# wei<-c(82,72,70,65,74,82)
##########################################
BMI<- function(x,y)  (x-100)/y

hei<-c(187,178,176,169,181,172)
wei<-c(82,72,70,65,74,82)

BMI(hei,wei)



# 외도(SKEWNESS) = (x - mean)^3 / sd ... <0 큰쪽으로, >0 작은쪽으로 0=표준편차
# 첨도 (Kurto) = (x-mwan)^4 / sd ....  <0 퍼진다, >0 종모양으로 붙는다 0=표준편차

skew.and.kurto <-function(x)        #왜도와 첨도를 구하는 함수 = 단순힌 filler (알파벳으로 시작하면 됨)
{
  num1 <- mean((x-mean(x))^3)
  denom1<-(mean((x-mean(x))^2))^1.5
  num2 <-mean((x-mean(x))^4)
  denom2<-(mean((x-mean(x))^2))^2
  skew<-num1/denom1
  kurto<-num2/denom2-3
  return(c(skew,kurto))
}


t5 <- 1:1000          # 1000 random obs from t with df 5  = 그냥 퍼진직선분포
length(t5)            # 갯수 = 1000 개
skew.and.kurto(t5)    # 스큐 = 0(중심값이 표준편차와 동일) / 쿠토= -1.2(음수) 퍼져있기 때문


#########  데이터 입력하기  ############
####################################


# 키보드로 데이터를 입력할 때 conbine 함수를 사용
a <- c(1,2,3,4,5,6,7,8,9)

# 빈 데이터 프레임을 만든 뒤 내장된 편집기를 불러와 데이터 입력
# 데이터 프레임 형테는 (이질성) 데이터도 입력시킬수 있다.
temp <- data.frame()
b <- edit(temp)
fix(b)
b


#메뉴->edit->data editor -> object명 입력


# 간단한 문제를 다룰 때는 데이터 파일을 생성하고 읽어오는 것이 귀찮습니다.
# 이럴때는 R에 데이터를 곧바로 입력하는 게 편리하합니다.
# 이러한 방법을 위해 데이터 프레임을  정의하고 c함수로 벡터 생성해서 데이터를 입력해 봅시다.

c<-data.frame(
  label=c("low","mid","high"),
  lbound=c(0,0.5,1.5),
  ubound=c(0.5,1.5,2.5)
)
fix(c)
c


#########  파일에 출력하기  ############
####################################
a <- sqrt(10)
cat("The Answer is", a, "\n", file="fileout1.out")



# sink("fileout2.txt")
sink("fileout2.txt", append=TRUE)
pdf("fileout2.pdf")
library(MASS)
data(Animals)
Animals

m1<-lm(log(brain)~log(body),data=Animals)
str(m1)
attach(Animals)
plot(log(brain)~log(body))
abline(m1$coef, lty="dotted")
dev.off()
sink()

getwd()









#########  파일 목록보기  ############
####################################

list.files()

#하위 디렉토리의 모든 파일을 볼수 있음

list.files(recursive=T)
#하위 디렉토리의 숨겨놓은 파일(마침표로 시작하는 파일)까지 모두 볼수 있음
list.files(recursive=T, all.files=T)





#########  윈도우에서 'cannot open file 해결하기  ############
##########################################################
# R에서 가장큰 구조적 단점은 = 역슬래쉬를 인식하지 못한다


# d:\dataedu\R\basic\exam1.txt   위도우에서 파일이 있음을 알고 있다.
#하지만

f1 <- read.table("c:\_R_class\ADsP_lecture\exam1.rdb")  # 에러발
# 역슬레쉬(\)가 이름에 포함되어 있으면 문제가 발생
# 역슬레쉬 뒤에 오는 모든 문자를 이스케이프 처리한뒤 d:dataeduRbasicexam1.txt 로 인식

# 윈도우에서 R은 슬러쉬(/)를 역슬레쉬와 똑같이 취급하므로 문제 해결
f1 <- read.table("c:/_R_class/ADsP_lecture/exam1.rdb")


#R에서는 역슬레쉬 (\\)를 역슬레쉬 (\)로 인식하여 취급하므로 문제 해결

f1 <- read.table("c:\\_R_class\\ADsP_lecture\\exam1.rdb")            # 인덱스값이 데이타로 편입되 버린다.
f1 <- read.table("c:\\_R_class\\ADsP_lecture\\exam1.rdb", header=T)

f1


############고정데이터 불러오기####################
###############################################

# f2<-read.fwf("exam2.txt", widths=c(w1,w2,w3,w4))   고정 자리 데이터 읽기
#1째는 과제제출여부, 2째는 점수 사이에는 2칸의 빈칸

f2<-read.fwf("exam2.rdb", widths=c(1,-2,2))
f2<-read.fwf("exam2.rdb", widths=c(1,-2,2),
             col.names=c("report","score"))                 # col명 지정
f2


getwd()
###########비고정데이터 불러오기#############################

# (탭 또는 공백으로 구분된 )텍스트 파일로 된 테이블형식의 데이터 불러오기
# 각 줄이 하나의 레코드
f3 <- read.table("kings.rdb")
f3
# 하나의 레코드 내에서, 공백, 탭, 쉽표 등 한글자 짜리 구분문자
# f3<-read.table("kings.txt", sep= :, )
# 각 레코드ㅡ 동일한 수의 필드를 가짐


class(f3$V1)

# 문자열 레코드값을 'factor'로 인식하지 않고 문자열로 인식하게 함

f3 <- read.table("kings.rdb", stringsAsFactor=FALSE)   # 스트링은 캐릭터로 받아들어라.
f3
class(f3$V1)

f3 <- read.table("kings.rdb", na.strings=".")    # SAS의 결측값(.) 형태의 데이터를 NA 형태로 결측값을 변경
f3


# csv 파일은 R, 엑셀, 다른 스프레드시트 프로그램, 데이터베이스 관리자들이 자주 사용하는 형식
getwd()
setwd("D:\\My Documents\\GitHub\\r_studio_ADsP_lectures\\_static")

f4 <- read.csv("frame.csv",header=T, as.is=T)
f4
fix(f4)
?fix                        # 'R' 도규멘테이션을 참조한다.
??acepack                   # 'package' 도큐멘테이션을 참조한다.
class(f4$ename)


#탐색기를 통한 데이터 파일 불러오기
file.choose <- read.csv (file.choose())
head(file.choose)
tail(file.choose)




########### csv 파일 출력하기 ############################
######################################################

write.csv(f4,file="new_frame.csv", row.names=FALSE)   # row.name 를 주지 않는다. (레코드번호를 뺀다)
write.csv(f4,file="new_frame.csv", row.names=TRUE)   # CSV 엑셀데이터이기 때문에 레코드 번호 불필요
?write

a <- c(1,2,3,4,5,6)
a

dim(a) <- c(3,2)        # 차원을 바꾸는 명령어
a

write.csv(a,file="a.csv", row.names=FALSE)
write.csv(a,file="a.csv", col.names=FALSE)    # 워닝(무시됨) - 이것은 적용되지 않는다.


# 'R'에서 가장 많이 사용하는 명령어는 '오브젝트' = a, b 같은 오브젝트
# _ 대입연산자, 산술연산자, 비교연산자
# _ 함수()


# _______ 'R' 프로그래밍의 단계 (레벨)
# 초급 = 연산자, 기본명령어, 함수의 의미를 알면 초급!
# 중급 = 함수(), 패키지()를 이용할수 있으면 중급!
# 고급 = 함수(), 패키지()를 자유롭게 만들면 고급!



# _______________________________________
#       데이터 프레임 만들기
# ---------------------------------------

# 벡터와 요인이 혼합된 데이터라면 data.frame 함수를 사용해서 조립
##  dfm<-data.frame(v1,v2,v3,f1,f2)

# 데이터가 리스트 구조라면 as.data.frame 으로 재설정 가능
#  dfm<-as.data.frame(list.of.vectors)

#벡터 생성
level<-c("low","mid","high")
lbound<-c(0.1,0.5,1.5)
ubound<-c(0.5,1.5,2.5)

#벡터를 데이터프레임으로 변환
df <- data.frame(level, lbound,ubound)
df



#외부 데이터를 불러와 어브젝트에 할당
a <- read.csv("frame.csv", header=T)
a


# 외부 데이터가 리스트 구조임에 따라 구조 변경으로 데이터를 데이터프레임에 적용
dfm1 <- as.data.frame(a)
dfm1


#오브젝트의 내용 중 필요한 변수만 선택해서 data.frame 형식으로 재 구성

dfm2 <- data.frame(a$empno, a$ename, a$deptno)
dfm2

# 열의 이름을 적용하여 data.frame 형식으로 재 구성
dfm2 <- data.frame(empno=a$empno, ename=a$ename, deptno=a$deptno)
dfm2


# 개별 벡터로 정의된 데이터들을 리스트로 구조를 변경하고 데이터 프레임형식으로 적용
lst <- list(a1=a$empno, a2=a$ename, a3=a$deptno, a4=a$phone)
lst

lst1 <- as.data.frame(lst)
lst1

varDf <- dfm1
class(varDf$empno)     # integer
class(varDf$ename)     # factor
class(varDf$deptno)    # integer
class(varDf$phone)     # NULL

lst2 <- list(empno=10011, ename="Simson", deptno=30, phone="323-4333")
lst2

varLst <- lst2
class(varLst$empno)
class(varLst$ename)
class(varLst$deptno)
class(varLst$phone)

##  subset(데이터 프레임,select=c(열이름, 열이름,...)) 으로 쉽게 데이터 선택
##  subset(데이터 프레임,select=c(열이름, 열이름,...),subset=(열이름>조건))

lst<-subset(lst1,select=-a4)
lst
lst<-subset(lst1,select=c(a1, a3))
lst
lst<-subset(lst1,select=c(a1,a3),subset=(a3==30))
lst
lst<-subset(lst1,subset=(a3==30))
lst



##############           연습 문제            #######################
#        MASS 라는 패키지 내 Cars93 데이터셋에서                #####
# 1) city 에서 갤런당 30마일 이상 주행하는 연비를 가지는 차를 선택  #
# 2) 고속도로에서 MPG 값이 중앙값이상인 모든 차의 제조사와 모델명  ##
#####################################################################
?Cars93
head(Cars93)
fix(Cars93)

library(MASS)

subset(Cars93, select=Model, subset=(MPG.city>30))
table(subset(Cars93, select=Manufacturer, subset=(Price < 50)))

Cars93$Manufacturer
length(Cars93$Manufacturer)


newCars93 <- subset(Cars93, select=c(Manufacturer, Model,Type, Price, RPM),
                  subset=c(MPG.highway>median(MPG.highway)))
newCars93

#열이름으로 열삭제
newCars93<-subset(newCars93, select=-Manufacturer)
newCars93


cor(subset(newCars93, select=c(-Manufacturer, -Model)))
cor(Cars93$Price, Cars93$RPM)



#데이터 프레임의 열이름 바꾸기
colnames(newCars93)<-c("Manu", "Model","Type", "Price", "RPM")
newCars93

summary(Cars93)
summary(newCars93)


# R 둘러보기   ###
###### 작업 공간 할당하기 ###


getwd()

dir.create("d:/r/basic")
setwd("d:/r/basic")

getwd()


#### 커맨드 입력하기  ######

1+1


# 불완전한 커맨드 입력
max(4,6,8), max(4,6,
)


# 여러줄을 한꺼번에 실행
a<-1+1; b<-a/2



# 도움말 기능 활용하기   #

help.start()
help(max)
?max
RSiteSearch("max")



# 명령어 히스토리 활용하기  #

#예를 들어서 아래와 같은 명령어들을 실행시켰다면
ls()
a<-rnorm(20)
b<-hist(a)

history()                       # 위의 명령어들을 다시 불러들인다
savehistory(file="myhistory")   # 명령어 히스토리를 저장
loadhistory(file="myhistory")     # 명령어 히스토리 불러오기




# 패키지  활용하기  #

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
??boot                    #웹을 통해 boot 패키지의 다큐먼트를 보여줌

update.packages()              #패키지 업데이트 하기

remove.packages("boot")          #패키지 삭제하기




# 참고) R 실행 시 패키지도 함께 자동 실행되도록 설정하기
#수정할 파일: C:\Program Files\R\R-자신의버전번호\etc\Rprofile.site




#######    출력하기   ##############
##################################

pi
sqrt(2)

print(pi)
print(sqrt(2))


#######    여러 인자를 한줄에 출력하기   ##############
print("THe zoro occur at", 2*pi, "radians.")

#cat함수는 print의 대안으로 여러개의 항목을 묶어서 연결된 결과로 출력해줌

cat("The zoro occur at", 2*pi, "radians.","\n")

#cat함수는 간단한 벡터도 출력 가능

f<-c(0,1,1,2,3,5,8,13)
cat("The Fibonacci numbers are:",f,"....\n")



#######    변수 설정하기   ##############
######################################
# 대입연산자 (<-)

x<-3
y<-2
z<-sqrt(x^2+2*y)
z

#R은 동적 타입 언어이다.

x<-c("a", "b", "c", "d")
x

a<<-3
a
b=4
b
5->c
c





#변수 목록 보기

x<-10
y<-30
z<-c("one", "two", "three")
f<-function(n,p) sqrt(p*(1-p)/n)
f(200,0.4)
ls()

#변수 목록 뿐아니라 구조를 보여주는 함수
ls()
ls.str()


rm(a)                      # 변수 삭제 , 한번 변수를 삭제하면 영원히 삭제 됨
rm(b,c,z)                  # 한꺼번에 변수 삭제 가능
ls()


.kkk<-12
objects()                  #변수를 조회하는 함수

objects(all.names=T)       # .으로 시작하는 변수는 숨김변수이므로 이런 변수까지 조회하는 함수



# warning 변수 목록을 리스트 인자에 지정한 다음 삭제하게 됨에 따라 기존에 있는 모든 변수를 삭제하게 됨 조심해야 함.

rm(list=ls())

ls()



#######  벡터 생성하기  ##############
###################################

c(0,1,1,2,3,5,8,13)
c(1*pi,2*pi,3*pi,4*pi)
c("I","love","you.")
c(TRUE,TRUE,FALSE,FALSE)


d<-c(1,2,3)
e<-c(4,5,6)
f<-c("a","b","c")

#벡터의 인자 자체가 벡터인 경우 벡터를 풀어서 하나로 합친다.

g<-c(d,e,c(7,8,9))
g

#벡터의 인자 중 하나라도 문자가 포함되어 있는 경우 모든 원소들은 문자형으로 정의 된다.

h<-c(d,f)
h

mode(g)
mode(h)


####### 기본적인 통계량 계산하기  ###########
#######################################


a<-c(0,1,1,2,3,5,8,13)
b<-log(a+1)
c<-c(0,1,1,2,3,5,8,13,NA)

#평균
mean(a)
mean(0,1,1,2,3,5,8,13)

#중앙값
median(a)
median(0,1,1,2,3,5,8,13)


#표준편차
sd(a)
sd(0,1,1,2,3,5,8,13)

#분산
var(a)
var(0,1,1,2,3,5,8,13)
#상관계수
cor(a,b)

#공분산
cov(a,b)


#평균, 중간값, 표준편차는 데이터 프레임에서 각 변수들을 기준으로 값을 산출
#분산은 공분산 행렬을 제공, 상관계수는 상관계수 행렬을 제공


## 단하나의 NA 값이 포함되어도 결과는 NA로 나오므로 아래와 같이 활용

mean(c)
sd(c)

mean(c, na.rm=TRUE)
sd(c, na.rm=TRUE)


hei<-c(187,178,176,169,181,172)

wei<-c(82,72,70,65,74,NA)

dfm_1<-data.frame(hei,wei)

dfm_1

dfm<-data.frame(height=c(187,178,176,169,181,172),
                weight=c(82,72,70,65,74,68))
dfm



mean(dfm)

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

a<-3.1
a==pi
a!=pi
a<pi
a>pi
a<=pi
a>=pi

z<-c(3,pi, 4)
z1<-c(pi,pi,4)
z2=pi

z==z1
z==z2

any(z==z1)           #벡터의 값들 중 하나라도 같은가?
all(z==z1)           #벡터의 값들이 모두 같은가?   all(z==0) 모든 값들이 0인가?는 많이 활용된다.






############ 벡터에 있는 원소 선택하기  ########
###########################################

a<-c(0,1,1,2,3,5,8,13,NA)
a
a[1]
a[2]
a[3]

a[1:3]
a[4:7]

a[c(1,3,5,7)]

a[1,3,5,7]

# 인덱스가 음수인 경우는 1번째 값을 제외하라는 의미

a[-1]
a[-(2:3)]
a[-c(1,3,5,7)]


# 중앙값보다 큰 모든 원소를 선택
a
median(a)

a>median(a)

a[a>median(a)]

# 상하위 5% 안에 있는 모든 원소를 선택
&  |
    a[a<quantile(a,0.05)|a>quantile(a,0.95)]

# 평균에서 + - 표준편차를 넘는 모든 원소 선택

a-mean(a)>2*sd(a)
a[abs(a-mean(a))>2*sd(a)]

# NA나 NULL이 아닌 모든 원소를 선택

a<-c(1,2,NA,3,4)
a
mean(a)
b<-c(1,2,NULL,3,4)
b
mean(b)

a
a[!is.na(a) & !is.null(a)]

names(a)<-c("1st","2nd","3th","4th","5th","6th","7th","8th")
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
v1-mean(v1)
(v1-mean(v1))/sd(v1)



############    연산자 우선순위       ########
###########################################


PPT 참조




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



skew.and.kurto <-function(x)        #왜도와 첨도를 구하는 함수
{
    num1 <- mean((x-mean(x))^3)
    denom1<-(mean((x-mean(x))^2))^1.5
    num2 <-mean((x-mean(x))^4)
    denom2<-(mean((x-mean(x))^2))^2
    skew<-num1/denom1
    kurto<-num2/denom2-3
    return(c(skew,kurto))
}


t5<- 1:1000                    #1000 random obs from t with df 5
skew.and.kurto(t5)


#########  데이터 입력하기  ############
####################################


#키보드로 데이터를 입력할 때 conbine 함수를 사용

a<-c(1,2,3,4,5,6,7,8,9)

#빈 데이터 프레임을 만든 뒤 내장된 편집기를 불러와 데이터 입력

temp<-data.frame()
b<-edit(temp)
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

c





#########  파일에 출력하기  ############
####################################

a<-sqrt(10)
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



# d:\dataedu\R\basic\exam1.txt   위도우에서 파일이 있음을 알고 있다.
#하지만

f1<-read.table("d:\dataedu\R\basic\exam1.txt")
# 역슬레쉬(\)가 이름에 포함되어 있으면 문제가 발생
# 역슬레쉬 뒤에 오는 모든 문자를 이스케이프 처리한뒤 d:dataeduRbasicexam1.txt 로 인식

# 윈도우에서 R은 슬러쉬(/)를 역슬레쉬와 똑같이 취급하므로 문제 해결
f1<-read.table("d:/r/basic/exam1.txt")


#R에서는 역슬레쉬 (\\)를 역슬레쉬 (\)로 인식하여 취급하므로 문제 해결

f1<-read.table("d:\\r\\basic\\exam1.txt")




############고정데이터 불러오기####################
###############################################

# f2<-read.fwf("exam2.txt", widths=c(w1,w2,w3,w4))   고정 자리 데이터 읽기

#1째는 과제제출여부, 2째는 점수 사이에는 2칸의 빈칸

f2<-read.fwf("exam2.txt", widths=c(1,-2,2))

f2<-read.fwf("exam2.txt", widths=c(1,-2,2),
             col.names=c("report","score"))                 # col명 지정

f2





###########비고정데이터 불러오기#############################

# (탭 또는 공백으로 구분된 )텍스트 파일로 된 테이블형식의 데이터 불러오기
# 각 줄이 하나의 레코드
f3<-read.table("kings.txt")
f3
# 하나의 레코드 내에서, 공백, 탭, 쉽표 등 한글자 짜리 구분문자
# f3<-read.table("kings.txt", sep= :, )
# 각 레코드ㅡ 동일한 수의 필드를 가짐


class(f3$V1)

# 문자열 레코드값을 factor로 인식하지 않고 문자열로 인식하게 함

f3<-read.table("kings.txt", stringsAsFactor=FALSE)
f3
class(f3$V1)

f3<-read.table("kings.txt", na.strings=".")    # SAS의 결측값(.) 형태의 데이터를 NA 형태로 결측값을 변경
f3


# csv 파일은 R, 엑셀, 다른 스프레드시트 프로그램, 데이터베이스 관리자들이 자주 사용하는 형식

f4<-read.csv("frame.csv",header=T, as.is=T)
f4
class(f4$ename)


#탐색기를 통한 데이터 파일 불러오기

file.choose<-read.csv (file.choose())
head(file.choose)




########### csv 파일 출력하기 ############################
######################################################

write.csv(f4,file="new_frame.csv", row.names=FALSE)
?write

a<-c(1,2,3,4,5,6)
dim(a)<-c(3,2)
write.csv(a,file="a.csv", row.names=FALSE)




######### 데이터 프레임 만들기  ########

# 벡터와 요인이 혼합된 데이터라면 data.frame 함수를 사용해서 조립
##  dfm<-data.frame(v1,v2,v3,f1,f2)

# 데이터가 리스트 구조라면 as.data.frame 으로 재설정 가능
#  dfm<-as.data.frame(list.of.vectors)

#벡터 생성
level<-c("low","mid","high")
lbound<-c(0.1,0.5,1.5)
ubound<-c(0.5,1.5,2.5)

#벡터를 데이터프레임으로 변환
dfm1<-data.frame(level, lbound,ubound)
dfm1



#외부 데이터를 불러와 어브젝트에 할당


a<-read.csv("frame.csv", header=T)
a


# 외부 데이터가 리스트 구조임에 따라 구조 변경으로 데이터를 데이터프레임에 적용

dfm1<-as.data.frame(a)
dfm1


#오브젝트의 내용 중 필요한 변수만 선택해서 data.frame 형식으로 재 구성

dfm2<-data.frame(a$empno, a$ename, a$deptno)
dfm2

# 열의 이름을 적용하여 data.frame 형식으로 재 구성

dfm2<-data.frame(empno=a$empno, ename=a$ename, deptno=a$deptno)
dfm2


# 개별 벡터로 정의된 데이터들을 리스트로 구조를 변경하고 데이터 프레임형식으로 적용

lst<-list(a1=a$empno, a2=a$ename, a3=a$deptno, a4=a$phone)
lst
lst1<-as.data.frame(lst)
lst1







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
Cars93

library(MASS)

subset(Cars93, select=Model, subset=(MPG.city>30))

newCars93<-subset(Cars93, select=c(Manufacturer, Model,Type, Price, RPM),
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

summary(newCars93)

rm(list=ls())
getwd()
#############################################
#
#   계량적  MDS(다차원척도법)
#
#############################################


library(MASS)

" __ (1) 도시간의 거리를 알면, 도시 전체의 배치를 알수 있음 __"
data("eurodist")
eurodist
head(eurodist)
summary(eurodist)

loc<-cmdscale(eurodist)
x<-loc[,1]
y<- -loc[,2]

# 플롯 옵션
# 각 도시간의 거리를 알면, 실제 도시의 위치와 비슷하게 배치가 된다.
plot(x, y, type="n", asp=1, main="Metric MDS")

text(x,y,rownames(loc),cex=0.9)
abline(v=0, h=0, lty=2, lwd=0.5)


"__ (2) 서로 성격이 비슷한 차량끼리, 2차원 공간에 배치시켜 줌 ___"
data(mtcars)
head(mtcars)

mt <- mtcars
mt.x <- as.matrix(mt[,-1])
mt.dist <- dist(mt.x)

loc <- cmdscale(mt.dist)

# 그림상에 보이지 않지만, 점을 찍어주고
plot(loc[,1],loc[,2],type="n",asp=1,main="Metric MDS")

# 타이틀을 표시해 준다
text(loc[,1],loc[,2],rownames(loc),cex=0.7)

# 중앙값의 라인을 그려준다.
abline(v=0, h=0, lty=2, lwd=0.5)








#############################################
#
#   주성분분석 (PCA: Principal Component Analysis)
#
#############################################
library(datasets)

data(USArrests)

pairs(USArrests, panel=panel.smooth,
      main="USArrests data")

US.prin <- princomp(USArrests,cor=TRUE)
summary(US.prin)

screeplot(US.prin,npcs=5, type="lines")
loadings(US.prin)

"
Loadings:
         Comp.1  Comp.2    Comp.3 Comp.4
Murder   -0.536*  0.418    -0.341  0.649
Assault  -0.583*  0.188    -0.268 -0.743
UrbanPop -0.278  -0.873*   -0.378  0.134
Rape     -0.543* -0.167     0.818

__컴포넌트 팩터가 큰값 비교: PC1=M,A,R / PC2=U
"

US.prin$scores
biplot(US.prin)

"직선방향= 성향강함 / 반대쪽=성향약함 / 법선=영향없음"






#############################################
#
#   ???????? PCA ??�� 2
#
#############################################

# csv ???? ?ҷ??��? (file importing)
f_2007 <- read.csv("./_static\\finance_2007.csv",
                   header = TRUE, stringsAsFactors = FALSE)
head(f_2007)
# 6개 증권사현황 = 교보,메리츠,대신,대우,동부,SK
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
head(f_2007_2)

# 상관관계(Correlation)분석
cor(f_2007_2[,-1])
round(cor(f_2007_2[,-1]), digits=3) # ?ݿø?

# Scatter plot matrix
# 스캐터 챠드 확인
plot(f_2007_2[,-1])


# 주성분분석 PCA(Principal Component Analysis)
secu_prcomp <- prcomp(f_2007_2[,c(2:6)]) # 첫번째 회사명은 제외(2~6컬럼)
summary(secu_prcomp)

print(secu_prcomp)


# Scree Plot
plot(secu_prcomp, type="l",
     sub = "Scree Plot")

# Biplot
biplot(secu_prcomp, cex = c(0.7, 0.8))



# 관측치별 주성분1, 주성분2 점수 계산(PC1 score, PC2 score)
secu_pc1 <- predict(secu_prcomp)[,1]
secu_pc2 <- predict(secu_prcomp)[,2]


# 그래프상에 관측치별 이름 매핑(rownames mapping)
text(secu_pc1, secu_pc2, labels = f_2007_2$company,
     cex = 0.7, pos = 3, col = "blue")











###########################################################
## PCA (Principal Component Analysis)
## User Defined Function
##  - finding PC k which Cummulative Proportion is over 0.8
###########################################################

pca <- function(dataset)  {
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

# pca 펑션을 정의해서, 각 데이터별 XY의 거리 데이터를 보여줌.
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

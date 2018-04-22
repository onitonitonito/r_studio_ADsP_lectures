
# -------------------------------------------------------------
# bostonc <- read.table(
#     "http://lib.stat.cmu.edu/datasets/boston_corrected.txt",
#     header=TRUE, sep=",", stringsAsFactors=FALSE,
#     na.strings=c('NIL'), comment.char="#", encoding="UTF-8")
# -------------------------------------------------------------

getwd()
setwd('~/Github/r_studio_ADsP_lectures')
boston <-read.csv("./_static/bostonc_new.csv", header = TRUE, sep = "," )

head(boston); tail(boston)
summary(boston)

# ________함수정의 _______________
show_phist <- function(y, x1, x2, data1)  {
  par(mfrow=c(2,2))

  plot( y ~ x1)
  hist(x1)
  #  m1 <- lm(y ~ x1 , data = data1)
  #  abline(m1$coefficients)


  plot( y ~ x2)
  hist(x2)
  #  m2 <- lm(y ~ x2 , data = data1)
  #  abline(m2$coefficients)

  par(mfrow=c(1,1))
}

y <- boston$MEDV
x1 <- boston$INDUS
x2 <- boston$CRIM

show_phist(log(y), log(x1), log(x2), boston)

plot(boston)

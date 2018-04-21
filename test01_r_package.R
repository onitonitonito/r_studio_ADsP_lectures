# ls()
# length(ls())
# ls(pattern = "_")
WORK_DIR = "~/Github/r_studio_ADsP_lectures/_static"


```{r}
  getwd()
  setwd(WORK_DIR)
  r_package <- read.csv("01_popular_R_package_2018.csv")

  summary(r_package)
  plot(r_package)
```


par(mfrow=c(1,1))
x <- r_package$X
y <- r_package$downloads
plot(x, y)

m1 = lm()

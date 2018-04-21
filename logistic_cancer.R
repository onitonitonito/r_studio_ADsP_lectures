getwd()
rm(list=ls())


library(boot)
data("nodal")

colnames(nodal)
head(nodal)
summary(nodal)

plot(nodal)

x <- c(110,120,130,140,150)
y <- c(100,105,128,115,142)
plot(y~x, pch=20, col="red")

line = lm(y~x)
line

# Call:
#   lm(formula = y ~ x)
#
# Coefficients:
#   (Intercept)            x
# -4.20         0.94
#
# y = -4.20 + 0.94x

abline(line, col="blue")


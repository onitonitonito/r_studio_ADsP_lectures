a <- 42
A <- a * 2        # R is case sensitive

print(a)          # print function is limited in many way, so use cat()
cat(A, "\n")      # "84" is concatenated with "\n"

if(A > a)         # true, 84 > 42
  {
    cat(A, ">", a, "\n")
  }
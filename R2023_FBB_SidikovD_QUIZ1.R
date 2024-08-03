set.seed(123)
x <- rnorm(10, mean=0, sd = 1)
y <- x[x>0]
sum(y)
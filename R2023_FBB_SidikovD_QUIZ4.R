library("tidyverse")


PosNa <- function(c,w) {
  return(sum(which(is.na(c)&is.na(w))))
}

q <- c(1,3,4,NA,1,3)
w <- c(1,2,3,NA,4,5)
PosNa(q,w)

msleep %>%
  summarise(count = PosNa(sleep_rem,
                          brainwt))

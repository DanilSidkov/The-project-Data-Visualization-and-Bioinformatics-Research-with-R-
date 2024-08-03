library("tidyverse")

generate_poisson_sample <- function(n, lambda) {
  sample <- rpois(n, lambda)
  
  ggplot(data.frame(sample), aes(sample)) +
    geom_histogram(binwidth = 1, fill = "steelblue", color = "white") +
    labs(title = paste("Histogram of a sample of size", n, "from a poisson distribution with lambda",lambda),
         x = "Value",
         y = "Frequency") +
    theme(plot.background = element_blank(),
                  panel.background = element_rect(fill = "transparent", colour = "gray"),
                  panel.grid.major = element_line(colour = "grey"),
                  plot.title = element_text(size = 15),
                  axis.text = element_text(size = 10, 
                                           face = "bold")
    )
}
set_seed(123)
generate_poisson_sample(100,5)

set_seed(123)
sample_sizes <- seq(10, 1000, length.out = 5)

lambdas <- c(2, 4, 6, 8, 10)

generate_and_plot <- function(n, lambda) {
  sample <- rpois(n, lambda)
  
  plot <- ggplot(data.frame(x = sample), aes(x)) +
    geom_histogram(binwidth = 1, fill = "steelblue", color = "white") +
    labs(title = paste("Sample from poisson ditribution (n =", n, ", lambda =", lambda, ")"),
         x = "Value", y = "Frequency")
  
  ggsave(filename = paste("histogram_n", n, "_lambda", lambda, ".png", sep = ""),
         plot = plot, width = 6, height = 4, dpi = 300)
  
  plot
}

plots <- map2(sample_sizes, lambdas, generate_and_plot)

#plots if you want see on UI delete # TOTEM_FISH)#

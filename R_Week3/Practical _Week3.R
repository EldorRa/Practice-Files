prob <- pnorm(1.96, mean = 0, sd = 1)
prob
pnorm(0)
1 - pnorm(1)
pnorm(1) - pnorm(-1)

prob_tall <- 1 - pnorm(185, mean = 170, sd = 10)
prob_tall

prob_small <- pnorm(160, mean = 170, sd = 10)
prob_small

pnorm(180, mean = 170, sd = 10) - pnorm(160, mean = 170, sd = 10)

set.seed(123)
data <- rnorm(1000, mean = 5, sd = 2)
sample_mean <- mean(data)
sample_sd <- sd(data)
list(mean = sample_mean, sd = sample_sd)

set.seed(123)
data <- rnorm(1000, mean = 10, sd = 3)
sample_mean <- mean(data)
sample_sd <- sd(data)
list(mean = sample_mean, sd = sample_sd)

prob_six_heads <- dbinom(6, size = 10, prob = 0.5)
prob_six_heads

prob_six_heads <- dbinom(520, size = 1000, prob = 0.5)
prob_six_heads

set.seed(123)
x <- rbinom(n = 500, size = 37, prob = 0.3)
result <- data.frame(x = x)
mu <- n*p 
sigma <- sqrt(n * p * (1-p))



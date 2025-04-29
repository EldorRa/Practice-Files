library(tidyverse)
library(ggplot2)

install.packages('tinytex')
tinytex::install_tinytex()

health <- read.csv("C:/Users/PcShop2024/Desktop/health.csv")

glimpse(health)
summary(health)

health %>%
  select(fitness_score_before, weight_loss, cholesterol_before, cholesterol_after, reaction_time_before, reaction_time_after) %>%
  gather() %>%
  ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free") +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  theme_minimal()

health %>%
  select(fitness_score_before, weight_loss, cholesterol_before, cholesterol_after, reaction_time_before, reaction_time_after) %>%
  gather() %>%
  ggplot(aes(x = key, y = value)) +
  geom_boxplot(fill = "lightgreen") +
  coord_flip() +
  theme_minimal()

ggplot(health, aes(x = fitness_score_before, y = fitness_score_after)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Fitness Score Before vs After") +
  theme_minimal()

ggplot(health, aes(x = reaction_time_before, y = reaction_time_after)) +
  geom_point(color = "purple") +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Reaction Time Before vs After") +
  theme_minimal()

shapiro.test(health$fitness_score_before)
t.test(health$fitness_score_before, mu = 50)

shapiro.test(health$weight_loss)
t.test(health$weight_loss, mu = 5)

shapiro.test(health$fitness_score_after - health$fitness_score_before)
t.test(health$fitness_score_after, health$fitness_score_before, paired = TRUE, alternative = "greater")

health$cholesterol_change <- health$cholesterol_after - health$cholesterol_before
shapiro.test(health$cholesterol_change)
t.test(health$cholesterol_change, mu = 0)

ggplot(health, aes(x = gender, y = reaction_time_before)) +
  geom_boxplot() +
  theme_minimal()
t.test(reaction_time_before ~ gender, data = health)

t.test(health$reaction_time_before[health$gender == "Male"], mu = 275)
t.test(health$reaction_time_before[health$gender == "Female"], mu = 275)

health$reaction_time_change <- health$reaction_time_before - health$reaction_time_after

ggplot(health, aes(x = gender, y = reaction_time_change)) +
  geom_boxplot() +
  theme_minimal()
t.test(reaction_time_change ~ gender, data = health)

t.test(health$reaction_time_before, health$reaction_time_after, paired = TRUE, alternative = "greater")

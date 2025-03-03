install.packages("dplyr")
install.packages("tidyr")
install.packages("ggplot2")
library (dplyr)
library (tidyr)
library (ggplot2)

mean(mtcars$mpg[mtcars$cyl == 4])

mtcars %>%
  filter(cyl == 4)

mtcars %>% 
  group_by(cyl) %>%
  summarise(mean_hp=mean(hp))

mtcars %>% 
  filter (mpg>25)

mtcars %>% 
  filter(cyl > 6)
mtcars %>% 
  filter(hp > 150)

install.packages("babynames")
library(babynames)
glimpse(babynames)

# select
select(babynames, name)
select(babynames, name, sex)
select(babynames, name | year)
select(babynames, !prop)
select(babynames, -c(year, sex, prop))
select(babynames, name:n)
select(babynames, starts_with("n"))
# filter
filter(babynames, name == "Khaleesi")
filter(babynames, name == "Sea" | name == "Anemone")
filter(babynames, prop > 0.08)
filter(babynames, year == 1880, (n == 5 | n == 6))
filter(babynames, name %in% c("Acura", "Lexus", "Yugo"))
# arrange
arrange(babynames, n)
arrange(babynames, n, prop)
arrange(babynames, year, desc(prop))
arrange(babynames, desc(year), desc(prop))

# pipe %>%
babynames %>%
  filter(year == 2017, sex == "M") %>%
  select(name, n) %>%
  arrange(desc(n))
# summarise
babynames %>%
  filter(name == "Thomas", sex == "M") %>%
  summarise(total = sum(n), max = max(n), mean = mean(n))
babynames %>%
  filter(name == "Khaleesi") %>%
  summarise(year = first(year))
babynames %>%
  summarise(n = n(), distinct = n_distinct(name))
# group_by
babynames %>%
  group_by(year, sex) %>%
  summarise(total = sum(n)) %>%
  summarise(total = sum(total))
babynames %>%
  group_by(year, sex) %>%
  ungroup()
babynames %>%
  group_by(year, sex) %>%
  group_by(name)
babynames %>%
  group_by(name, sex) %>%
  summarise(total = sum(n)) %>%
  arrange(desc(total))
# mutate
babynames %>%
  mutate(births = n / prop)
babynames %>%
  group_by(year) %>%
  mutate(year_total = sum(n)) %>%
  ungroup() %>%
  mutate(fraction = n / year_total) %>%
  group_by(name) %>%
  slice_max(fraction, n = 1)

babynames %>% 
    arrange(desc(prop))
    arrange(year)
table4a
    
table4a_long <- table4a %>%
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")
table4a_long
table4a_long %>%
  pivot_wider(values_from = cases, names_from = year)

data <- dat %>% 
  pivot_longer(c("oat_bran_free","oat_bran"), names_to = "oat", values_to = "cases")

data

ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar() +
  labs(title = "Bar Plot of Cylinder Counts",
       x = "Number of Cylinders",
       y = "Count")

# barplot
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
diamonds
ggplot(data = pressure) +
  geom_col(mapping = aes(x = temperature, y = pressure))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
ggplot(data = diamonds) +geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color)) +
  facet_grid(clarity ~ cut)
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color)) +
  facet_grid(~cut)
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color)) +
  facet_grid(clarity ~ .)
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color, fill = cut)) +
  facet_wrap(~cut, scales = "free_y")
# histogram
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat))
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), bins = 10)
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), bins = 10, boundary = 0)

# boxplot
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = class, y = hwy))
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = class, y = hwy)) +
  coord_flip()
# scatter plot + fitted line
p <- mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty), mean_hwy = mean(hwy)) %>%
  ggplot(aes(x = mean_cty, y = mean_hwy)) +
  geom_point()
p
p1 <- p +
  geom_smooth()
p1
p2 <- p +
  geom_smooth(method = lm)
p2
library(patchwork)
p + p1
p1 / p2
p / (p1 + p2)




      
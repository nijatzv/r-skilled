# 'forcats' paketi

library(tidyverse) # library(forcats)

data <- dplyr::starwars

data %>% glimpse()

data$eye_color <- data$eye_color %>% as.factor()

data$eye_color %>% levels()


#  fct_count() funksiyasi ----

 data %>% 
  count(eye_color, sort = T )

data$eye_color %>% 
  fct_count(sort = TRUE)


#  fct_unique() funksiyasi ----

data$eye_color %>% unique()

data$eye_color %>% fct_unique()


#  fct_reorder() funksiyasi ----

df <- tibble::tribble(
  ~reng,      ~a, ~b,
  'goy',       1,  2,
  'yasil',     6,  2,
  'benovseyi', 3,  3,
  'qirmizi',   2,  3,
  'sari',      5,  1
)

df$color <- df$reng %>% as.factor()
df$color %>% fct_reorder()


#  fct_explicit_na() funksiyasi ----

f1 <- factor(c(1, 1, NA, NA, 2, 2, NA, 2, 1, 2, 2))
f2 <- f1 %>% fct_explicit_na(na_level = 'bos')


#  fct_drop() funksiyasi ----

f3 <- factor(c('aa', 'bb'), c('aa', 'bb', 'cc'))
f4 <- f3 %>% fct_drop()


#  fct_collapse() funksiyasi ----

data$eye_color %>% 
  fct_collapse(qarisiq = c('blue-gray', 'red, blue', "green, yellow"))


#  fct_other() funksiyasi ----

data$eye_color %>% 
  fct_other(keep = c('blue', 'brown', 'black'), other_level = 'basqa')

data$eye_color %>% 
  fct_other(drop = c('blue-gray', 'red, blue', "green, yellow"), other_level = 'basqa') %>% 
  # fct_count(sort = TRUE)


#  fct_recode() funksiyasi ----

df$reng %>% fct_recode(r1 = 'goy', r2 = 'yasil', r3 = 'sari',
                       r4 = 'qirmizi', r5 = 'benovseyi')

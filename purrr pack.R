# 'purr' pack

library(tidyverse) # library(purrr)


 # map() funksiyasindan istifade ederek for looplarinin aradan qaldirilmasi ----

# map() funksiyasi
kvadrat <- function(v){
  return(v*v)
}
vektor_1 <- c(2,3,4,5)
vektor_1 %>% map(kvadrat)


1:10 %>% 
  map(rnorm, n = 10) ; help("rnorm")

1:10 %>% 
  map(rnorm, n = 10) %>% 
  map_dbl(mean)


# map2() funksiyasi
ustu <- function(x,y){
  return(x*y)
}

x <- c(2,4,6,8)
y <- c(3,5,7,9)

map2(x, y, ustu)


# pmap() funksiyasi 
mtcars_sub <- mtcars[1:4, c('mpg', 'cyl', 'disp')]
mtcars_sub %>% pmap(sum) # her setrdeki deyerlerin cemi


# walk funksiyasi

mtcars_sub %>% walk(print)
mtcars_sub %>% walk(glimpse) # her sutunun ayrica print ve glimpse-ni verdi


 # Listlerin umumilesdirilmesi ----

list_2 <- list('dplyr', 3, 'tibble', 9, 'purrr')

list_2 %>% every(is.character) # if all values are char - F

list_2 %>% some(is.character) # if some values are char - T

list_2 %>% has_element(3) # is there the element 3 - T


 # cross_df() funksiyasi ----

df <- list(id = c(101, 102, 103, 104),
           ad = c('Abdullah', 'Arif', 'Adil', 'Aqil'),
           yas = c(19, 21, 23, 25))

df %>% cross_df() # dataframe-e cevirdi


 # rerun() funksiyasi ----

rerun(2, sample(6)) # nece defe run edeceyimizi bildirir
rerun(3, sample(3))

map(1:3, ~ sample(3)) # new version

rerun(2, x = runif(1), y = runif(3)) # runif() - 0 ve 1 arasinda random deyer verir
map(1:2, ~ list(x = runif(1), y = runif(3)))


 # reduce() funksiyasi ----

reduce(c(12,23,34,45,56,67,78,89,90), `+`)


 # accumulate() funksiyasi ----

accumulate(c(1,2,3,5), sum) # mentiqi ardicilliq quraraq: '1, 1+2, 1+2+3, 1+2+3+5' ; help(accumulate)

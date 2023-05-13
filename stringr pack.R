# 'stringr' pack

library(tidyverse) # library(stringr)


 # str_c() funksiyasi ----

x <- c('salam', 'eziz', 'izleyiciler', 'dostlar')

x %>% paste(collapse = ' ')

x %>% str_c(collapse = ' ')


 # str_length() funksiyasi ----

x %>% str_length()

'meselen' %>% str_length()


 # str_count() funksiyasi ----

y <- x %>% str_c(collapse = ' ')

y %>% regmatches(gregexpr('a', y)) %>% lengths() # base pack

y %>% str_count('a')


 # str_sub() funksiyasi ----

y %>% substr(1,3)

y %>% substr(nchar(y) - 3 + 1, nchar(y))

y %>% str_sub(-3, -1)


 # str_replace_all() funksiyasi ----

y %>% str_replace_all(' ', '_')

y %>% str_replace_all(" ", '')


 # str_detect() funksiyasi ----

x %>% str_detect('a')

x[x %>% str_detect('a')]


 # str_extract() funksiyasi ----

x %>% str_extract('la')


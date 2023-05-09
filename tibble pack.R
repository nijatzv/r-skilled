# "tibble" package

library(tidyverse)  #library(tibble)


# tibble'a giris ----
starwars <- dplyr::starwars

starwars_df <- starwars %>% as.data.frame()

starwars %>%  glimpse()

# tibble yaratmaq ----

tibble(
  ad = c('Luke Skywalker', 'C-3P0', 'R2-D2'),
  boy = c(172, 167, 96),
  ceki = c(77.0, 75.0, 32.0)
)

tibble_row(
  a = 'model1',
  b = 'model2'
)

tribble(
  ~ad,               ~boy,   ~ceki,
  'Luke Skywalker',   172,    77.0,
  'C-3P0',            167,    75.0,
  'R2-D2',            96,     32.0
)

starwars_df %>% 
  as_tibble() %>% 
  class()

# tibble manipulyasiyasi ----

starwars %>% 
  slice(1:3) %>% 
  add_row(
    name = 'Nijat',
    height = 170,
    mass = 60.0,
    skin_color = 'ag',
    eye_color = 'qehveyi',
    sex = 'kisi',
    gender = 'kisi',
    homeworld = 'Earth'
  )
  
starwars %>% 
  add_column(id = 1:nrow(.), .before = 'name')   # = starwars %>% nrow(), 1:nrow(starwars) 

# Setir adlari ile islemek (Working with string names) ----

starwars %>% 
  select(name, height, mass) %>% 
  column_to_rownames(var = 'name') %>% 
  head()

starwars %>% 
  select(name, height,mass) %>% 
  remove_rownames() %>% 
  head()

starwars %>% 
  select(name, height, mass) %>% 
  column_to_rownames(var = 'name') %>%
  rownames_to_column(var = 'name') %>% 
  head()

starwars %>% 
  select(name, height,mass) %>% 
  rowid_to_column(var = 'id') %>% 
  head()













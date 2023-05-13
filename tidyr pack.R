# 'tidyr' paketi

library(tidyverse) # library(tidyr)

df <- data.frame(
  S.No = 1:10,
  qrup.1 = c(12,23,34,45,56, 67,78, 89, 90, 1),
  qrup.2 = c(123,234,345,456,567,678,789,980,901, 12),
  qrup.3 = c(1234,2345,3456,4567,5678,6789,7890,8901,9012, 123))


# gather() funksiyasi ----

df %>% 
  gather(key = qrup, value = deyer)

df %>% 
  gather(key = qrup, value = deyer,
         qrup.1:qrup.3)

gather_df <- df %>% 
  gather(key = qrup, value = deyer,
         qrup.1:qrup.3)


# seperate() funksiyasi ----

separate_df <- gather_df %>% 
  separate(qrup, c('hisse', 'nomre')
           )

separate_df <- gather_df %>% 
  separate(qrup, c('hisse', 'nomre'), sep = "\\."
           )

separate_df


# unite() funksiyasi ----

unite_df <- separate_df %>% 
  unite(qrup, hisse, nomre, 
        sep = '.')   # unite(name after unite, columns to unite, columns to unite, unite with the symbol)

unite_df


# spread() funksiyasi ----

evvelki_hal <- unite_df %>% 
  spread(qrup, deyer)     # unite(data, col, ..., sep = "_", remove = TRUE, na.rm = FALSE)


# pivot_longer() funksiyasi ----

# = gather() function

relig_income

relig_income %>% 
  pivot_longer(!religion, names_to = 'gelir', values_to = 'say')

relig_income %>% 
  gather(gelir, say,
               -religion)


# pivot_wider() funksiyasi ----

# = spread() function

fish_encounters

fish_encounters %>% 
  pivot_wider(names_from = station, values_from = seen)

fish_encounters %>% 
  spread(station, seen)


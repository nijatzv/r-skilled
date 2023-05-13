# 10. Tapşırıq

library(tidyverse)

# 1. "data <- tidyr::billboard" kodunu icra et. Yalnız "wk" ilə başlayan sütunları "key" sütununa topla. ----

data <- tidyr::billboard

task_1_data0 <- data %>%
  gather(key, value, starts_with("wk"))

task_1_data1 <- data %>% 
  pivot_longer(cols = starts_with('wk'), names_to = 'key',
               values_to = 'value')


# 2. "date.entered" sütununu "il", "ay", "gün" sütunlarına parçala. "sep" arqumentini də istifadə elə. ----

task_2_data <- data %>% 
  separate(date.entered, c('il', 'ay', 'gun'), sep = '\\-')


# 3."data <- tidyr::fish_encounters" kodunu icra et. "station" qruplarına görə "seen" dəyişənini cəmlə ----
# və yeni sütunun adı "cəm" olsun. "station" dəyişənindəki dəyərləri sütunlara yay.

data_fish <- tidyr::fish_encounters

data_fish_cem <- data_fish %>%
  group_by(station) %>%
  summarise(cem = sum(seen))

data_fish_cem_grouped <- data_fish_cem %>% 
  pivot_wider(names_from = station, values_from = cem)



# 11. Tapşırıq

library(tidyverse)

# 1. "sözlər <- stringr::words; cümlələr <- stringr::sentences" kodunu icra et. "sözlər"dəki sözləri vergüllə birbirinə yapışdır. ----

sozler <- stringr::words ; cumleler <- stringr::sentences

sozler_c <- sozler %>% str_c(collapse = ',')

 # 2. "cümlələr"də max character olan cümlənin characterlərinin sayını göstər. ----

cumleler %>% str_length() %>% max()

# 3. "cümlələr"də max characteri olan cümləni göstər. ----

cumleler[cumleler %>% str_length() %>% max()]

# 4. "sözlər"də neçə sözün ilk hərfi "a"dır. ----

sozler %>%
  str_starts("a") %>%
  sum()

# 5. "cümlələr"də bütün boşluqları "-" işarəsi ilə əvəzlə. ----

cumleler_c <- cumleler %>% str_c(collapse = ';')
cumleler_c %>% str_replace_all(' ', '-')

# 6. "sözlər"də tərkibində "at" olan sözləri göstər. ----

sozler[sozler %>% str_detect('at')]

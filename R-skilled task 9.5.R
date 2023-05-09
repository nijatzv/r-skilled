# 9. Tapşırıq

# 1. dslabs paketindən gapminder datasını "data" adıyla daxil et. datanın tipini göstər. ----

library(tidyverse)
library(dslabs)

data <- dslabs::gapminder
data %>% 
  class()

# 2. datanı tibble formatına çevir. ----

data_tbl <- as_tibble(data)
class(data_tbl)

# 3. "infant_mortality" sütununu "population" sütununa böl və "nisbət" adında yeni sütun yarat. ----
# Bu hesablamanı "tibble" paketinin funksiyası vasitəsi ilə həll et.

data_tbl <- data_tbl %>% add_column(nisbet = data$infant_mortality / data$population)
data_tbl %>% head()

# 4. "id" sütunu yarat və bu sütunu sətir adına çevir. ----

data_tbl %>% 
  add_column(id = 1:nrow(.), .before = 'country') %>% 
  column_to_rownames(var = 'id') %>% 
  head()

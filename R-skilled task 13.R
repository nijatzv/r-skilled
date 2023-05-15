13. Tapşırıq

library(tidyverse)

# 1. "data <- dplyr::storms" kodunu icra et. ----
# "lat", "long", "wind", "pressure", "ts_diameter", "hu_diameter" dəyişənlərinin ortamalarını tap.
# Qeyd: Bunun üçün "ortalama" adında funksiya yarat və "purrr" paketinin funksiyalarından istifadə et.

data <- dplyr::storms

ortalama <- function(numbers) {
  mean_value <- mean(numbers)
  return(mean_value)
}

ortalama(data$lat); ortalama(data$long); ortalama(data$wind); ortalama(data$pressure); 
ortalama(data$tropicalstorm_force_diameter); ortalama(data$hurricane_force_diameter);


# 2. 1ci tapşırığı funksiya yaratmadan birbaşa "purrr" paketinin. funksiyalarından istifadə edərək həll et. ----
# YAZA BILMEDIM
ortalama_deyerler <- ortalama_sub %>%
  select(lat, long, wind, pressure, tropicalstorm_force_diameter, hurricane_force_diameter) %>%
  transpose() %>%
  map_dbl(~ sum(1:6, na.rm = F) / length(.x))

print(ortalama_deyerler)

# 3. "nisbət" adında funksiya yarat. Hesablanması: hərbir dəyər max dəyərə bölünsün. ----
# Bunu "lat", "long", "wind", "pressure" dəyişənlərinə tətbiq elə. Nəticəni tibble data formatında göstər.
# Qeyd: "purrr" paketinin funksiyalarından istifadə et. 
# 1ci tapşırıqda istifadə edilən funksiyadan fərqli funksiya olsa daha yaxşı olar.

help("across")

nisbet2 <- function(ortalama_sub) {
  ortalama_sub %>%
    select(lat, long, wind, pressure) %>%
    map_df(~ . / max(., na.rm = TRUE))
}

result <- nisbet(storms)
print(result)

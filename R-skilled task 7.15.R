# 1. stars datasını dslabs paketindən R'a daxil et. Adı "data" olsun.----
library(dplyr)
library(dslabs)
data <- stars

# 2. datadakı dəyişənlərin tipini göstər.----

str(data)

# 3. datanın təkrarlanmayan sətirlərinin sayını göstər.----

data %>% 
  distinct() %>% 
  nrow()

# 4. datada "type" sütunu "M" olan minimum "magnitude" u tap. ----

data %>%
  filter(type == "M") %>%
  summarise(min_mag = min(magnitude))

# 5. datada hər bir "type"ın ortalama "temp" və "magnitude" ı göstər.

data %>% 
  group_by(type) %>% 
  summarise(mean(temp), 
            mean(magnitude))

data %>%
  group_by(type) %>%
  summarise(orta_temp = mean(temp),
            orta_magn = mean(magnitude))
  
# 6. 5ci tapşırığın davamında "type" sütununu azalan sıra ilə düz. ----

data %>%
  group_by(type) %>%
  summarise(orta_temp = mean(temp),
            orta_magn = mean(magnitude)) %>% 
  arrange(desc(type))

# 7. "type" dəyişəninin hərbir dəyərinin "data"dakı ümumi sayını artan sıra ilə göstər. ----

data %>%
  count(type, sort = T)

# 8. datadan 2 data əmələ gətirmək lazımdır. 1ci data "min" adında: ----
# "data"da hər bir "type"ın minimum "temp" və "magnitude" ı göstər,
# "type" in adını "sol" ilə dəyiş. Ilk 8 sətri saxla. 2ci data "max" adında: 
# "data"da hər bir "type"ın maximum "temp" və "magnitude" ı göstər, "type" in adını "sağ" ilə dəyiş. 
# Son 8 sətri saxla. Sonra bu 2 datanı inner, full, left, right üsulları ilə join elə.

min <- data %>% 
  group_by(type) %>%
  summarise(min_temp = min(temp), min_mag = min(magnitude)) %>%
  rename(sol = type) %>%
  slice(1:8)

max <- data %>% 
  group_by(type) %>% 
  summarise(max_temp = max(temp), max_mag = max(magnitude)) %>% 
  rename(sag= type) %>% 
  slice_tail(n = 8) 

inner_join(min, max, by = c("sol" = "sag"))
full_join(min, max, by = c("sol" = "sag"))
left_join(min, max, by = c("sol" = "sag"))
right_join(min, max, by = c("sol" = "sag"))

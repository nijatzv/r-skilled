# 'dplyr' paketi

library(tidyverse)

data <- dslabs::gapminder


# %>% (ctrl + shift + m) - pipe operatoru  ----

dim(data) # setir ve sutun sayi
head(data ,6) # default olaraq ilk 6 setiri
tail(data) # default olaraq son 6 setiri
summary(data) # datadaki variable'larin qisa statistik gostericileri
glimpse(data) # variablelarin strukturu
names(data) # variable'larin adlari

data %>% dim()

View(head(data, 19), 'ilk 19')
data %>% head(19) %>% View('ilk 19')

c(rep(paste0(seq(round(abs(sum(-3.14, -6))),5),'a'),3),"!")

-3.14 %>% 
  sum(-6) %>% 
  abs() %>% 
  round() %>% 
  seq(5) %>% 
  paste0('a') %>% 
  rep(3) %>% 
  c('!')



# arrange funksiyasi   # sira ile duzur  ----

data %>% 
  arrange(life_expectancy) %>% 
  head()

data %>% 
  arrange(desc(life_expectancy)) %>% 
  head()

data %>% 
  arrange(continent) %>% 
  head()

data %>% 
  arrange(desc(continent)) %>% 
  head()  

data %>% 
  arrange(continent,
          desc(life_expectancy)) %>% View()
  head()


print(data)

 
# rename funksiyasi   # sutun adini deyisir  ----

data %>% 
  rename(olke = country,
         il = year) %>% 
  head()
  
data_2 <- data%>% 
  rename(olke = country,
         il = year) %>% 
  head()

 # sutun adini deyisir
# select funksiyasi   # secilecek sutunu bildirir  ----

data %>% 
  select(country, year) %>% 
  head()

data %>% 
  select(country, year) %>% 
  head()

data %>% 
  select(-country, -year) %>% # bu sutunlari gormeyeceyik
  head()

data %>% 
  select(country:population) %>% 
  head()

data %>% 
  select(1:6) %>% 
  head()

data %>% 
  select(!country:population) %>% 
  head()

data %>% 
  select(region, population, everything()) %>% 
  head()

data %>% 
  select(region, population, everything(), -country) %>% 
  head()

data %>% 
  select(contains("_")) %>% 
  head()

data %>% 
  select(starts_with('co')) %>% 
  head()

data %>% 
  select(ends_with('ty')) %>% 
  head()

data %>% 
  select(olke = country, il = year) %>% 
  head()


# relocate funksiyasi   # sutun siralamasini deyisir  ----

data %>% 
  relocate(country, .after = year) %>% 
  head()

data %>% 
  relocate(country, .after = last_col()) %>%  # son sutuna yerlesdirmek
  head()

data %>% 
  relocate(country, .after = last_col(offset = 1)) %>% 
  head()

data %>% 
  relocate(ends_with('ty'), .before = country) %>% 
  head()


# filter funksiyasi   # setirleri mueyyen verilene gore filterleyir  ----

data %>% 
  filter(year>2009)

data %>% 
  filter(continent == 'Europe')

data %>% 
  filter(year>2009,
         continent == 'Europe') %>% 
  select(life_expectancy, gdp)


data %>% 
  filter(year %in% c(2001, 2005, 2009, 2013),
         !continent %in% c('Europe', 'Asia'))


# pull funksiyasi   # sutunu vektor olaraq verir  ----

data %>% 
  filter(life_expectancy == 80) %>% 
  select(country)

data %>% 
  filter(life_expectancy == 80) %>% 
  pull(country)



# slice funksiyasi    # dilimlere ayirir ve ya istediyimiz dilimi verir  ----

data %>% 
  slice(1)

data %>% 
  slice(3:5)

data %>% 
  slice_sample(n = 5)

data %>% 
  slice_head(n = 7)

data %>% 
  slice_tail(prop = 0.01) %>% 
  nrow()
nrow(data)* 0.01


data %>% 
  slice_max(life_expectancy, n = 5) # en boyuk life_expectancy ya sahib 5 setiri ver

data %>% 
  slice_min(life_expectancy, n = 5)


# distinct funksiyasi   # setirleri klonlarindan temizleyir  ----

data %>% 
  nrow()

data %>% 
  distinct() %>% 
  nrow()

data %>% 
  select(continent, region) %>% 
  distinct()

data %>% 
  select(country) %>% 
  distinct() %>% 
  pull()


# mutate funksiyasi   # yeni sutun yaradir  ----

data %>% 
  mutate(yeni_sutun = life_expectancy/100) %>% 
  head()

data %>% 
  mutate(life_expectancy = round(life_expectancy / 100 ,2)) %>% 
  head()

data %>% 
  mutate(yeni_sutun = round(life_expectancy/100, 2),
         yeni_sutun2 = paste0(country, '_', continent, '_', region)) %>% 
  select(contains('yeni'))
  head()

print(data)


# group_by funksiyasi   # setirleri bir ve ya bir nece sutuna gore qruplayir  ----

data %>% 
  group_by(continent) %>% 
  slice(1)

data %>% 
  group_by(continent, region) %>% 
  slice(1)
 

# summarise funksiyasi    # ozet statistikasini verir  ----

data %>% 
  summarise(max(life_expectancy))

data %>% 
  summarise(max(life_expectancy),
            mean(life_expectancy),
            min(life_expectancy))

data %>% 
  summarise(max = max(life_expectancy) %>% round(1),
            ortalama = mean(life_expectancy)%>% round(1),
            min = min(life_expectancy)%>% round(1))


data %>% 
  group_by(country) %>% 
  summarise(max(life_expectancy))


data %>% 
  group_by(country) %>% 
  summarise(max(life_expectancy),
            mean(life_expectancy),
            min(life_expectancy))

data %>% 
  group_by(country) %>% 
  summarise(max_life_ex = max(life_expectancy)) %>% 
  arrange(desc(max_life_ex))

data %>% 
  group_by(continent, region) %>% 
  summarise(max_life_ex = max(life_expectancy)) %>%
  arrange(continent,
          desc(max_life_ex))

data %>% 
  summarise(sum_gdp = sum(gdp, na.rm = T),   # na.rm - N/A remove demekdir. default olaraq na.rm = F olur
            mean_gdp = mean(gdp, na.rm = T),
            med_gdp = median(gdp, na.rm = T))


# count() ve n() funksiyalari   #   ----

data %>% 
  count(continent, sort = T)

data %>% 
  group_by(continent) %>% 
  summarise(n = n())

data %>% 
  count(continent, region, sort = T)

data %>% 
  group_by(continent,region) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))


# join funksiyasi ----

band_members
band_instruments
band_instruments2


band_members %>% 
  inner_join(band_instruments,
             by = 'name')

band_members %>% 
  left_join(band_instruments,
            by = 'name')

band_members %>% 
  right_join(band_instruments,
             by = 'name')

band_members %>% 
  full_join(band_instruments,
            by = 'name')

band_members %>% 
  left_join(band_instruments2,
            by = c('name' = 'artist'))

band_members %>% 
  left_join(band_instruments2,
            by = c('name' = 'artist'),
            keep = T)  # adi ferqli olsa bele onu run etdikde saxlayir

 
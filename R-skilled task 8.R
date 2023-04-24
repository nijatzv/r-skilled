# 1. stars datasını dslabs paketindən R'a daxil et. Adı "data" olsun. datanın təkrarlanmayan sətirlərinin sayını göstər.----
# Qeyd: "dplyr" paketinin funksiyalarından istifadə etmə. Yəni R'ın öz funksiyasını istifadə et.

library(dslabs)
data <- stars
sum(!duplicated(data))

# 2. datada "type" sütunu "M" olan minimum "magnitude" u tap. ----
# Qeyd: "dplyr" paketinin funksiyalarından istifadə etmə. Yəni R'ın öz funksiyasını istifadə et.

m_data <- subset(data, type == "M")
min(m_data$magnitude)

# 3. datada hər bir "type"ın ortalama "temp" və "magnitude" ı göstər. ----
# Qeyd: "dplyr" paketinin funksiyalarından istifadə etmə. Yəni R'ın öz funksiyasını istifadə et.

aggregate(cbind(temp, magnitude) ~ type, data, mean)
?aggregate()

# 4. 3cü tapşırığın davamında "type" sütununu azalan sıra ilə düz. ----
# Qeyd: "dplyr" paketinin funksiyalarından istifadə etmə. Yəni R'ın öz funksiyasını istifadə et.

# -

# 5. datadan 2 data əmələ gətirmək lazımdır. 1ci data "min" adında: "data"da hər bir "type"ın minimum "temp" və "magnitude" ı göstər, "type" in adını "sol" ilə dəyiş. 2ci data "max" adında: "data"da hər bir "type"ın maximum "temp" və "magnitude" ı göstər, "type" in adını "sağ" ilə dəyiş. Sonra bu 2 datanı inner, full, left, right üsulları ilə join elə.----
# Qeyd: "dplyr" paketinin funksiyalarından istifadə etmə. Yəni R'ın öz funksiyasını istifadə et.
# Qeyd: "min" və "max" datalarını əmələ gətirmək üçün "dplyr" istifadə oluna bilər.

min_data <- data %>% 
  group_by(type) %>% 
  summarise(sol = min(temp), magnitude = min(magnitude))

max_data <- data %>% 
  group_by(type) %>% 
  summarise(sağ = max(temp), magnitude = max(magnitude))

inner_join(min_data, max_data, by = "type")
full_join(min_data, max_data, by = "type")
left_join(min_data, max_data, by = "type")
right_join(min_data, max_data, by = "type")
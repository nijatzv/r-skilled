
# 1. "data" adında 'data.frame" yarat. 1ci sütun "a" adında 1a, 2b, 3c, 4d, 5e, 6f dəyərlərindən ibarət olsun. 2ci sütun "b" adında hə və yox dəyərlərinin 3 dəfə təkrarından ibarət olsun. 3cü sütun "c" adında 2dən 19a qədər olan ədədlərin 3 dənədən bir sıralanmasından ibarət olsun. ----

data <- data.frame(
  a = c('1a', '2b', '3c', '4d', '5e', '6f'),
  b = rep(c('he', 'yox'), 3),
  c = seq(2,19,3)
)



# 2. "data"da "d" sütunu yarat. Bu sütun "a" və "b" sütunlarının " - " ilə birləşməsindən ibarət olsun. # Bu tapşırığı 2 üsulla həll edin. İkisindən biri loop ilə yazılsın. ----

data$d <- paste(data$a,  " - ", data$b)

data <- subset(data, select = -d)

for (i in 1:nrow(data)) {
  data$d[i] <- paste(data$a[i], " - ", data$b[i])
}



# 3. "data"da "e" sütunu yarat. Bu sütun "c" sütununun kvatratı olsun. Bu tapşırığı 2 üsulla həll edin. İkisindən biri loop ilə yazılsın. ----

data$e <- data$c^2

data <- subset(data, select = -e)

for (k in 1:nrow(data)) {
  data$e[k] <- data$c[k]^2
}



# 4. "data"da "f" sütunu yaradın. Bu sütunun məntiqi: "c" sütunun 2 misli "e" sütununun yarısından böyükdürsə "böyük", böyük deyilsə "kiçik", bərabərdirsə "bərabər" dəyərləri yazılsın. ----

data$f <- ifelse(data$c * 2 > data$e / 2, "böyük", ifelse(data$c * 2 < data$e / 2, "kiçik", "bərabər"))
help(ifelse)



# 5. 4cü tapşırığı yerinə yetirən bir funksiya yaradın. Funksiyanın adı "funksiyam" olsun. "funksiyam" vasitəsi ilə "data"da "F" sütununu yaradın. ----

funksiyam <- function(data) {
  data$F <- ifelse(data$c * 2 > data$e / 2, "böyük", ifelse(data$c * 2 < data$e / 2, "kiçik", "bərabər"))
  return(data)
}

data <- funksiyam(data)

data$f == data$F

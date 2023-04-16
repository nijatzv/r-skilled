# 1. Dəyərləri 1a, 2b, 3c, 4d olan bir vektor yarat. "vektor" ilə adlandır. ----

vektor <- c('1a', '2b', '3c', '4d')

#   2. "vektor" un tipinə bax. ----

class(vektor) # character

#   3. 1 ilə 1000 arasında yerləşən tək ədədləri (1 və 1000 daxil) "tək_ədədlər" ilə adlandır. ----

tek_ededler <- seq(1,100,2)
tek_ededler
 
#   4. "tək_ədədlər_4" vektorunu yaradın. Dəyərləri "tək_ədədlər" vektorunun 4 dəfə təkrarı olsun. ----

tek_ededler_4 = rep(tek_ededler, 4)
tek_ededler_4


#   5. "tək_ədədlər" vektorunun cüt indekslərində yerləşən ədədləri göstər. ----

tek_ededler[seq(2,51,2)]

#   6. 1 ilə 1000 arasında yerləşən (1 və 1000 daxil) tək ədədlər ilə cüt ədədləri ----
#   sütun şəklində birləşdir. Nəticəni "data" ilə adlandır.
#   7. "data" ı data.frame formatına çevir.

tek_ededler_mtrx = matrix(tek_ededler)
cut_ededler_mtrx = matrix(seq(2,100,2))
matrix <- cbind(tek_ededler_mtrx, cut_ededler_mtrx)
data = as.data.frame(matrix)

basqa_cur_helli_data = as.data.frame(cbind(matrix(tek_ededler), matrix(seq(2,100,2))))
# tapsiriq hellinde telesdim biraz, istediyiniz 'data'ni 'matrix'le qeyd etmisem


#   8. "data" nın tək indeksli sətirlərini və bütün sütunlarını göstər. ----

data[seq(1,50,2),1:2] ; data[seq(1,50,2),]

#   9. "datalar" adında list yarat. Bu listin içində daha öncə yaradılan "vektor", ----
#  tək_ədədlər", "tək_ədədlər_4", "data" dataları olsun.

datalar <- list(vektor, tek_ededler, tek_ededler_4, data)
datalar

  
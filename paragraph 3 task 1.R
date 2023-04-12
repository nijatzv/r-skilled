# Tapşırıqlar
# 1. 1 ilə 10 arasında yerləşən tək rəqəmlərin cəmini (1 və 10 daxil) "Cəm" ilə adlandır
# 2. "Cəm" ilə adlandırılan dəyərin data tipini göstər.
# 3. "Cəm" dəyərin data tipini göstər.
# 4. "Cəm" ilə adlandırılan dəyərin data tipini "integer" etmək mümkündürmü? Deyilsə səbəbi? Mümkündürsə kodu yaz.
# 5. "Cəm" 1 ilə 10 arasındakı cüt ədədlərin cəmindən böyükdürmü? 

cem = 1+2+3+4+5+6+7+8+9+10

class(1+2+3+4+5+6+7+8+9+10) #numeric

class(cem) # 8ci setir run edildikden sonra numeric edilmediyi halda error gelecek

integer_deyer <- as.integer(cem)
class(integer_deyer)

cut_cem = 2+4+6+10
cem > cut_cem

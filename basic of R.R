# R'ın təməlləri

# Data tipleri ----

class(7)
class(3.14) # numeric

typeof(7)
typeof(3.14) # double

class(7L) # integer
class(3.14L) # numeric

class('salam dunya') # character

class(TRUE)  # logical
class(FALSE) # logical

class(2i + 1) # complex






# R proqramlasdirma operatorlari ----

# Hesab operatorlari

# +
5+5

# -
5-5

# *
5*5

# /
5/5

# ^
5^5

# Logical operatorlar (neticelerinde cavab ya TRUE ya FALSE olmalidir)

# '==' beraberdir
# '=!' berber deyil
# '<' ; '>' ; '<=' ; '>='
# '&' and operatorunda butun sertler odenmelidir
# '|' or operatoru
# '!' not operatoru

# | - 'or'
2|2

# & - and
2&2

# ==
5 == 2+3

# !=
5!=4
5!=5

# > ve <
(3>7) | (3!=7)
(3>7) & (3!=7)

# TRUE ve FALSE
TRUE | FALSE
FALSE | FALSE
F|T
T&T




# Teyinat (assignment) operatoru ----


hesab = 5+5
hesab

hesab_2 <- 5 + 6
hesab_2


2+10 -> hesab_3
hesab_3

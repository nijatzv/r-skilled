# R'da proqramlasdirma esaslari

# while dongesi ----

sert <- 'sert dogru olduqda'
icra <- 'sert dogru oldugu muddetde kodu icra et'

while(sert){icra}

while(2>1){
  print('stop')
}


z <- 1
while(z<12){
  print(z)
  z <- z+1
}


# for dongesi ----

saygac <- 'saygac'
deyerler <- 'deyerler'
icra <- 'saygaci HER BIR DEYER UCUN icra et'

for(saygac in deyerler){icra}

for(i in 1:10){
  print(i)
}

vektor <- c(2,3,5,7,11,13)
for (gezen in c(3, 5)){
  print(vektor[gezen])
}


for (r in 1:5){
  for (d in c('a', 'b', 'c', 'd', 'e')){
    print(paste(r, d))
  }
}


vektor <- c()
for (r in 1:5){
  for (d in c('a', 'b', 'c', 'd', 'e')) {
    out <- paste(r,d)
    vektor <- c(vektor, out)
  }
}
vektor


df <- data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)


median(df[['a']])
median(df[['b']])
median(df[['c']])
median(df[['d']])

colnames <- names(df)

for (i in colnames){
  print(i)
  print(median(df[[i]]))
}



#if funksiyasi ----

sert <- 'sert dogru olduqda'
icra <- 'sert dogrudursa kodu icra et'
icra_2 <- 'sert dogru deyilse kodu icra et'

if(sert){icra}
if (sert) {icra} else {icra_2}

x <- 7
if (x >= 9){
  print('x 9dan boyukdur ve ya 9a beraberdir')
}


x<-7
if (x>=9){
  print('x 9dan boyukdur ve ya 9a beraberdir')
} else if (x>5){
  print('x 5den boyukdur, ancaq 9dan kicikdir')
} else {
    print('x tden kicikdir')
}


for (r in 1:nrow(df)) {
  if (df[[1]][r] > 0){
    print(r)
    print(paste0(r, ' - row'))
    print(df[[1]][r])
  }
}




for (c in 1:ncol(df)) {
  for (r in 1:nrow(df)){
    if (df[[c]][r] > 0){
      print(paste(c, '- sutun'))
      print(paste(c, '- setir'))
      print(df[[c]][r])
    }
  }
}


df$D <- ifelse(df$d > 0, '+', '-')
df$D <- ifelse(df$d > 0, '+', ifelse(df$d == 0, '0', '-'))



# funksiya yaratmaq ----

ortalama <- function(x) {
  s <- sum(x)
  n <- length(x)
  return(s/n)
}

ortalama(1:100)

formals(ortalama)
body(ortalama)

ortalama <- function(y, hesab = TRUE){
  n <-length(y)
  return(ifelse(hesab, sum(y)/n, sum(y)+7777))
}

y <- 1:100
ortalama(y, hesab = T)
ortalama(y, hesab = F)



f01 <- function(x){
  if (x<10) {
    return(0)
  } else {
    return(10)
  }
}


f01(5)
f01(15)


f02 <- function(input) {
  if (!is.numeric(input)) {
    stop('input numeric vektor olmalidir')
  }
  hesab <- ((input-25)* 0.75) + 25
  return(hesab)
  }

f02(51)
f02('elli bir')


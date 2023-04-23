# Paket

# Rstudioda istenilen funksiyanin senedine baxmaq ----

c()
seq()
rep()
cbind()
rbind()
as.data.frame()
print()
ifelse()
help(ifelse)
?rbind
# f1 + select the function


# Paket nedir ve nece yuklenir ----


base::abs(-3) # funksiya
base::pi # deyer


install.packages("dslabs")
library(dslabs) # aktiv olundu. shut down sonrasi yeniden etmek lazimdi

dslabs::movielens # cedvel - data
data <- dslabs::movielens





# 'tidyverse' paketi haqqinda ----

install.packages('tidyverse') # CRAN  
remotes::install_guthub('tidyverse/tidyverse') # guthub

library(tidyverse)

?'dplyr-package'
?'tibble-package'
?'tidyr-package'
?'stringr-package'
?'forcasr-package'
?'ggplot2-package'
?'purrr-package'

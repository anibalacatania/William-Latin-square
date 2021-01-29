library(tidyr)
library(plyr)
library(tidyverse)
library(crossdes)

library(readxl)

library(readxl)
vinos<- read_excel("bloque3.xlsx", range = "d1:d7")



g2<-as.vector(vinos$dia4)
g2


n=6 # escribir aca el numero de copas


df
set.seed(710)
s1 <- sample(g2, n, replace=F)
s1
set.seed(173)
s2 <- sample(g2, n, replace=F)
s2
set.seed(569)
s3 <- sample(g2, n, replace=F)
s3
set.seed(291)
s4 <- sample(g2, n, replace=F)
s4
dam <- williams(n)
dam2 = mapvalues(dam, c(1:n),s1)
dam3 = mapvalues(dam, c(1:n),s2)
dam4 = mapvalues(dam, c(1:n),s3)
dam5 = mapvalues(dam, c(1:n),s4)

rep1<-rbind(dam2,dam3,dam4,dam5)
rep1
rep1<-t(rep1)
rep1<-as.data.frame(rep1)
copas <- rownames(rep1)
rep1<-cbind(copas,rep1)





rep1<-gather(rep1, panelista, copas)


rep1<-rep1 %>%
  group_by(copas) %>%
  mutate(id = sample(100:999, 1, replace = FALSE))


write.table(rep1,"/home/anibal/Mis documentos/INTA/SENSORIAL/PANEL/2019/Espumantes argentinos/diseño experimental/dia4bloque3.csv",row.names = FALSE)


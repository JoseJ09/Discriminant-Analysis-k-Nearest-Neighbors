insurance<-c(2,3,3,2,4,4,6,5,6,6,
           7,6,5,5,7,8,7,8,8,7)
accounts<-c(2,2,3,3,3,5,6,5,
           7,6,7,8,6,3,9,9,5,9,2,2)
virtual<-c(3,3,4,4,3,4,5,5,6,6,
             5,5,6,3,7,7,6,8,8,7)
credits<-c(3,3,3,4,3,3,5,5,5,6,
           5,5,5,4,7,7,5,8,7,8)
tipo<-c("a"," a" ,"a" ,"a" ,"a" ,"b" ,"b" ,"b", "b" ,"b" ,"b" ,"b" ,"b" ,"b" ,"c" ,"c" ,"c" ,"c" ,"c" ,"c")
datos<-matrix(c(insurance,accounts,virtual,credits),ncol=4)
colnames(datos)<-c("insurance","accounts","virtual","credits")
datos
library(MASS)
datos.lda<-lda(datos,tipo)
datos.lda
datos.lda$scaling
plot(datos.lda)
clasif<-predict(datos.lda)$class
clasif
errorrate<- 1-sum(clasif==tipo)/ 20
errorrate

tipo<-c("a"," a" ,"a" ,"b" ,"b" ,"b" ,"b" ,"b", "b" ,"b" ,"c" ,"c" ,"c" ,"c" ,"c" ,"d" ,"d" ,"d" ,"d" ,"d")

#CRUZADA
clasif.cv<-lda(datos,tipo,CV=T)$class
clasif.cv
errorratecv<- 1-sum(clasif.cv==tipo)/20
errorratecv

#K VECINOS MÁS PROXIMOS 
library(class)
datos.k2<-knn(datos,datos,tipo,3)
datos.k2
errorratek2<- 1-sum(datos.k2==tipo)/20
errorratek2

#MÉTODO DE LOS K VECINOS MÁS PRÓXIMOS. VALIDACIÓN CRUZADA
datos.k2vc<-knn.cv(datos,tipo,3)
datos.k2vc
errorrate.k2vc <- 1-sum(datos.k2vc==tipo)/20
errorrate.k2vc


##Forma de sacar la media de los datos en el archivo .txt 
# Comentarios en R
# header es si ignora o no la cabecera, sep es la separacion de los datos, dec es si es con coma o punto el divisor decimal
# dim, length, typeof, class, nrow, ncol, object.size, names, head, tail, summary, srt (es estructura)
##------------------------------------------------------Quieto------------------------------------------------------##
Quieto<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\Quieto.txt", header=TRUE, sep="\t" ,dec=".")
gyroX<-mean(Quieto[,1])
gyroY<-mean(Quieto[,2])
gyroZ<-mean(Quieto[,3])
options(digits = 16)
gyroXm  = -0.3663079603195932
gyroYm  = -2.792600399015178
gyroZm  = -0.2282962348845037
gyroX <- gyroX + gyroXm
gyroY <- gyroY + gyroYm
gyroZ <- gyroZ + gyroZm
#Display the data
gyroX
gyroY
gyroZ
library(writexl)
##-------------------------------1.) Separacion de datos en tipos de inclinacion.------------------------------------
#_______Archivos para inclinacion derecha izquierda (Giro en X). Derecha es negativo e Izquierda es positivo.
#_______El arduino va sobre el carro con el conector micro_usb mirando hacia al frente
rm(list = ls())
posi<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0)
nega<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0)
options(digits = 3)
#Nariz abajo 45 grados
GiroX_Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroX_Bajad.txt", header=TRUE, sep="\t" ,dec=".")

posi<-rbind(posi,GiroX_Temp[GiroX_Temp[,1]>=0,]) #Inclinacion a la Izquierda
nega<-rbind(nega,GiroX_Temp[GiroX_Temp[,1]<=0,]) #Inclinacion a la Derecha
# Plano en el plano XY
GiroX_Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroX_Plano.txt", header=TRUE, sep="\t" ,dec=".")
posi<-rbind(posi,GiroX_Temp[GiroX_Temp[,1]>=0,])
nega<-rbind(nega,GiroX_Temp[GiroX_Temp[,1]<=0,])
#Nariz arriba 45 grados
GiroX_Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroX_Subid.txt", header=TRUE, sep="\t" ,dec=".")
posi<-rbind(posi,GiroX_Temp[GiroX_Temp[,1]>=0,])
nega<-rbind(nega,GiroX_Temp[GiroX_Temp[,1]<=0,])
#Eliminando la primera fila de datos que es nula y se uso solo para fines de iniciacion del objeto.
posi<-posi[2:dim(posi)[1],]
nega<-nega[2:dim(nega)[1],]

write.table(x=posi, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Left_.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write_xlsx(posi, "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_xlsx\\Left_.xlsx")
write.table(x=nega, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Dere_.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write_xlsx(nega, "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_xlsx\\Dere_.xlsx")
rm(list = ls())

#_______Archivos para inclinacion adelante atras (Giro en Y). Atras es negativo e Adelante es positivo.

posi<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0)
nega<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0)
options(digits = 3)
#Nariz abajo 45 grados
GiroX_Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroY_Dere.txt", header=TRUE, sep="\t" ,dec=".")
posi<-rbind(posi,GiroX_Temp[GiroX_Temp[,2]>=0,]) #Inclinacion hacia adelante
nega<-rbind(nega,GiroX_Temp[GiroX_Temp[,2]<=0,]) #Inclinacion hacia atras
# Plano en el plano XY
GiroX_Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroY_Plano.txt", header=TRUE, sep="\t" ,dec=".")
posi<-rbind(posi,GiroX_Temp[GiroX_Temp[,2]>=0,])
nega<-rbind(nega,GiroX_Temp[GiroX_Temp[,2]<=0,])
#Nariz arriba 45 grados
GiroX_Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroY_Izqui.txt", header=TRUE, sep="\t" ,dec=".")
posi<-rbind(posi,GiroX_Temp[GiroX_Temp[,2]>=0,])
nega<-rbind(nega,GiroX_Temp[GiroX_Temp[,2]<=0,])
#Eliminando la primera fila de datos que es nula y se uso solo para fines de iniciacion del objeto.
posi<-posi[2:dim(posi)[1],]
nega<-nega[2:dim(nega)[1],]

write.table(x=posi, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Adela_.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write_xlsx(posi,         "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_xlsx\\Adela_.xlsx")
write.table(x=nega, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Atras_.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write_xlsx(nega,         "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_xlsx\\Atras_.xlsx")
rm(list = ls())

## 2.) Caracteristicas Y Etiquetado
Izqui<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Left_.txt", header=TRUE, sep="\t" ,dec=".")
Derec<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Dere_.txt",  header=TRUE, sep="\t" ,dec=".")
Adela<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Adela_.txt",  header=TRUE, sep="\t" ,dec=".")
Atras<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Atras_.txt",  header=TRUE, sep="\t" ,dec=".")
Estab<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\Quieto.txt",  header=TRUE, sep="\t" ,dec=".")

x<-c(dim(Izqui)[1],dim(Derec)[1],dim(Adela)[1],dim(Atras)[1],dim(Estab)[1])
min(x)
# Ya sabiendo el mino corto por lo sano tomo venbanas de a 100 y saco las caracteristicas y las etiqueto.

##--------------------------------2.) Etiquetado y caracterizado de los datos---------------------------------------
# 153 datos de cada caracteristica debido a que estoy tomando ventanas de 100 datos
# Tomo la primera ventana agrupo los datos, y saco la caracteristica por fila, luego hago un datafram de eso.
# Hay que iniciar el dataframe antes con una fila de ceros que al final borro.
# Inicialize el vector de caracteristicas para evitar fallas en el codigo.
# Finalmente todo se escribe en un .txt

Ventana=100  # Numero de datos por ventan
num_dat=trunc(min(x)/Ventana)
#_____________________________________________________Derecha_______________________________________________________
valor_div=750
Car_Temp<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0,"Class"=0)
Temp_<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Dere_.txt",  header=TRUE, sep="\t" ,dec=".")

for (k in 1:num_dat){
  Carac<- mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),1])/valor_div         # Caracteriso por MEDIA
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),2])/valor_div)
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),3])/valor_div)
  
  z<-data.frame("GiroX"=Carac[1],"GiroY"=Carac[2],"GiroZ"=Carac[3], "Class"=0)
  Car_Temp<-rbind(Car_Temp,z)
}
Car_Temp<-Car_Temp[2:num_dat,]
write.table(x=Car_Temp, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Derec.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write_xlsx(Car_Temp,         "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_xlsx\\Carac_Derec.xlsx")
#_____________________________________________________Izquierda_____________________________________________________

Car_Temp<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0,"Class"=1)
Temp_<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Left_.txt",  header=TRUE, sep="\t" ,dec=".")

for (k in 1:num_dat){
  Carac<- mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),1])/valor_div         # Caracteriso por MEDIA
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),2])/valor_div)
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),3])/valor_div)
  
  z<-data.frame("GiroX"=Carac[1],"GiroY"=Carac[2],"GiroZ"=Carac[3], "Class"=1)
  Car_Temp<-rbind(Car_Temp,z)
}
Car_Temp<-Car_Temp[2:num_dat,]
write.table(x=Car_Temp, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Left.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write_xlsx(Car_Temp,         "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_xlsx\\Carac_Left.xlsx")
#_____________________________________________________Delante_______________________________________________________
Car_Temp<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0,"Class"=2)
Temp_<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Adela_.txt",  header=TRUE, sep="\t" ,dec=".")

for (k in 1:num_dat){
  Carac<- mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),1])/valor_div         # Caracteriso por MEDIA
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),2])/valor_div)
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),3])/valor_div)
  
  z<-data.frame("GiroX"=Carac[1],"GiroY"=Carac[2],"GiroZ"=Carac[3], "Class"=2)
  Car_Temp<-rbind(Car_Temp,z)
}
Car_Temp<-Car_Temp[2:num_dat,]
write.table(x=Car_Temp, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Adela.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write_xlsx(Car_Temp,         "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_xlsx\\Carac_Adela.xlsx")
#_____________________________________________________Atras_________________________________________________________
Car_Temp<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0,"Class"=3)
Temp_<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Dataset\\Formato_txt\\Atras_.txt",  header=TRUE, sep="\t" ,dec=".")

for (k in 1:num_dat){
  Carac<- mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),1])/valor_div         # Caracteriso por MEDIA
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),2])/valor_div)
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),3])/valor_div)
  
  z<-data.frame("GiroX"=Carac[1],"GiroY"=Carac[2],"GiroZ"=Carac[3], "Class"=3)
  Car_Temp<-rbind(Car_Temp,z)
}
Car_Temp<-Car_Temp[2:num_dat,]
write.table(x=Car_Temp, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Atras.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write_xlsx(Car_Temp,         "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_xlsx\\Carac_Atras.xlsx")
#_____________________________________________________Quieto_________________________________________________________
Car_Temp<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0,"Class"=4)
Temp_<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\Quieto.txt",  header=TRUE, sep="\t" ,dec=".")
for (k in 1:num_dat){
  Carac<- mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),1])/valor_div         # Caracteriso por MEDIA
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),2])/valor_div)
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),3])/valor_div)
  
  z<-data.frame("GiroX"=Carac[1],"GiroY"=Carac[2],"GiroZ"=Carac[3], "Class"=4)
  Car_Temp<-rbind(Car_Temp,z)
}
Car_Temp<-Car_Temp[2:num_dat,]
write.table(x=Car_Temp, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Estable.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write_xlsx(Car_Temp,         "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_xlsx\\Carac_Estable.xlsx")
#################################################-Agrupar los datos-################################################
rm(list = ls())
Carac_cmplt<- data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0,"Class"=45)

Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Estable.txt", header=TRUE, sep="\t" ,dec=".")
Carac_cmplt<- rbind(Carac_cmplt,Temp)
Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Left.txt", header=TRUE, sep="\t" ,dec=".")
Carac_cmplt<- rbind(Carac_cmplt,Temp)
Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Derec.txt", header=TRUE, sep="\t" ,dec=".")
Carac_cmplt<- rbind(Carac_cmplt,Temp)
Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Atras.txt", header=TRUE, sep="\t" ,dec=".")
Carac_cmplt<- rbind(Carac_cmplt,Temp)
Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Adela.txt", header=TRUE, sep="\t" ,dec=".")
Carac_cmplt<- rbind(Carac_cmplt,Temp)

Carac_cmplt<- Carac_cmplt[2:dim(Carac_cmplt)[1],]

write.table(x=Carac_cmplt, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Completas.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write_xlsx(Carac_cmplt,         "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_xlsx\\Carac_Completas.xlsx")

rm(list = ls())
#_________________________________________________------- --- -----_______________________________________________
#_________________________________________________------- --- -----_______________________________________________
#Comprobacion de que el valor escogido par normalizar la cuestion fue bien escogido, el dato maximo tomado fue de 0.76 
Atras<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Atras.txt", header=TRUE, sep="\t" ,dec=".")
Adela<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Adela.txt", header=TRUE, sep="\t" ,dec=".")
Izqui<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Left.txt", header=TRUE, sep="\t" ,dec=".")
Derec<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Derec.txt", header=TRUE, sep="\t" ,dec=".")
Estab<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Estable.txt", header=TRUE, sep="\t" ,dec=".")
x <- c(max(Atras[,1]),max(Atras[,2]),max(Atras[,3]),max(Adela[,1]),max(Adela[,2]),max(Adela[,3]),max(Izqui[,1]),max(Izqui[,2]),max(Izqui[,3]),max(Derec[,1]),max(Derec[,2]),max(Derec[,3]),max(Estab[,1]),max(Estab[,2]),max(Estab[,3]))
max(x)
rm(list = ls())
#_________________________________________________Plotear ls datos_______________________________________________
#________install.packages("magrittr") # package installations are only needed the first time you use it

#________install.packages("Rcpp")
#________install.packages("dplyr")    # alternative installation of the %>%

#________install.packages("ggplot2")

library(ggplot2)
library(magrittr)
library(dplyr)


imu<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Procesados\\Caracteristicas\\Formato_txt\\Carac_Completas.txt", header=TRUE, sep="\t" ,dec=".")

ggplot(imu ,aes(GiroX, GiroY, col = Class)) + geom_point()
ggplot(imu ,aes(GiroX, GiroZ, col = Class)) + geom_point()
ggplot(imu ,aes(GiroY, GiroZ, col = Class)) + geom_point()

##Creando las cosas como el chaparrin quiere.

Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroX_Bajad.txt", header=TRUE, sep="\t" ,dec=".")
write_xlsx(Temp, "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\Formato_xlsx\\GiroX_Bajad.xlsx")
Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroX_Plano.txt", header=TRUE, sep="\t" ,dec=".")
write_xlsx(Temp, "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\Formato_xlsx\\GiroX_plano.xlsx")
Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroX_Subid.txt", header=TRUE, sep="\t" ,dec=".")
write_xlsx(Temp, "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\Formato_xlsx\\GiroX_Subid.xlsx")
Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroY_Dere.txt", header=TRUE, sep="\t" ,dec=".")
write_xlsx(Temp, "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\Formato_xlsx\\GiroY_Dere.xlsx")
Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroY_Plano.txt", header=TRUE, sep="\t" ,dec=".")
write_xlsx(Temp, "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\Formato_xlsx\\GiroY_Plano.xlsx")
Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\GiroY_Izqui.txt", header=TRUE, sep="\t" ,dec=".")
write_xlsx(Temp, "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\Formato_xlsx\\GiroY_Izqui.xlsx")
Temp<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\Quieto.txt",  header=TRUE, sep="\t" ,dec=".")
write_xlsx(Temp, "C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_Tomados\\Formato_xlsx\\Quieto.xlsx")

library(writexl)
#rjava, xlsxjars
library(xlsx)

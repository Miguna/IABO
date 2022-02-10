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

write.table(x=posi, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Left_.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write.table(x=nega, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Dere_.txt", sep="\t", row.names=FALSE, col.names=TRUE)
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

write.table(x=posi, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Adela_.txt", sep="\t", row.names=FALSE, col.names=TRUE)
write.table(x=nega, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Atras_.txt", sep="\t", row.names=FALSE, col.names=TRUE)
rm(list = ls())

## 2.) Caracteristicas Y Etiquetado
Izqui<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Left_.txt", header=TRUE, sep="\t" ,dec=".")
Derec<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Dere_.txt",  header=TRUE, sep="\t" ,dec=".")
Adela<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Adela_.txt",  header=TRUE, sep="\t" ,dec=".")
Atras<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Atras_.txt",  header=TRUE, sep="\t" ,dec=".")

x<-c(dim(Izqui)[1],dim(Derec)[1],dim(Adela)[1],dim(Atras)[1])
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
Car_Temp<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0,"Class"="Right")
Temp_<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Dere_.txt",  header=TRUE, sep="\t" ,dec=".")

for (k in 1:num_dat){
  Carac<- mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),1])         # Caracteriso por MEDIA
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),2]))
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),3]))
  
  z<-data.frame("GiroX"=Carac[1],"GiroY"=Carac[2],"GiroZ"=Carac[3], "Class"="Right")
  Car_Temp<-rbind(Car_Temp,z)
}
Car_Temp<-Car_Temp[2:num_dat,]
write.table(x=Car_Temp, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Carac_Derec.txt", sep="\t", row.names=FALSE, col.names=TRUE)
#_____________________________________________________Izquierda_____________________________________________________
Car_Temp<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0,"Class"="Left")
Temp_<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Left_.txt",  header=TRUE, sep="\t" ,dec=".")

for (k in 1:num_dat){
  Carac<- mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),1])         # Caracteriso por MEDIA
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),2]))
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),3]))
  
  z<-data.frame("GiroX"=Carac[1],"GiroY"=Carac[2],"GiroZ"=Carac[3], "Class"="Left")
  Car_Temp<-rbind(Car_Temp,z)
}
Car_Temp<-Car_Temp[2:num_dat,]
write.table(x=Car_Temp, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Carac_Left.txt", sep="\t", row.names=FALSE, col.names=TRUE)
#_____________________________________________________Delante_______________________________________________________
Car_Temp<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0,"Class"="Delante")
Temp_<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Adela_.txt",  header=TRUE, sep="\t" ,dec=".")

for (k in 1:num_dat){
  Carac<- mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),1])         # Caracteriso por MEDIA
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),2]))
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),3]))
  
  z<-data.frame("GiroX"=Carac[1],"GiroY"=Carac[2],"GiroZ"=Carac[3], "Class"="Delante")
  Car_Temp<-rbind(Car_Temp,z)
}
Car_Temp<-Car_Temp[2:num_dat,]
write.table(x=Car_Temp, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Carac_Adela.txt", sep="\t", row.names=FALSE, col.names=TRUE)

#_____________________________________________________Atras_________________________________________________________
Car_Temp<-data.frame("GiroX"=0,"GiroY"=0,"GiroZ"=0,"Class"="Atras")
Temp_<-read.table(file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Dataset\\Atras_.txt",  header=TRUE, sep="\t" ,dec=".")

for (k in 1:num_dat){
  Carac<- mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),1])         # Caracteriso por MEDIA
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),2]))
  Carac<-c(Carac,mean(Temp_[(Ventana*(k-1)+1):(k*Ventana),3]))
  
  z<-data.frame("GiroX"=Carac[1],"GiroY"=Carac[2],"GiroZ"=Carac[3], "Class"="Atras")
  Car_Temp<-rbind(Car_Temp,z)
}
Car_Temp<-Car_Temp[2:num_dat,]
write.table(x=Car_Temp, file="C:\\Users\\miang\\OneDrive\\Escritorio\\Lectrura_IMU\\Datos\\Datos_procesados_y_etiquetados\\Carac_Atras.txt", sep="\t", row.names=FALSE, col.names=TRUE)
# Plotear los datos
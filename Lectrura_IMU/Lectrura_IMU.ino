/*
 * 114 por 1 segundo 114Hz
 * 
 * X es el eje que pasa por el lado largo del arduino
 * Y es el eje perpendicular al eje X en el plano del arduino
 * Z es el eje de altura.
 * La rotacion en el plano XY se traduce como GyroZ
 * La rotacion en el plano XZ se traduce como GyroY
 * La rotacion en el plano YZ se traduce como GyroX
 * 
 * La IMU mide aceleracion no cambio en la aceleracion. No es como los Ser.Huma
 * Por eso hay que calibrar a cada rato el estado "Quieto"
 * 
 * Se va a tomar una ventana de tiempo de 100 muestras o 877[ms]
 * En total salen 104 ventanas.
 */

#include <Arduino_LSM9DS1.h>
#include <PDM.h>
/*
const float accelXm =  0.0; //  0.01013147054662569;
const float accelYm =  0.0; // -0.0479997145562;
const float accelZm =  0.0; //  1.038650481290453;
*/
const float gyroXm  = -0.3663079603195932;
const float gyroYm  = -2.992600399015178;
const float gyroZm  = -0.2282962348845037;
/*
const float magXm   =  32.7491983957062;
const float magYm   = -34.3279573968515;
const float magZm   = -73.7128457269199;

float accelX[4] = {0.0,0.0,0.0,0.0};
float accelY[4] = {0.0,0.0,0.0,0.0};
float accelZ[4] = {0.0,0.0,0.0,0.0};
float accelXF   = 0.0;
float accelYF   = 0.0;
float accelZF   = 0.0;
*/
float gyroX[14] = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
float gyroY[14] = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
float gyroZ[14] = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
float gyroXF    = 0.0;
float gyroYF    = 0.0;
float gyroZF    = 0.0;
/*
float magX = 0.0; 
float magY = 0.0; 
float magZ = 0.0;
*/

void setup(){
  Serial.begin(115200);
  while (!Serial) {}
  Serial.println("Started");
  
  if(!IMU.begin()){
    Serial.println("IMU init failed");
    while(1);
  }
/*
  Serial.print("Accelerometer sample rate = ");
  Serial.print(IMU.accelerationSampleRate());
  Serial.println(" Hz");
  Serial.println("Acceleration in G's");
*/
  Serial.print("Gyroscope sample rate = ");
  Serial.print(IMU.gyroscopeSampleRate());
  Serial.println(" Hz");
  Serial.println("Gyroscope in degrees/second");
  //AcelX\tAcelY\tAcelZ\t
  Serial.print(" ");
  Serial.println("GiroX\tGiroY\tGiroZ");
/*
  Serial.print("Magnetic field sample rate = ");
  Serial.print(IMU.magneticFieldSampleRate());
  Serial.println(" uT");
  Serial.println();
  Serial.println("Magnetic Field in uT");
  Serial.println("X\tY\tZ");
*/
}

void loop(){
  // Lectura de datos solo si estan disponibles
  /*while((!IMU.accelerationAvailable())){}
  IMU.readAcceleration(accelX[0], accelY[0], accelZ[0]);
  */
  while((!IMU.gyroscopeAvailable())){}
  IMU.readGyroscope(gyroX[0], gyroY[0], gyroZ[0]);
  /*
  while((!IMU.magneticFieldAvailable())){}
  IMU.readMagneticField(magX, magY, magZ);
  */
  // Se filtra
  /*
  accelXF=(accelX[0]+accelX[1]+accelX[2]+accelX[3])/4;
  accelYF=(accelY[0]+accelY[1]+accelY[2]+accelY[3])/4;
  accelZF=(accelZ[0]+accelZ[1]+accelZ[2]+accelZ[3])/4;
  */
  gyroXF=(gyroX[0]+gyroX[1]+gyroX[2]+gyroX[3]+gyroX[4]+gyroX[5]+gyroX[6]+gyroX[7]+gyroX[8]+gyroX[9]+gyroX[10]+gyroX[11]+gyroX[12]+gyroX[13])/14;
  gyroYF=(gyroY[0]+gyroY[1]+gyroY[2]+gyroY[3]+gyroY[4]+gyroY[5]+gyroY[6]+gyroY[7]+gyroY[8]+gyroY[9]+gyroY[10]+gyroY[11]+gyroY[12]+gyroY[13])/14;
  gyroZF=(gyroZ[0]+gyroZ[1]+gyroZ[2]+gyroZ[3]+gyroZ[4]+gyroZ[5]+gyroZ[6]+gyroZ[7]+gyroZ[8]+gyroZ[9]+gyroZ[10]+gyroZ[11]+gyroZ[12]+gyroZ[13])/14;
  // Se actualiza los vectores
  /*
  accelX[3]=accelX[2];accelX[2]=accelX[1];accelX[1]=accelX[0];
  accelY[3]=accelY[2];accelY[2]=accelY[1];accelY[1]=accelY[0];
  accelZ[3]=accelZ[2];accelZ[2]=accelZ[1];accelZ[1]=accelZ[0];
  */
  gyroX[13]=gyroX[12]; gyroX[12]=gyroX[11]; gyroX[11]=gyroX[10]; gyroX[10]=gyroX[9]; gyroX[9]=gyroX[8]; gyroX[8]=gyroX[7]; gyroX[7]=gyroX[6]; gyroX[6]=gyroX[5]; gyroX[5]=gyroX[4]; gyroX[4]=gyroX[3]; gyroX[3]=gyroX[2]; gyroX[2]=gyroX[1]; gyroX[1]=gyroX[0];
  gyroY[13]=gyroY[12]; gyroY[12]=gyroY[11]; gyroY[11]=gyroY[10]; gyroY[10]=gyroY[9]; gyroY[9]=gyroY[8]; gyroY[8]=gyroY[7]; gyroY[7]=gyroY[6]; gyroY[6]=gyroY[5]; gyroY[5]=gyroY[4]; gyroY[4]=gyroY[3]; gyroY[3]=gyroY[2]; gyroY[2]=gyroY[1]; gyroY[1]=gyroY[0];
  gyroZ[13]=gyroZ[12]; gyroZ[12]=gyroZ[11]; gyroZ[11]=gyroZ[10]; gyroZ[10]=gyroZ[9]; gyroZ[9]=gyroZ[8]; gyroZ[8]=gyroZ[7]; gyroZ[7]=gyroZ[6]; gyroZ[6]=gyroZ[5]; gyroZ[5]=gyroZ[4]; gyroZ[4]=gyroZ[3]; gyroZ[3]=gyroZ[2]; gyroZ[2]=gyroZ[1]; gyroZ[1]=gyroZ[0];
  // Se quita la media
/*
  accelXF -= accelXm;
  accelYF -= accelYm;
  accelZF -= accelZm;
*/
  gyroXF -= gyroXm;
  gyroYF -= gyroYm;
  gyroZF -= gyroZm;
  /*
  magX -= magXm;
  magY -= magYm;
  magZ -= magZm;
  */
  //Se imprimen
/*
  Serial.print(accelXF);
  Serial.print('\t');
  Serial.print(accelYF);
  Serial.print('\t');
  Serial.print(accelZF);
  Serial.print('\t');
*/
  Serial.print(gyroXF);
  Serial.print('\t');
  Serial.print(gyroYF);
  Serial.print('\t');
  Serial.println(gyroZF);
/*  
  Serial.print(',');
  Serial.print(magX);
  Serial.print(',');
  Serial.print(magY);
  Serial.print(',');
  Serial.println(magZ);
  */
  }

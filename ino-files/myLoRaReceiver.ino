#include <SPI.h>
#include <LoRa.h>



//#define ss 10
//#define rst 9
//#define dio0 2

#define ss 10 
#define rst 9 
#define dio0 2 

String LoRaData;

void setup() {
  Serial.begin(9600);
  while (!Serial);
  Serial.println("LoRa Receiver");
  LoRa.setPins(ss, rst, dio0);
  while (!LoRa.begin(866E6)){
    Serial.println(".");
    delay(500);  
  }
  Serial.println("tocheck");
//
//  if (!LoRa.begin(866E6)) {
//    Serial.println("Starting LoRa failed!");
//    while (1);
//  }
}

void loop() {

  int packetSize = LoRa.parsePacket();
  if (packetSize){
    Serial.println("Received packet ");

    while (LoRa.available()){
      LoRaData = LoRa.readString();
      Serial.println(LoRaData);
    }
    if (LoRaData.startsWith("Time")){
        Serial.println("Finished");
      }
     else {
         Serial.println("' with RSSI ");
         Serial.println(LoRa.packetRssi());
         LoRa.beginPacket();
         LoRa.print("received");
         Serial.println("sent acknowledgement");
         LoRa.endPacket(); 
  }

}
}

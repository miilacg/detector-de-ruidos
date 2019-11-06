
#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEServer.h>
#include "WiFi.h"

char* ssid = "testeesp2";
char* pass = "nuncanemvi1234";
bool conectado = false;
String senha = "";

// See the following for generating UUIDs:
// https://www.uuidgenerator.net/

#define SERVICE_UUID        "37f64eb3-c25f-449b-ba34-a5f5387fdb6d"
#define CHARACTERISTIC_UUID "00002a05-0000-1000-8000-00805f9b34fb"

class MyCallbacks: public BLECharacteristicCallbacks {
    void onWrite(BLECharacteristic *pCharacteristic) {
      std::string value = pCharacteristic->getValue();
//      Serial.print(value[0]);
      senha.concat(value[0]);
//      Serial.print(senha);
//      Serial.print(value[1]);
      senha.toCharArray(pass, senha.length());
    }
};

void setup() {
  BLEDevice::init("ESP32_CamilaPedro");
  
  BLEServer *pServer = BLEDevice::createServer();

  BLEService *pService = pServer->createService(SERVICE_UUID);

  BLECharacteristic *pCharacteristic = pService->createCharacteristic(
                                         CHARACTERISTIC_UUID,
                                         BLECharacteristic::PROPERTY_READ |
                                         BLECharacteristic::PROPERTY_WRITE
                                       );

  pCharacteristic->setCallbacks(new MyCallbacks());
  pCharacteristic->setValue("Hello World");
  pService->start();

  BLEAdvertising *pAdvertising = pServer->getAdvertising();
  pAdvertising->start();
  Serial.begin(115200);
}

void loop() {
  if (!conectado){
    WiFi.begin(ssid, pass);

    if (WiFi.status() != WL_CONNECTED) {
      Serial.println("Connecting to WiFi..");
    } else {
      conectado = true;
      Serial.println("Conected");
    }
  }
  delay(200);
  Serial.println(pass);
  Serial.println(senha);
  Serial.println("******************");
  
  
//    senha = ""; 
}

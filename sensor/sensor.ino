int buzzer_pin = 12;
int channel         = 0;
int frequence       = 2000;
int resolution      = 10;
int TOUTCH_PIN = 4;
 
int touch_value = 100;
 
void setup(){
  Serial.begin(115200);   
  delay(1000); // give me time to bring up serial monitor    
  ledcSetup(channel, frequence, resolution); //configuração de canal, frequencia e resolução
  ledcAttachPin(buzzer_pin, channel);   
}
 
void loop(){
  ledcWriteTone(channel, 2000);
  touch_value = touchRead(TOUTCH_PIN);   
  
  Serial.println(touch_value);  // get value using T0   
  if (touch_value > 50){   
    Serial.println(touch_value);    
    ledcWrite(channel, 50);
    delay(1000);
  }else{ 
    Serial.println(touch_value);
    ledcWriteTone(channel, 0);
  }
  delay(1000); 
}

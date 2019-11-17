int buzzer_pin = 12;
int channel         = 0;
int frequence       = 2000;
int resolution      = 10;
unsigned long timer = millis();
 
void setup() {
  Serial.begin(115200);
  //armazena os parametros do pulso
  ledcSetup(channel, frequence, resolution); //configuração de canal, frequencia e resolução
  ledcAttachPin(buzzer_pin, channel);  //atribui buzzer_pin ao canal 0 e controla o pulso
}
 
void loop(){  
  /*ledcWriteTone(channel, 2000);

  for (int dutyCycle = 0; dutyCycle <= 255; dutyCycle=dutyCycle+10){
    Serial.println(dutyCycle);  
    ledcWrite(channel, dutyCycle);
    delay(1000);
  }
  ledcWrite(channel, 125); 
  
  for (int freq = 255; freq < 10000; freq = freq + 250){
     Serial.println(freq);  
     ledcWriteTone(channel, freq);
     delay(1000);
  }*/
  int cap = touchRead(4);
  if (cap<50){
    ledcWriteTone(channel, 500);   //toca se encostar 
  }else{
    ledcWriteTone(channel, 0);    
  }
  Serial.println(cap);
  delay(500);
}

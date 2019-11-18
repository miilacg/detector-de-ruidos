//Definicao pino sensor
int pino_analogico = 36;
int buzzer_pin = 12;
int channel = 0;
int frequence = 2000;
int resolution = 10;

int valor_A0 = 0;

void setup(){  
  Serial.begin(1200);  
  //Define pinos sensor como entrada  
  pinMode(pino_analogico, INPUT);
  delay(1000); // give me time to bring up serial monitor    
  ledcSetup(channel, frequence, resolution); //configuração de canal, frequencia e resolução
  ledcAttachPin(buzzer_pin, channel); 
}

void loop(){
  
  valor_A0 = analogRead(pino_analogico);  
  Serial.print("Saida A0: ");  
  Serial.println(valor_A0);
  ledcWriteTone(channel, frequence);

  if (valor_A0 >= 1600 || valor_A0 <= 1000) {
     ledcWrite(channel, 400);
  } else {
    ledcWriteTone(channel, 0);
  }
  
}

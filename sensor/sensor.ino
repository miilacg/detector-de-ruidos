//Definicao pino sensor
int pino_analogico = 33;

int valor_A0 = 0;

void setup(){  
  Serial.begin(1200);  
  //Define pinos sensor como entrada  
  pinMode(pino_analogico, INPUT);  
}

void loop(){  
  valor_A0 = analogRead(pino_analogico);  
  Serial.print("Saida A0: ");  
  Serial.println(valor_A0);
}

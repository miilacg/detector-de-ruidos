//variaveis para calculo da media do valor permitido
long media = 0;
long ruido = 1000; //valor maximo permitido
long contador = 0;

//definicao pino sensor
int microfone = 33; //esse pino tava lendo algum valor, se não der é só mudar pro 36

//variaveis para o buzzer
int buzzer_pin = 12; //pino positivo do buzzer
int channel = 0;
int frequence = 2000;
int resolution = 10;

void setup() {
  Serial.begin(115200);
  pinMode(microfone, INPUT); //define o pino microfone como entrada

  //armazena os parametros do pulso
  ledcSetup(channel, frequence, resolution); //configuração de canal, frequencia e resolução
  ledcAttachPin(buzzer_pin, channel);  //atribui buzzer_pin ao canal 0 e controla o pulso
}

void loop() {
  //tratamento do que a variavel ruido vai receber do app precisa ser feita aqui
  sensor(); //chama a funcao sensor
}

void sensor(){
  for (int i = 0; i < 160; i++){//faz a media do ruido por um periodo
    contador = contador + analogRead(microfone)
  }
  
  media = contador/160;
  contador = 0;
  delay (10);

  Serial.print (media);
  Serial.println (ruido);

  if (media >= ruido){
    ledcWriteTone(channel, 500);//toca buzzer
  }
  delay(500);
}

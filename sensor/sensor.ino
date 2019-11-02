int porta = 25;
 
void setup() {
  Serial.begin(115200);
  delay(1000);  
}
 
void loop() {
  Serial.println(porta);
  int analog = analogRead(porta);    
  Serial.println(analog);
  delay(500);
}

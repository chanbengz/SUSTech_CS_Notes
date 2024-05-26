#define LED 13

volatile int interval = 1;

void setup() {
  // put your setup code here, to run once:
  pinMode(LED, OUTPUT);

  Serial.begin(9600);

}

void loop() {
  int input = 0;
  
  // put your main code here, to run repeatedly:
  if (Serial.available()){
    input = Serial.read();
    if (input == '1'){
      interval = constrain(interval+5, 1, 41);
    } else {
      interval = constrain(interval-5, 1, 41);
    }
  }
  
  digitalWrite(LED, HIGH);
  delay(1);
  digitalWrite(LED, LOW);
  delay(interval);
}

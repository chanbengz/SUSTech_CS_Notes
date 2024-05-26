void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Hello World!\n");
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available()){
    int inByte = Serial.read();
    Serial.print("Read: ");
    Serial.print(inByte);
    Serial.print(" Ox");
    Serial.println(inByte, HEX);
  }
}

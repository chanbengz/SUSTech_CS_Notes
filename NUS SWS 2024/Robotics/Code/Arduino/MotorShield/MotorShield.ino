#include <AFMotor.h>

void setup() {
  // put your setup code here, to run once:
  AF_DCMotor motor(4);  // The motor number, i.e. 1, 2, 3 or 4

  motor.setSpeed( 200 );
  
  motor.run( FORWARD );
  delay(1000);

  motor.run( BACKWARD );
  delay(1000);

  motor.run( RELEASE );
  delay(1000);
  
}

void loop() {
  // put your main code here, to run repeatedly:

}

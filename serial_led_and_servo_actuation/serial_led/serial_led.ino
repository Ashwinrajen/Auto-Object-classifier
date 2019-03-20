#include <Servo.h>
int value; 
int servoPin = 11;
Servo Servo1; 

void setup()
{
Serial.begin(9600);
pinMode(8, OUTPUT);
pinMode(9, OUTPUT);

if(Serial.available()>0)
  {
    value=Serial.read();

    if  (value == 1)           
    { 
   Servo1.attach(servoPin); 
   Servo1.write(90); 
   delay(1000);
   Servo1.write(180); 
   delay(1000);
   Servo1.write(90); 
   delay(1000); 
    }
    if(value == 2)         
    { 
   Servo1.attach(servoPin); 
   Servo1.write(90); 
   delay(1000);
   Servo1.write(0); 
   delay(1000);
   Servo1.write(90); 
   delay(1000); 
    }
  }
}

void loop()
{
  if(Serial.available()>0)
  {
    value=Serial.read();

    if  (value == 1)           
    { 
    digitalWrite(8, HIGH);
    digitalWrite(9, LOW);
    
    }
    if(value == 2)         
    { 
    digitalWrite(9, HIGH);
    digitalWrite(8, LOW);
    }
  }
}

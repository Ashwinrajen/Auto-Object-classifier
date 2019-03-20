const int pwm = 3 ;  
const int in_1 = 9 ;
const int in_2 = 10  ;
void setup()
{
pinMode(pwm,OUTPUT) ;   
pinMode(in_1,OUTPUT) ;  
pinMode(in_2,OUTPUT) ;
}

void loop()
{

digitalWrite(in_1,HIGH) ;
digitalWrite(in_2,LOW) ;
analogWrite(pwm,70) ;

delay(200) ;     

digitalWrite(in_1,HIGH) ;
digitalWrite(in_2,HIGH) ;
delay(1000) ;

 }

                  

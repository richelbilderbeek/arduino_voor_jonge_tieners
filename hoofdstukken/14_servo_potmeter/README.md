# Servo motor met potmeter

Sluit een potmeter aan. De middelste pin moet naar `A0`. Zie figuur 'Servo motor en potmeter'

![Servo motor en potmeter](3_servo_motor_met_potmeter.png)

\pagebreak

Gebruik deze code:

```c++
#include <Servo.h>

Servo mijn_servo;

void setup() 
{
  Serial.begin(9600);
  mijn_servo.attach(9);
  pinMode(A0, INPUT);
}

void loop()
{
  mijn_servo.write(
    map(analogRead(A0),0,1024,45,135)
  );
  delay(100);
}
```

![Computer](EmojiComputer.png)    | ![Smiley](EmojiSmiley.png)
:--------------------------------:|:----------------------------------------: 
`map(analogRead(A0),0,1024,45,135)` |'Lieve computer, lees de spanning van `A0`. Dit is een waarde van 0 tot 1024. Bouw de gelezen waarde om tussen 45 en 135.'.


## Eindopdracht

Stuur een servo motor perfect aan met een potmeter. 
Gebruik hiervoor de minimum en maximum waarde die je hebt gevonden bij jouw servo motor.



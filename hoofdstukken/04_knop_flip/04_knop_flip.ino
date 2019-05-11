const int pin_led_rood = 13;
const int pin_led_geel = 12;
const int pin_led_groen = 11;
const int pin_knop = 2;
int welke_led_aan = 1;

void setup() 
{
  pinMode(pin_led_rood, OUTPUT);
  pinMode(pin_led_geel, OUTPUT);
  pinMode(pin_led_groen, OUTPUT);
  pinMode(pin_knop, INPUT);
}

void loop()
{
  if (digitalRead(pin_knop) == HIGH)
  {
    welke_led_aan = welke_led_aan + 1;
    if (welke_led_aan == 4)
    {
      welke_led_aan = 1;
    }
    delay(200);
  }
  
  if (welke_led_aan == 1)
  {
    digitalWrite(pin_led_rood, HIGH);
    digitalWrite(pin_led_geel, LOW);
    digitalWrite(pin_led_groen, LOW);
  }
  if (welke_led_aan == 2)
  {
    digitalWrite(pin_led_rood, LOW);
    digitalWrite(pin_led_geel, HIGH);
    digitalWrite(pin_led_groen, LOW);
  }
  if (welke_led_aan == 3)
  {
    digitalWrite(pin_led_rood, LOW);
    digitalWrite(pin_led_geel, LOW);
    digitalWrite(pin_led_groen, HIGH);
  }
}

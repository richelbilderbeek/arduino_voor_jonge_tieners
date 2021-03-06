# Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano

In deze les gaan we een simpele piano maken, die 1 pin gebruikt en 7 parallelle weerstanden.

We bouwen de piano stap voor stap op en testen elke stap apart.

Het uitlezen van de knoppen hebben we al eerder gezien in lesboekje 2, bladzijde 16.
Het afspelen van een geluidje hebben we al eerder gezien in lesboekje 3, bladzijde 17.

![Piano](18_frequenties.png) | We beginnen met de middelste toets met frequentie 247. Dan bouwen we naar links 3 toetsen erbij. Daarna bouwen we rechts 3 toetsen erbij. De frequenties staan in dit plaatje,
:-------------:|:----------------------------------------: 

![In les 231763256 maken we een parallelle universa piano!](19_parallel-universes.jpg)

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Opdracht 1 aansluiten

Sluit de eerste knop aan volgens het plaatje. Zet de knop in het midden van je breadboard!

![Een pin](19_fig_1_bb.png)

![Bowtie](EmojiSunglasses.png) | De 'Pull Down' weerstand zorgt dat pin 2 verbonden is met GND als de knop niet ingedrukt is
:-------------:|:----------------------------------------: 

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Opdracht 1 code

Zet deze code op je Arduino:

```c++
const int speaker_pin = 8;
const int piano_pin = A0;

void setup()
{
  pinMode(speaker_pin, OUTPUT);
  pinMode(piano_pin, INPUT);
  Serial.begin(9600);
}

void loop()
{
  Serial.println(analogRead(piano_pin));
  if (analogRead(piano_pin) > 510)
  {
    tone(speaker_pin, 247);
    delay(250);
    noTone(speaker_pin);
    delay(250);
  }
}
```

![Sunglasses](EmojiSunglasses.png) | '>' betekent 'groter dan'. De waarde A0 is nooit precies een getal.In de seriële monitor lezen we het getal dat bij de knop hoort af en testen  dan op een getal dat daar net iets onder ligt.
:-------------:|:----------------------------------------: 

Krijg je een geluid als je op de knop drukt? Dan kun je door naar opdracht 2.

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Opdracht 2

Sluit een tweede knop aan **links** van de eerste, met twee weerstanden ervoor die parallel staan [dus 5k], zie plaatje.

![parallel](parallel.PNG) | Twee parallele weerstanden van 10k geeft een weerstand van 5k.
:-------------:|:----------------------------------------: 

![serie](serie.PNG) | Twee weerstanden van 10k in serie geeft een weerstand van 20k.
:-------------:|:----------------------------------------: 

![Een pin](19_fig_2_bb.png)


![denk](EmojiThinking.png) | Gebruik de seriële monitor om de waarde van de nieuwe knop te bepalen.
:-------------:|:----------------------------------------: 

![Sunglasses](EmojiSunglasses.png) | De nieuwe waarde is hoger dan de waarde van de andere knop. Het nieuwe if-statement moet bovenaan komen.
:-------------:|:----------------------------------------: 

![denk](EmojiThinking.png) | Welke frequentie krijgt de nieuwe knop?
:-------------:|:----------------------------------------: 

Gebruik deze code:

![denk](EmojiThinking.png) | Is het nodig om de hele code opnieuwe in te voeren?
:-------------:|:----------------------------------------: 




```c++
const int speaker_pin = 8;
const int piano_pin = A0;

void setup()
{
  pinMode(speaker_pin, OUTPUT);
  pinMode(piano_pin, INPUT);
  Serial.begin(9600);
}

void loop()
{
  const int sensorValue = analogRead(piano_pin);
  Serial.println(sensorValue);
  if (sensorValue > 680)
  {
    tone(speaker_pin, 220);
    delay(250);
    noTone(speaker_pin);
    delay(250);
  }
  else if (sensorValue > 510)
  {
    tone(speaker_pin, 247);
    delay(250);
    noTone(speaker_pin);
    delay(250);
  }
}
```

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Opdracht 3

Bouw nu een derde toets, links van de vorige. 

Gebruik nu 3 parallele weerstanden.

![denk](EmojiThinking.png) | Gebruik de seriële monitor om de waarde van de nieuwe knop te bepalen.
:-------------:|:----------------------------------------: 

![denk](EmojiThinking.png) | Welke frequentie krijgt de nieuwe knop?
:-------------:|:----------------------------------------: 

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Oplossing 3

![Een pin](19_fig_3_bb.png)

```c++
const int speaker_pin = 8;
const int piano_pin = A0;

void setup()
{
  pinMode(speaker_pin, OUTPUT);
  pinMode(piano_pin, INPUT);
  Serial.begin(9600);
}

void loop()
{
  const int sensorValue = analogRead(piano_pin);
  Serial.println(sensorValue);
  if (sensorValue > 820)
  {
    tone(speaker_pin, 196);
    delay(250);
    noTone(speaker_pin);
    delay(250);
  }
  else if (sensorValue > 680)
  {
    tone(speaker_pin, 220);
    delay(250);
    noTone(speaker_pin);
    delay(250);
  }
  else if (sensorValue > 510)
  {
    tone(speaker_pin, 247);
    delay(250);
    noTone(speaker_pin);
    delay(250);
  }
}
```

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Opdracht 4

Bouw nu een vierde toets, links van de vorige. 

Gebruik nu 4 parallele weerstanden.

![denk](EmojiThinking.png) | Gebruik de seriële monitor om de waarde van de nieuwe knop te bepalen.
:-------------:|:----------------------------------------: 

![denk](EmojiThinking.png) | Welke frequentie krijgt de nieuwe knop?
:-------------:|:----------------------------------------: 

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Oplossing 4

![Een pin](19_fig_4_bb.png)

```c++
const int speaker_pin = 8;
const int piano_pin = A0;

void setup()
{
  pinMode(speaker_pin, OUTPUT);
  pinMode(piano_pin, INPUT);
  Serial.begin(9600);
}

void loop()
{
  //... vorige code hier
  else if (sensorValue > 510)
  {
    tone(speaker_pin, 247);
    delay(250);
    noTone(speaker_pin);
    delay(250);
  }
}
```

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Opdracht 5

Bouw nu de 5e toets rechts van de vorige toetsen. Gebruik nu geen parallele weerstanden, maar 2 in serie geschakelde weerstanden van 10k Ohm.

![denk](EmojiThinking.png) | Gebruik de seriële monitor om de waarde van de nieuwe knop te bepalen.
:-------------:|:----------------------------------------: 

![denk](EmojiThinking.png) | Welke frequentie krijgt de nieuwe knop?
:-------------:|:----------------------------------------: 

De schakeling komt er zo uit te zien.

![Een pin](19_fig_5_bb.png)

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Oplossing 5

```c++
const int speaker_pin = 8;
const int piano_pin = A0;

void setup()
{
  pinMode(speaker_pin, OUTPUT);
  pinMode(piano_pin, INPUT);
  Serial.begin(9600);
}

void loop()
{
  //... vorige code hier
  else if (sensorValue > 310)
  {
    tone(speaker_pin, 262);
    delay(250);
    noTone(speaker_pin);
    delay(250);
  }
}
```

![Nu kan elk lid van de succesvolle boyband 5ive een knop van je piano bespelen!](19_5ive.jpeg)

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Opdracht 6

Bouw nu de 6e toets rechts van de vorige toetsen. Gebruik ook nu geen parallele weerstanden, maar 3 in serie geschakelde weerstanden van 10k Ohm.

![denk](EmojiThinking.png) | Gebruik de seriële monitor om de waarde van de nieuwe knop te bepalen.
:-------------:|:----------------------------------------: 

![denk](EmojiThinking.png) | Welke frequentie krijgt de nieuwe knop?
:-------------:|:----------------------------------------: 

De schakeling komt er zo uit te zien.

![Een pin](19_fig_6_bb.png)

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Oplossing 6

```c++
const int speaker_pin = 8;
const int piano_pin = A0;

void setup()
{
  pinMode(speaker_pin, OUTPUT);
  pinMode(piano_pin, INPUT);
  Serial.begin(9600);
}

void loop()
{
  //... vorige code hier
  else if (sensorValue > 210)
  {
    tone(speaker_pin, 294);
    delay(250);
    noTone(speaker_pin);
    delay(250);
  }
}
```

![Het subphylum van de zespotigen (hexapoda) kan nu met een poot per toets op jouw piano spelen!](19_hexapod.jpg)

\pagebreak

## Les 19: 1-Pin-7-Parallelle-Weerstanden-Piano: Eindopdracht

Maak een piano van zeven toetsen af door de 7e knop rechts bij te zetten. Gebruik nu 4 in serie geschakelde weerstanden van 10 kOhm.

![denk](EmojiThinking.png) | Gebruik de seriële monitor om de waarde van de nieuwe knop te bepalen.
:-------------:|:----------------------------------------: 

![denk](EmojiThinking.png) | Welke frequentie krijgt de nieuwe knop?
:-------------:|:----------------------------------------: 

![Wibi Soerjadi gebruikt meestal meer dan zeven toetsen](19_wibi_soerjadi.png)

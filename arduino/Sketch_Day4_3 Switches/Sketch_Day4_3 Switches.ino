// Day 3 - Switches
// 2022-10-26, Wednesday
int redLED = 10;
int blueLED = 11;
int greenLED = 12;
int Switch1 = 2;
int Switch2 = 3;
int Switch3 = 4;

void setup() {
  pinMode(redLED , OUTPUT);    // LEDs to OUTPUT
  pinMode(blueLED, OUTPUT);
  pinMode(greenLED, OUTPUT);
  pinMode(Switch1, INPUT);     // Switches to INPUT
  pinMode(Switch2, INPUT);
  pinMode(Switch3, INPUT);
}

void loop() {
  if (digitalRead(Switch1) == HIGH){
    digitalWrite(redLED, HIGH);           // turn redLED ON
  }
  else {
    digitalWrite(redLED, LOW);            // turn redLED OFF
  }
  if (digitalRead(Switch2) == HIGH){
    digitalWrite(blueLED, HIGH);          // turn blueLED ON
  }
  else {
    digitalWrite(blueLED, LOW);           // turn blueLED OFF
  }
  if (digitalRead(Switch3) == HIGH){
    digitalWrite(greenLED, HIGH);         // turn greenLED ON
  }
  else {
    digitalWrite(greenLED, LOW);          // turn greenLED OFF
  }
}

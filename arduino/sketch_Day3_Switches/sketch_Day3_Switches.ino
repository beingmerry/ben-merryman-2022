// Day 3 - Switches
// 2022-10-26, Wednesday
int LED = 12;
int Switch1 = 2;

void setup() {
  // put your setup code here, to run once:
  pinMode(LED, OUTPUT); // Set PIN 12 (LED) to OUTPUT type
  pinMode(Switch1, INPUT); // Set PIN 2 (Switch 1) to INPUT type
}

void loop() {
  // put your main code here, to run repeatedly:
  if (digitalRead(Switch1) == HIGH){
    digitalWrite(LED, HIGH); // turn LED ON
    delay(200);
    digitalWrite(LED, LOW); // turn LED OFF
    delay(200);
    digitalWrite(LED, HIGH); // turn LED ON
    delay(200);
    digitalWrite(LED, LOW); // turn LED OFF
    delay(200);
    digitalWrite(LED, HIGH); // turn LED ON
    delay(2000);
    digitalWrite(LED, LOW); // turn LED OFF
    delay(200);
  }
  else {
    digitalWrite(LED, LOW); // turn LED ON
  }
}

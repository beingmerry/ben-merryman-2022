const int onBoardLedPin = LED_BUILTIN;  // the LED_BUILTIN is an Arduino constant for the onboard LED PIN
const int ch12LedPin    = 12;           // the breadboard LED will be on ch12

int onBoardLedState = LOW; // Light off = LOW voltage
int ch12LedState    = LOW; // Light off = low voltage


void setup() {
  // put your setup code here, to run once:
  pinMode      (ch12LedPin, OUTPUT); // Set the pin mode to OUTPUT
  digitalWrite (ch12LedPin, HIGH);
}

void loop() {
  // put your main code here, to run repeatedly:

}

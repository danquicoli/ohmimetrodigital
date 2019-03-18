/* Daniel Quicoli
 *  Ohmimetro usando Arduino e Processing
 *  28/05/2018
 *  
*/

      //Definindo variáveis

unsigned Rk_1 = 0.1; //kohms      
unsigned Rk_2 = 1; //kohms
unsigned Rk_3 = 10; //kohms
unsigned Rk_4 = 100; //kohms

char cmd;
float value;
unsigned range = 1;

void setup() {
      // Definindo modo de operação dos pinos do Arduino
  Serial.begin(9600);
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);

}


      //Loop para calculo
void loop() {
  value = analogRead(A0);
  
  if (range == 1) {
    float Rx = Rk_1 * value / (1024 - value);
    tx(Rx);
    digitalWrite(2, 1);
    digitalWrite(3, 0);
    digitalWrite(4, 0);
    digitalWrite(5, 0);
  }
  if (range == 2) {
    float Rx = Rk_2 * value / (1024 - value);
    tx(Rx);
    digitalWrite(2, 0);
    digitalWrite(3, 1);
    digitalWrite(4, 0);
    digitalWrite(5, 0);
  }
  if (range == 3) {
    float Rx = Rk_3 * value / (1024 - value);
    tx(Rx);
    digitalWrite(2, 0);
    digitalWrite(3, 0);
    digitalWrite(4, 1);
    digitalWrite(5, 0);
  }
  if (range == 4) {
    float Rx = Rk_4 * value / (1024 - value);
    tx(Rx);
    digitalWrite(2, 0);
    digitalWrite(3, 0);
    digitalWrite(4, 0);
    digitalWrite(5, 1);
  }

}
        //Botoes do App
void serialEvent() {
  while (Serial.available()) {
    cmd = (char)Serial.read();
    if (cmd == '1') {
      range = 1;
    }
    if (cmd == '2') {
      range = 2;
    }
    if (cmd == '3') {
      range = 3;
    }
    if (cmd == '4') {
      range = 4;
    }
  }
}
        // Envia dados para Serial
        
void tx (float result) {

  Serial.print("*");
  if (value > 1000 || value < 10) {
    Serial.println("OL");
  }
  else {
    Serial.println(result);
  }
  delay(200);

}


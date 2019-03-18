import processing.serial.*;

void setup() {
  size(1000, 500);
  background(100);

  //TRY OF COMMUNICATION
  while (state) {
    try {
      choosePort();
      port = new Serial(this, serial_bun, 9600);
      port.bufferUntil('\n');
      state = false;
    }
    catch(Exception e) {
      err_window();
      state = true;
    }
  }
  butts_place();
  range_1.state = true;
  port.write("1");
}

// MAIN WINDOW
void draw() {
  display_butt();
  display();
}

//AUTO CONNECTING TO THE PORT
void choosePort() {
  usb = Serial.list();
  for (i = 0; i < usb.length; i++) {
    if (usb[i] != null) {
      serial_bun = usb[i];
    }
  }
}

//DISPLAY MEASUREMENT
void display() {

  stroke(0);
  fill(0, 100, 170);
  rect(50, 100, 900, 220);
  textAlign(CENTER);
  fill(0);
  textSize(150);
  if (ol_status) {
    text("OL", 450, 270);
  } else {

    if (absolute_value <=1) {
      text(ch*1000, 350, 270);
      textAlign(LEFT);
      textSize(150);
      text("Ω", 700, 270);
    }

    if (absolute_value <= 1000 && absolute_value >=1) {
      text(ch, 350, 270);
      textAlign(LEFT);
      textSize(150);
      text("kΩ", 700, 270);
    }

    if (absolute_value >= 1000) {
      text(ch/1000, 350, 270);
      textAlign(LEFT);
      textSize(150);
      text("MΩ", 700, 270);
    }
  }
}

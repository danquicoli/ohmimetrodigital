Button range_1;
Button range_2;
Button range_3;
Button range_4;


void butts_place() {
  range_1 = new Button("100 Ω", 115, 350.0, 150.0, 60.0, 200, 200, 0);
  range_2 = new Button("1 kΩ", 315, 350.0, 150.0, 60.0, 200, 200, 0);
  range_3 = new Button("10 kΩ", 515, 350.0, 150.0, 60.0, 200, 200, 0);
  range_4 = new Button("100 kΩ", 715, 350.0, 150.0, 60.0, 200, 200, 0);   
}

void display_butt() {
  range_1.place();
  range_2.place();
  range_3.place();
  range_4.place();
}

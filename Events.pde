void mouseClicked() {

  if (range_1.MouseIsOver()) {
    port.write("1");
    range_1.state = true;
    range_2.state = false;
    range_3.state = false;
    range_4.state = false;
  }

  if (range_2.MouseIsOver()) {
    port.write("2");
    range_1.state = false;
    range_2.state = true;
    range_3.state = false;
    range_4.state = false;
  }

  if (range_3.MouseIsOver()) {
    port.write("3");
    range_1.state = false;
    range_2.state = false;
    range_3.state = true;
    range_4.state = false;
  }

  if (range_4.MouseIsOver()) {
    port.write("4");
    range_1.state = false;
    range_2.state = false;
    range_3.state = false;
    range_4.state = true;
  }
}

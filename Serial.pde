void serialEvent (Serial port)
{
  try {
    data = port.readStringUntil('\n');
    println(data);

    if (data.startsWith("*")) {
      ch = float(data.substring(data.indexOf("*") + 1, data.indexOf("\n") ).trim());
      ol_status = false;
      absolute_value = int(ch);
    }
    
     if (data.startsWith("*OL")) {
      ol_status = true;
    }
    
  }
  catch(Exception e) {
    println("Error!");
  }
}

void err_window() {
  fill(0, 0, 200);
  stroke(200, 0, 0);
  rect(width/2-200, height/2-150, 400, 150);
  textSize(30);
  textAlign(CENTER);
  fill(200, 0, 0);
  text("NO CONNECTION!", width/2, height/2-100);
}

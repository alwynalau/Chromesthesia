void mousePressed() {
  if (mic.isActive()) { 
    mic.stop();
  }
  else
  {
    mic.start();
  }

  if (state ==1) {
    if (mouseY<height/2) {
      state =2;
    }
    if ( mouseY >height/2) {
      background(0);
      state =3;
      textFont(gothic, 24);
      textAlign(CENTER);
      fill(255);
      text("tilt device & speak now", width/2, height/2);
      textFont(gothic, 18);
      textAlign(RIGHT);
      text("tap here to exit", width, height);
    }
  }
  else if (state ==2) {
    if ( mouseY <height/2) {
      background(0);
      state =3;
      textFont(gothic, 24);
      textAlign(CENTER);
      fill(255);
      text("tilt device & speak now", width/2, height/2);
      textFont(gothic, 18);
      textAlign(RIGHT);
      text("tap here to exit", width, height);
    }
    if ( mouseY >height/2) {
      background(0);
      state =1;
    }
  }
  else if (state ==3) {
    background(0);  
    textFont(gothic, 24);
    textAlign(CENTER);
    fill(255);
    text("tilt device & speak now", width/2, height/2);
    textFont(gothic, 18);
    textAlign(RIGHT);
    text("tap here to exit", width, height);

    if (mouseX>width/2 && mouseY>height/2) {
      background(0);     
      state=1;
    }
  }
}


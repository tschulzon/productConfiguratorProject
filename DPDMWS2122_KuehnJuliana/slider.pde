enum sliderType {
  stiefel,
  sohle,
  schnuersenkel
}

class slider {
  sliderType type;
  int xPos = 0;
  int yPos = 0;
  int myWidth;
  int myHeight;
  color backgroundColor = color(30, 30, 30);
  color forgroundColor = color(200, 200, 200);
  float myValue = 1.0;
  boolean dragState = false;
  
  slider(int xPos, int yPos, int myWidth, int myHeight) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.myWidth = myWidth;
    this.myHeight = myHeight;
  }
  
  void draw() {
    pushMatrix();
    translate(xPos, yPos);
    stroke(0);
    rect(0, 0, myWidth, myHeight);
    drawColorgradient();
    fill(forgroundColor);
    stroke(backgroundColor);
    strokeWeight(2);
    colorMode(HSB, 1, 100, 100);
    fill(myValue, 80, 120);
    rect(0 + (myWidth+20 - myHeight) * myValue, 0 - myHeight * 0.07, 10, myHeight/0.85, 0);
    popMatrix();
  }
  
  void drawColorgradient() {
    for(int i = 0; i < myWidth-4; i++) {
      noStroke();
      colorMode(HSB, myWidth-4, 100, 100);
      fill(i, 80, 120);
      rect(2+i, 2, 1.0, myHeight-4);
    }
  }
  
  boolean mousePressed() {
    if (insideRect(mouseX, mouseY, xPos, yPos, myWidth, myHeight)) {
      dragState = true;
      myValue = constrain((mouseX - xPos)/float(myWidth), 0, 1);
      return true;
    }
    return false;
  }
  
   void mouseDragged() {
    if (dragState) {
      myValue = constrain((mouseX - xPos)/float(myWidth), 0, 1);
    }
  }
  
  void mouseReleased() {
    dragState = false;
  }
}

    
    

class toggleButton {
  int myXPos = 0;
  int myYPos = 0;
  int myWidth = 80;
  int myHeight = 40;
  color backgroundColor = color(100, 100, 100);
  color forgroundColor = color(255, 255, 0);
  boolean myStateActive = false;
  
  toggleButton(int xPos, int yPos) {
    myXPos = xPos;
    myYPos = yPos;
  }
  
  void draw() {
    pushMatrix();
    translate(myXPos, myYPos);
    strokeWeight(1);
    fill(backgroundColor);
    rect(0, 0, myWidth, myHeight, 0);
    fill(forgroundColor);
    if (!myStateActive) {
      strokeWeight(1);
      rect(0+2, 0+2, myWidth*0.6-4, myHeight-4, 0);
    } else {
      rect(0+myWidth-myWidth*0.6+2, 0+2, myWidth*0.6-4, myHeight-4, 0);
    }
    popMatrix();
  }
  
  void mousePressed() {
    if (insideRect(mouseX, mouseY, myXPos, myYPos, myWidth, myHeight)) {
      myStateActive = !myStateActive;
    }
  }
}

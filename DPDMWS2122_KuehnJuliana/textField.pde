class textField {
  int xPos = 0;
  int yPos = 0;
  int myWidth = 0;
  int myHeight = 0;
  String myText;
  int myMaxTextLength = 10;
  boolean active = false;
  int cursorIndexPos = 0;
  float cursorXPos = 0;
  int lastCursorchange = millis();
  color backgroundColor = color(30, 30, 30);
  color forgroundColor = color(0, 0, 0);
  
  textField(int xPos, int yPos, int myWidth, int myHeight, String myText) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.myWidth = myWidth;
    this.myHeight = myHeight;
    this.myText = myText;
    
  }
  
  void draw() {
    textFont(myFontTimeburner);
    textAlign(LEFT, BASELINE);
    rect(30, 560, 200, 40);
    pushMatrix();
    translate(xPos, yPos);
    stroke(backgroundColor);
    fill(forgroundColor);
    text(myText, 10, 10);
    
    if (active) {
      stroke(0.5);
      if (((millis()-lastCursorchange)/500)%2 == 0) {
        rect(cursorXPos+1, -15, 2, 28);
      }
    }
    popMatrix();
  }
  
  void mousePressed() {
    textFont(myFontTimeburner);
    if (insideRect(mouseX, mouseY, xPos, yPos, myWidth, myHeight)) {
      int startXPos = 10;
      cursorIndexPos = 0;
      cursorXPos = startXPos;
      for (int i = 0; i < myText.length(); i++) {
        startXPos += textWidth(myText.charAt(i));
        if (mouseX - xPos > startXPos - textWidth(myText.charAt(i))/2) {
          cursorIndexPos += 1;
        }
      }
      setCursorXPos();
      active = true;
    } else {
      active = false;
    }
  }
  
  void setCursorXPos() {
    textFont(myFontTimeburner);
    cursorXPos = 10 + textWidth(myText.substring(0, cursorIndexPos)) - 1;
    lastCursorchange = millis();
  }
  
void keyPressed() {
    if (active) {
      if (keyCode == LEFT) {
        if (cursorIndexPos > 0) cursorIndexPos--;
      } else if (keyCode == RIGHT) {
        if (cursorIndexPos < myText.length()) cursorIndexPos++;
      } else if (keyCode == ENTER || keyCode == RETURN) {
        active = false;
      } else if (keyCode == 8) { //DELETE KeyCode
        if (cursorIndexPos > 0) {
          myText = myText.substring(0, cursorIndexPos-1) + myText.substring(cursorIndexPos, myText.length());
          cursorIndexPos--;
        }
      } else {
        if (myText.length() < myMaxTextLength) {
          if (match("0123456789abcdefghijklmnopqrstuvwxyzäöüßABCDEFGHIJKLMNOPQRSTUVWXYZ!?-#&= ", str(key)) != null) {
            myText = myText.substring(0, cursorIndexPos) + str(key) + myText.substring(cursorIndexPos, myText.length());
            cursorIndexPos++;
          }
        }
      }
      setCursorXPos();
    }
  }
}

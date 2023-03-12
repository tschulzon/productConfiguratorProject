class Button {
  int xPos;
  int yPos;
  PImage imgButton;
  
  Button(int xPos, int yPos, PImage imgButton) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.imgButton = imgButton;
  }
  
  void draw() {
      image(imgButton, xPos, yPos);
  }
  
  boolean mousePressed() {
    if (insideRect(mouseX, mouseY, (int)xPos, (int)yPos, imgButton.width, imgButton.height)) {
      return true;
    }
    return false;
  }
}

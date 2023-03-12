Button resetStiefel;
Button resetSohle;
Button resetSchnuersenkel;

slider sliderStiefel;
slider sliderSohle;
slider sliderSchnuersenkel;
slider sliderSchriftart;

tabButtonMat tabButtonMaterial;

tabButtonSohle tabButtonSohle;

toggleButton toggleButtonName;
textField textFieldName;

PFont myFontReallyFree;
PFont myFontTimeburner;
PFont myFontAstroSpace;

PImage resetButton;

PImage stiefelLackOhneSohle;
PImage stiefelLackFlachOrig;
PImage stiefelLackTransp;
PImage senkelBootLack;
PImage nahtBootPlateau;

PImage stiefelLederOhneSohle;
PImage stiefelLederFlachOrigTransp;
PImage stiefelLederPlateauOrig;
PImage stiefelLederTransp;
PImage senkelBootLeder;
PImage nahtBootFlach;

PImage sohleBootFlach;
PImage sohleBootFlach2;
PImage sohleBootPlateau;
PImage sohleBootFlachTransp;
PImage sohleBootPlateauTransp;

PImage materialLeder;
PImage materialLack;

boolean tintStiefel = false;
boolean tintSohle = false;
boolean tintSchnuersenkel = false;
boolean tintSchriftfarbe = false;

void setup() {
  size(1024, 768);
  
  //Elemente für Farbe Stiefel
  resetButton = loadImage("resetButton.png");
  resetButton.resize((int)(resetButton.width * 0.05), (int)(resetButton.height * 0.05));
  resetStiefel = new Button(950, 316, resetButton); 
  sliderStiefel = new slider (750, 320, 180, 40);
  sliderStiefel.type = sliderType.stiefel;
  sliderStiefel.myValue = 0;

  //Elemente für Farbe Sohle
  resetSohle = new Button(950, 416, resetButton); 
  sliderSohle = new slider (750, 420, 180, 40);
  sliderSohle.type = sliderType.sohle;
  sliderSohle.myValue = 0;
  
  //Elemente für Farbe Schnürsenkel
  resetSchnuersenkel = new Button(950, 516, resetButton); 
  sliderSchnuersenkel = new slider (750, 520, 180, 40);
  sliderSchnuersenkel.type = sliderType.schnuersenkel;
  sliderSchnuersenkel.myValue = 0;
  
  //Element für Materialwechsel
  tabButtonMaterial = new tabButtonMat(50, 220, 2, 170, 70);
  tabButtonMaterial.activeTab = 0;
  
  //Element für Sohlenwechsel
  String[] tabSohle = {"  Flach", "Plateau"};
  tabButtonSohle = new tabButtonSohle(50, 380, 2, 170, 30, tabSohle);
  tabButtonSohle.activeTab = 0;

  //Elemente für die Personalisierung
  sliderSchriftart = new slider(30, 630, 160, 20);
  sliderSchriftart.myValue = 0;
  toggleButtonName = new toggleButton(30, 500);
  textFieldName = new textField(30, 580, 200, 30, "Name");

  //Schriftarten
  myFontReallyFree = createFont ("ReallyFree.ttf", 32);
  myFontTimeburner = createFont ("Timeburner.ttf", 35);
  myFontAstroSpace = createFont ("AstroSpace.otf", 45);

  //Bilder 
  stiefelLackOhneSohle = loadImage ("stiefelLackOhneSohle.png");
  stiefelLackTransp = loadImage ("stiefelLackTransp.png");
  senkelBootLack = loadImage ("senkelBootLack.png");
  nahtBootPlateau = loadImage("nahtBootPlateau.png");

  stiefelLederOhneSohle = loadImage("stiefelLederOhneSohle.png");
  stiefelLederFlachOrigTransp = loadImage("stiefelLederOrigTRANSP.png");
  stiefelLederTransp = loadImage("stiefelLederTransp.png");
  senkelBootLeder = loadImage("senkelBootLederNEU.png");
  nahtBootFlach = loadImage("nahtBootFlach.png");

  sohleBootFlach = loadImage("sohleBootFlachOrig.png");
  sohleBootFlach2 = loadImage("sohleBootFlachALLE.png");
  sohleBootPlateau = loadImage("sohleBootPlateauALLE.png");
  sohleBootFlachTransp = loadImage("sohleBootFlachTransp.png");
  sohleBootPlateauTransp = loadImage("sohleBootPlateauTransp.png");

  materialLeder = loadImage("MaterialLeder.png");
  materialLack = loadImage("MaterialLack.png");
}

void draw() {
  colorMode(RGB, 255, 255, 255);
  background(5, 5, 5);
  fill(255, 255, 0);
  textFont(myFontAstroSpace);
  text("CREATE YOUR OWN DOCMARTENS", 100, 90);
  textAlign(LEFT, BASELINE);
  noTint();
  image(stiefelLederOhneSohle, 250, 250, width/2, height/2);
  image(sohleBootFlach, 250, 250, width/2, height/2);

  //Materialauswahl
  colorMode(RGB, 255, 255, 255);
  fill(255, 255, 0);
  textFont(myFontTimeburner);
  text("MATERIAL", 65, 200);
  textAlign(LEFT, BASELINE);
  tabButtonMaterial.draw();
  image(materialLeder, 59, 229, width/15, height/15);
  image(materialLack, 143, 230, width/15, height/15);

  //Sohlenauswahl
  colorMode(RGB, 255, 255, 255);
  fill(255, 255, 0);
  textFont(myFontTimeburner);
  text("SOHLE", 85, 360);
  textAlign(LEFT, BASELINE);
  tabButtonSohle.draw();
  
  //Farbauswahlmenü
  colorMode(RGB, 255, 255, 255);
  fill(255, 255, 0);
  textFont(myFontTimeburner);
  text("FARBAUSWAHL", 750, 200);
  textAlign(LEFT, BASELINE);
  textFont(myFontTimeburner);
  text("FUER", 810, 230);
  textAlign(LEFT, BASELINE);
  
  //Farbauswahl für Stiefel selber
  textFont(myFontTimeburner);
  textSize(25);
  colorMode(RGB, 255, 255, 255);
  fill(255, 255, 0);
  text("STIEFEL", 800, 295);
  textAlign(LEFT, BASELINE);
  sliderStiefel.draw();
  colorMode(RGB, 255, 255, 255);
  tint(235, 204, 52);
  resetStiefel.draw();
  if (tintStiefel) {
  schuhColor();
  }
  
  //Farbauswahl für die Sohle
  textFont(myFontTimeburner);
  textSize(25);
  colorMode(RGB, 255, 255, 255);
  fill(255, 255, 0);
  text("SOHLE", 800, 405);
  textAlign(LEFT, BASELINE);
  sliderSohle.draw();
  colorMode(RGB, 255, 255, 255);
  tint(235, 204, 52);
  resetSohle.draw();
  if (tintSohle)
  sohleColor();

  //Farbauswahl für die Schnürsenkel
  colorMode(RGB, 255, 255, 255);
  textFont(myFontTimeburner);
  textSize(25);
  fill(255, 255, 0);
  text("SCHNUERSENKEL", 750, 510);
  textAlign(LEFT, BASELINE);
  sliderSchnuersenkel.draw();
  colorMode(RGB, 255, 255, 255);
  tint(235, 204, 52);
  resetSchnuersenkel.draw();
  if (tintSchnuersenkel)
  schnuersenkelColor();

  //Personalisierung des Stiefels mit dem eigenen Namen
  colorMode(RGB, 255, 255, 255);
  textFont(myFontTimeburner);
  textSize(30);
  fill(255, 255, 0);
  text("PERSONALISIERUNG", 25, 480);
  textAlign(LEFT, BASELINE);
  toggleButtonName.draw();
  textFont(myFontTimeburner);
  fill(0, 0, 0);
  textSize(22);
  fill(255, 255, 0);
  text("NEIN / JA", 130, 530);
  textAlign(LEFT, BASELINE);
  if (toggleButtonName.myStateActive == true) {
    textFieldName.draw();
    sliderSchriftart.draw();
  }
  if (toggleButtonName.myStateActive == true) {
    persoText();
  }
}

//Funktion für die Schuh-Farbauswahl
void schuhColor() {
  colorMode(HSB, 360, 100, 100);
  if (tabButtonMaterial.activeTab == 0) {
    tint(sliderStiefel.myValue * 360, 100, 100);
    image(stiefelLederTransp, 250, 250, width/2, height/2);
    image(nahtBootFlach, 250, 250, width/2, height/2);
    colorMode(HSB, 360, 100, 100);
    fill(sliderStiefel.myValue * 204, 204, 204);
    if(tabButtonSohle.activeTab == 1) {
      noTint();
      image(sohleBootFlach, 250,250, width/2, height/2);
      tint(sliderStiefel.myValue * 360, 100, 100);
      image(nahtBootPlateau, 250, 250, width/2, height/2);
      colorMode(HSB, 360, 100, 100);
      fill(sliderStiefel.myValue * 204, 204, 204);
    }
  } else if (tabButtonMaterial.activeTab == 1) {
    tint(sliderStiefel.myValue * 360, 100, 100);
    image(stiefelLackTransp, 250, 250, width/2, height/2);
    image(nahtBootFlach, 250, 250, width/2, height/2);
    colorMode(HSB, 360, 100, 100);
    fill(sliderStiefel.myValue * 204, 204, 204);
    if(tabButtonSohle.activeTab == 1) {
      noTint();
      image(sohleBootFlach, 250,250, width/2, height/2);
      tint(sliderStiefel.myValue * 360, 100, 100);
      image(nahtBootPlateau, 250, 250, width/2, height/2);
      colorMode(HSB, 360, 100, 100);
      fill(sliderStiefel.myValue * 204, 204, 204);
    }
  }
}

//Funktion für die Sohlen-Farbauswahl
void sohleColor() {
  colorMode(HSB, 360, 100, 100);
  if (tabButtonSohle.activeTab == 0) {
    tint(sliderSohle.myValue * 360, 100, 100);
    image(sohleBootFlachTransp, 250, 250, width/2, height/2);
    colorMode(HSB, 360, 100, 100);
    fill(sliderSohle.myValue * 204, 204, 204);
  } else if (tabButtonSohle.activeTab == 1) {
    tint(sliderSohle.myValue * 360, 100, 100);
    image(sohleBootPlateauTransp, 250, 250, width/2, height/2);
    colorMode(HSB, 360, 100, 100);
    fill(sliderSohle.myValue * 204, 204, 204);
  }
}

//Funktion für die Schnürsenkel-Farbauswahl
void schnuersenkelColor() {
  colorMode(HSB, 360, 100, 100);
  if (tabButtonMaterial.activeTab == 0) {
    tint(sliderSchnuersenkel.myValue * 360, 100, 100);
    image(senkelBootLeder, 250, 250, width/2, height/2);
    colorMode(HSB, 360, 100, 100);
    fill(sliderSchnuersenkel.myValue * 204, 204, 204);
  } else if (tabButtonMaterial.activeTab == 1) {
    tint(sliderSchnuersenkel.myValue * 360, 100, 100);
    image(senkelBootLack, 250, 250, width/2, height/2);
    colorMode(HSB, 360, 100, 100);
    fill(sliderSchnuersenkel.myValue * 204, 204, 204);
  }
}

//Funktion für den Personalisierungstext
void persoText() {
  textFont(myFontReallyFree);
  pushMatrix();
  translate(580, 500);
  textAlign(CENTER, TOP);
  rotate(-45);
  textSize(35);
  tint(sliderSchriftart.myValue * 360, 100, 60);
  text(textFieldName.myText, 0, 0, 100, 40);
  colorMode(HSB, 360, 100, 100);
  fill(sliderSchriftart.myValue * 204, 204, 204);
  popMatrix();
  textAlign(LEFT, BASELINE);
}

//Alle Funktionen für MousePressed
void mousePressed() {
  
  int lastMaterialSelection = tabButtonMaterial.activeTab;
  tabButtonMaterial.mousePressed();

  int lastSohleSelection = tabButtonSohle.activeTab;
  tabButtonSohle.mousePressed();

  //Stiefel färbt sich nur wenn slider angeklickt wird
  if (sliderStiefel.mousePressed())
  tintStiefel = true;
  if (sliderSohle.mousePressed())
  tintSohle = true;
  if (sliderSchnuersenkel.mousePressed())
  tintSchnuersenkel = true;
  if(sliderSchriftart.mousePressed())
  tintSchriftfarbe = true;
  
  //Farbe wird zurückgesetzt wenn auf Reset-Button geklickt wird
  if (resetStiefel.mousePressed())
  tintStiefel = false;
  if (resetSohle.mousePressed())
  tintSohle = false;
  if (resetSchnuersenkel.mousePressed())
  tintSchnuersenkel = false;

  toggleButtonName.mousePressed();

  //Materialwechsel beim Anklicken
  if (lastMaterialSelection != tabButtonMaterial.activeTab) {
    if (tabButtonMaterial.activeTab == 0) {
      stiefelLederOhneSohle = stiefelLederFlachOrigTransp;
    } else if (tabButtonMaterial.activeTab == 1) {
      stiefelLederOhneSohle = stiefelLackOhneSohle;
    }
  }
  //Sohlenwechsel beim Anklicken
  if (lastSohleSelection != tabButtonSohle.activeTab) {
    if (tabButtonSohle.activeTab == 0) {
      sohleBootFlach = sohleBootFlach2;
    } else if (tabButtonSohle.activeTab == 1) {
      sohleBootFlach = sohleBootPlateau;
    }
  }
    
  if (toggleButtonName.myStateActive == true) {
    textFieldName.mousePressed();
  }
}


void mouseDragged() {
  sliderStiefel.mouseDragged();
  sliderSohle.mouseDragged();
  sliderSchnuersenkel.mouseDragged();
  sliderSchriftart.mouseDragged();
}

void mouseReleased() {
  sliderStiefel.mouseReleased();
  sliderSohle.mouseReleased();
  sliderSchnuersenkel.mouseReleased();
  sliderSchriftart.mouseReleased();
}

void keyPressed() {
  if (toggleButtonName.myStateActive == true) {
    textFieldName.keyPressed();
  }
}


boolean insideRect(int xPos, int yPos, int targetXPos, int targetYPos, int targetWidth, int targetHeight) {
  if (xPos > targetXPos && xPos < targetXPos + targetWidth && yPos > targetYPos && yPos < targetYPos + targetHeight) {
    return true;
  }
  return false;
}

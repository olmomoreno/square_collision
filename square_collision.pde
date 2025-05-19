/*****************************************************************
**  SCENE: This scene design consist of 1 interactive element,  **
**  it displays two green squares, one collides the other using **
**  the mouse. If the square goes off the limits, press the     **
**  reset button in the card control area.                      **
*****************************************************************/

//Images
PImage rocketIcon;

// Sketch's fonts
PFont robotoRegular12;
PFont robotoRegular16;
PFont robotoRegular20;
PFont robotoRegular24;
PFont robotoRegular35;
PFont robotoBold16;

// Color definitions
color green1 = color(29,185,84); 
color green2 = color(35, 124, 102); 
color green3 = color(6, 64, 43);
color gray1 = color(33, 33, 33);
color gray2 = color(83, 83, 83);
color white = color(255);
color black = color(0);

// Variable definitions
int squareX = 350;
int squareY = 250;
int mouseSquareX = 250;
int mouseSquareY = 50;
boolean locked = false;

void setup() {
  
  // Processing window size
  size(600, 400);

  // Loads image
  rocketIcon = loadImage("images/rocket_launch_24dp_FFFFFF.png");

  // Creates font
  robotoRegular12 = createFont("fonts/Roboto-Regular.ttf", 12);
  robotoRegular16 = createFont("fonts/Roboto-Regular.ttf", 16);
  robotoRegular20 = createFont("fonts/Roboto-Regular.ttf", 20);
  robotoRegular24 = createFont("fonts/Roboto-Regular.ttf", 24);
  robotoRegular35 = createFont("fonts/Roboto-Regular.ttf", 35);
  robotoBold16 = createFont("fonts/Roboto-Bold.ttf", 16);
}

void draw() {

  background(black);

  // Paddings (units -> px)
  int padding28 = 28;
  int statusBarHeight = 24;
  int topAppBarHeight = 45;
  int margin = 16;

  // Font size
  int fontSize12 = 12;
  int fontSize16 = 16;
  int fontSize20 = 20;
  int fontSize24 = 24;
  int fontSize35 = 35;

  // Draws card/working area separation line
  int cardAreaWidth = 200;
  strokeWeight(1);
  stroke(white);
  line(cardAreaWidth, 0, cardAreaWidth, height);

  // Draws Top App Bar
  rectMode(CORNER);
  noStroke();
  fill(gray1);
  rect(0, statusBarHeight, cardAreaWidth, topAppBarHeight);

  // Draws card
  int cardWidth = cardAreaWidth - (margin * 2);
  int roundCorners = 25;
  fill(gray2);
  rect(margin, statusBarHeight + topAppBarHeight + margin, cardWidth, height - statusBarHeight - topAppBarHeight - (margin * 2), roundCorners);

  // Draws card button
  int buttonWidth = 80;
  int buttonHeight = 30;
  int buttonOffsetX = (cardWidth - (margin * 2) - buttonWidth)/2;
  roundCorners = 10;
  strokeWeight(1);
  stroke(white);
  fill(green1);
  rect((margin * 2) + buttonOffsetX, statusBarHeight + topAppBarHeight + margin + (padding28 * 8) - (buttonHeight/2), buttonWidth, buttonHeight, roundCorners);

  

  // Checks if mouse is over card's button
  if(locked == true){ // Permit when mouse is pressed

    if((mouseY >= statusBarHeight + topAppBarHeight + margin + (padding28 * 8) - (buttonHeight/2)) && // Is the mouse over top half of card's button?
       (mouseY <= statusBarHeight + topAppBarHeight + margin + (padding28 * 8) + (buttonHeight/2))){  // Is the mouse over bottom half of card's button?

      if((mouseX > (margin * 2)  + buttonOffsetX) && (mouseX < (margin * 2)  + buttonOffsetX + buttonWidth)){ // Is the mouse over the card's button?
        squareX = 300;
        squareY = 250;
        locked = false;
      }
    }
  }
 
  //circle(sliderButtonX + (circleSize/2), statusBarHeight + topAppBarHeight + margin + (padding28 * 8) + (circleSize/32), circleSize);



  // Draws status bar image
  int iconSize = 16;
  int iconOffset = 4;
  image(rocketIcon, cardAreaWidth - margin - iconSize, iconOffset, iconSize, iconSize);

  // Writes clock time
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  int textOffsetHeight = 6;
  String time = nf(h, 2) + ":" + nf(m, 2);
  fill(white);
  textFont(robotoRegular16, fontSize16);
  text(time, margin, statusBarHeight - textOffsetHeight);

  // Writes Top App Bar text
  textOffsetHeight = 15;
  String proLab = "Processing Lab";
  textFont(robotoRegular24, fontSize24);
  text(proLab, margin, statusBarHeight + topAppBarHeight - textOffsetHeight);

  // Writes card title
  String cardTitle = "Sqr. collision";
  textFont(robotoRegular20, fontSize20);
  text(cardTitle, margin * 2, statusBarHeight + topAppBarHeight + margin + padding28);

  // Writes card subtitle
  String cardSubTitle = "Interactive sketch";
  textFont(robotoRegular12, fontSize12);
  text(cardSubTitle, margin * 2, statusBarHeight + topAppBarHeight + margin + (padding28 * 2));

  // Writes card number variable
  String squareCoordinates = squareX + ", " + squareY;
  textFont(robotoRegular35, fontSize35);
  text(squareCoordinates, margin * 2, statusBarHeight + topAppBarHeight + margin + (padding28 * 5));

    // Writes card number variable subtitle
  String cardNumVArSub = "Square coordinates (x, y)";
  textFont(robotoRegular12, fontSize12);
  text(cardNumVArSub, margin * 2, statusBarHeight + topAppBarHeight + margin + (padding28 * 6));

  // Writes card button text
  int cboX = 17;
  int cboY = 22;
  String cardButtonText = "RESET";
  textFont(robotoBold16, fontSize16);
  text(cardButtonText, (margin * 2) + buttonOffsetX + cboX, statusBarHeight + topAppBarHeight + margin + (padding28 * 8) - (buttonHeight/2) + cboY);

  // Square variables
  int squareSize = 50;
  int squareY = height/2 - squareSize/2;
  rectMode(CENTER);

  // Checks if mouse is over animation area
  if(mouseX > cardAreaWidth + (squareSize/2)){
    mouseSquareX = mouseX;
    mouseSquareY = mouseY;
  }
  else{
    mouseSquareX = mouseSquareX;
    mouseSquareY = mouseSquareY;
  }
  
  // Draws mouse follower square
  fill(gray1);
  rect(mouseSquareX, mouseSquareY, squareSize, squareSize);

  

  // if(mouseY+25 <= squareY-25) {
  //   z = 1; //Up
  // }
  // if(mouseX-25 >= squareX+25) {
  //   z = 2; //Right
  // }
  // if(mouseY-25 >= squareY+25) {
  //   z = 3; //Down
  // }
  // if(mouseX+25 <= squareX-25) {
  //   z = 4; //Left
  // }
  
  // Checks mouse left vs square right collision
  if((mouseSquareX + (squareSize/2) >= squareX - (squareSize/2)) &&
     (mouseSquareX - (squareSize/2) <= squareX + (squareSize/2)) &&
     (mouseSquareY + (squareSize/2) >= squareY - (squareSize/2)) &&
     (mouseSquareY - (squareSize/2) <= squareY + (squareSize/2))){
    squareX = mouseSquareX + squareSize;
  }

  // Checks mouse right vs square left collision
  if((mouseSquareX - (squareSize/2) <= squareX + (squareSize/2)) &&
     (mouseSquareX + (squareSize/2) >= squareX - (squareSize/2)) &&
     (mouseSquareY + (squareSize/2) >= squareY - (squareSize/2)) &&
     (mouseSquareY - (squareSize/2) <= squareY + (squareSize/2))){
    squareX = mouseSquareX - squareSize;
  }
   

  // Draws square to collide
  fill(green2);
  rect(squareX, squareY, squareSize, squareSize);
}

// Interruption when mouse pressed
void mousePressed() {
  locked = true;
}

// Interruption when mouse released
void mouseReleased() {
  locked = false;
}
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
PFont robotoRegular50;

// Color definitions
color green1 = color(29,185,84); 
color green2 = color(35, 124, 102); 
color gray1 = color(33, 33, 33);
color gray2 = color(83, 83, 83);
color white = color(255);
color black = color(0);

// Variable definitions
int x = 250;
int y = 250;
int z = 0;

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
  robotoRegular50 = createFont("fonts/Roboto-Regular.ttf", 50);

  rectMode(CENTER);
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
  int fontSize50 = 50;

  // Draws card/working area separation line
  int cardAreaWidth = 200;
  strokeWeight(1);
  stroke(white);
  line(cardAreaWidth, 0, cardAreaWidth, height);

  // Draws Top App Bar
  noStroke();
  fill(gray1);
  rect(0, statusBarHeight, cardAreaWidth, topAppBarHeight);

  // Draws card
  int cardWidth = cardAreaWidth - (margin * 2);
  int roundCorners = 25;
  fill(gray2);
  rect(margin, statusBarHeight + topAppBarHeight + margin, cardWidth, height - statusBarHeight - topAppBarHeight - (margin * 2), roundCorners);

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

  

  stroke(0);
  strokeWeight(2);
  rect(mouseX,mouseY,50,50);
  rect(x,y,50,50);
  if(mouseY+25 <= y-25) {
    z = 1; //Up
  }
  if(mouseX-25 >= x+25) {
    z = 2; //Right
  }
  if(mouseY-25 >= y+25) {
    z = 3; //Down
  }
  if(mouseX+25 <= x-25) {
    z = 4; //Left
  }
  
  switch(z) {
  case 1:
    if((mouseX+25 >= x-25)&&(mouseX-25 <= x+25)&&(mouseY+25 >= y-25)) {
      y++;
    }
    break;
  case 2:
    if((mouseY+25 >= y-25)&&(mouseY-25 <= y+25)&&(mouseX-25 <= x+25)) {
      x--;
    }
    break;
  case 3:
    if((mouseX+25 >= x-25)&&(mouseX-25 <= x+25)&&(mouseY-25 <= y+25)) {
      y--;
    }
    break;
  case 4:
    if((mouseY+25 >= y-25)&&(mouseY-25 <= y+25)&&(mouseX+25 >= x-25)) {
      x++;
    }
    break;
  default:
    y=y;
  }
}

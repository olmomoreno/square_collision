int x = 250;
int y = 250;
int z = 0;
void setup() {
  size(500,500);
  rectMode(CENTER);
}
void draw() {
  background(255);
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
  println(z);
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

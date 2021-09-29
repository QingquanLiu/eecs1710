color bgColor = color(50, 155, 134);
float circleSize = 100;

void setup(){
  size(800, 600, P2D); 
  background(bgColor);
}

void draw() {
  if (mousePressed) {
    rectMode(CENTER);
    fill(133, 255, 143);
    stroke(255, 0, 0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, circleSize, circleSize/2);
  }
}
    

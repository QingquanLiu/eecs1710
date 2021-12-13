PImage img1, img2, img3;
float x = 300;
float y = 300;
float s = 100;
float speed = 5;

void setup() {
  size(640, 480, P2D);
  
  img1 = loadImage("tree.png");
  img2 = loadImage("sun.png");
  img3 = loadImage("bird.png");
}

void draw() {
  imageMode(CORNER);
  image(img1, 0, 0, width, height);
  
  imageMode(CENTER);
  image(img2, mouseX, mouseY, 50, 50);
  
  imageMode(CORNER);
  image(img3, x, y, s, s);
  x += speed;
  
  if (x > width || x < 0) {
    speed *= -1;
  }
  
  
}
  

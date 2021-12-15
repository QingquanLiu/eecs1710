
PImage img;
int mode=0;
String d="DOG";
void setup()
{
  size(600, 800);
  img = loadImage("dog.jpg");
  img.resize(width, height);
  background(0);
  textAlign(CENTER, CENTER);
}
void draw()
{
  background(0);
  println(mode);
  if (mode%3==0)
  {
    noLoop();
    ef1();
  } else if (mode%3==1)
  {
    ef2();
  } else if (mode%3==2)
  {
    noLoop();
    ef3();
  }
}
void keyPressed()
{
  loop();
  mode++;
}

void ef1()
{
  noStroke();
  for (int x=0; x<width; x+=5) {
    for (int y=0; y<height; y+=5) {
      color c=img.get(x, y);
      fill(c, 200);
      ellipse(x+random(-10, 10), y+random(-10, 10), 10, 10);
    }
  }
}
void ef2()
{
  noStroke();
  textSize(10);
  for (int x=5; x<width; x+=10) {
    for (int y=5; y<height; y+=10) {
      color c=img.get(x, y);
      fill(c);
      text(d.charAt((x+y)%3), x, y);
    }
  }
}

void ef3()
{

  noStroke();
  textSize(10);
  rectMode(CENTER);
  for (int x=5; x<width; x+=10) {
    for (int y=5; y<height; y+=10) {
      color c=img.get(x, y);
      fill(c);
      rect(x, y, random(8, 15), random(8, 15));
    }
  }
}

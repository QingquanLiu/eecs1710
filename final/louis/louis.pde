import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

Keys[]keys;
int hues=0;
void setup()
{
  size(1000, 1000, P2D );
  minim = new Minim( this );
  out = minim.getLineOut( Minim.MONO, 2048 );
  out.setTempo( 90.0 );
  colorMode(HSB);
  keys=new Keys[14];
  for (int i=0; i<keys.length; i++) {
    keys[i]=new Keys(char(65+(i%7))+""+int(3+i/7), 40+70*i, height/2+300, 50, char(97+i));
  }
}
void draw()
{
  fill(0, 10);
  rect(0, 0, width, height);
  hues++;
  hues=hues%255;
  for (int i = 0; i < out.bufferSize()/2; i++)
  {
    strokeWeight(2);
    stroke(#FFFFFF);
    line(i, height/2-50  + out.left.get(i)*20, i+1, height/2-50  + out.left.get(i+1)*20);
    line(i, height/2+50 + out.right.get(i)*20, i+1, height/2+50 + out.right.get(i+1)*20);

    float angle=map(i, 0, out.bufferSize()/2, 0, TWO_PI);
    if (random(1)<0.1) {
      float x=width/2+random(250)*cos(angle);
      float y=height/2+random(250)*sin(angle);
      noStroke();
      if (dist(mouseX, mouseY, x, y)<100) {
        fill(random(360-hues-30, 360-hues+30), 255, 255);
      } else
      {
        fill(random(hues-30, hues+30), 255, 255);
      }
      ellipse(x, y, out.left.get(i+1)*10, out.left.get(i+1)*10);
    }
  }
  for (int i=0; i<keys.length; i++) {
    keys[i].update();
    keys[i].display();
  }
}
void keyPressed()
{
  for (int i=0; i<keys.length; i++) {
    if (keys[i].isHover()) {
      keys[i].hitKey();
    }
  }
}

void mousePressed()
{
  for (int i=0; i<keys.length; i++) {
    if (keys[i].isHover2()) {
      keys[i].hitKey();
    }
  }
}

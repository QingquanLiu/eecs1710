class Keys {
  int xpos;
  int ypos;
  int wd;
  color bgCl;
  color hitCl;
  float alfa;
  char keys;
  String notes;
  Keys(String noteName, int _xpos, int _ypos, int _wd, char keys) {  //String是字符串的数据类型，文件名就是一个字符串
    notes=noteName;
    xpos=_xpos;
    ypos=_ypos;
    wd=_wd;
    this.keys=keys;
    bgCl=color(map(xpos, 0, width, 0, 255), 255, 255);
    hitCl=color(255, 0, 0);
    alfa=0;
  }

  boolean isHover2() {
    if (mouseX>xpos-wd/2 && mouseX<xpos+wd/2 &&
      mouseY>ypos-wd/2 && mouseY<ypos+wd/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean isHover() {
    if (key==keys) {
      return true;
    } else {
      return false;
    }
  }
  void hitKey() {
    println(notes);
    alfa=180;
    out.playNote( 0.00, 0.2, new PitchNameInstrument(notes, 2.33) );
  }
  void update() {
    alfa+=(0-alfa)*0.1;
  }
  void display() {
    noStroke();
    fill(bgCl);
    ellipse(xpos, ypos, wd, wd);
    fill(hitCl, alfa);
    ellipse(xpos, ypos, wd, wd);
  }
}

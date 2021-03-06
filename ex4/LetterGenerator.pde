class letter {
  
  String input;
  PVector position;
  PImage img;
  color col;
  
  letter(String _input, float x, float y) {
    input = _input;
    position = new PVector(x, y);
    col = getRandomColor();
    
    switch(input) {
      case "a":
      img = a;
      break;
      case "b":
      img = b;
      break;
      case "c":
      img = c;
      break;
    }
  }
  
  color getRandomColor() {
    return color(random(255), 127 + random(127), 127 + random(127));
  }
  
  void draw() {
    tint(0, 127);
    image(img, position.x + 10, position.y +10);
    
    tint(col);
    image(img, position.x, position.y);
    noTint();
  }
  
}

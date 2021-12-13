int[] lines;

void setup() {
  lines = new int[7];
  lines[0] = 600;
  lines[1] = 890 ;
  lines[2] = 800 + 24 + 36;
  lines[3] = 500 + 200 + 400 + 60 ;
  lines[4] = 554;
  lines[5] = 775;
  lines[6] = 337;
  
  size (1080, 1360);
  background(0, 0, 0);
}

void draw() {
  clear();
  for(int i = 0; i < lines. length; i++) {
    rect((width / 16) * (i * 2 - 1) + width / 16 + width / 36, height - (height / 16) - lines[i], width / 16, lines[i]);
    textSize(24);
    text("day: " + (i + 1) + "\nNumber of\nsteps walked\nper day:" +lines[i],
    (width / 16) * (i * 2 - 1) + width / 16 + width / 36,
    height - (height / 8) - (height / 32) - lines[1]);
  }
}

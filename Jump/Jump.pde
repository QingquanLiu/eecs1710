PImage img;
boolean flag;
boolean start=false;
int WIN_SCORE=2000;

class Obstacle {
  float x, y, size;
  boolean onScreen;
  color col;
  Obstacle(float x, float size, float horizon, color col) {
    this.x = x;
    this.y = horizon - size;
    this.size = size;
    this.col = col;
    this.onScreen = true;
  }
  void update(float speed) {
    this.onScreen = (this.x > -this.size);
    this.x -= speed;
  }
  void display() {
    fill(this.col);
    stroke(0);
    strokeWeight(2);
    rect(this.x, this.y, this.size, this.size);
  }
  boolean hits(TRex dino) {
    float halfSize = this.size / 2;
    float minimumDistance = halfSize + (dino.radius);
    float xCenter = this.x + halfSize;
    float yCenter = this.y + halfSize;
    float distance = dist(xCenter, yCenter, dino.x, dino.y);
    return (distance < minimumDistance);
  }
}

class TRex {
  float x, y, yVelocity, speed, radius;
  boolean onGround;
  TRex(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.yVelocity = 0;
    this.speed = 1;
    this.onGround = true;
    this.radius = radius;
  }
  void update(float platform) {
    float bottom = this.y + this.radius;
    float nextBottom = bottom + this.yVelocity;
    if (bottom <= platform && nextBottom >= platform) {
      this.yVelocity = 0;
      this.y = platform - this.radius;
      this.onGround = true;
    } else if (platform - bottom > 1) {
      this.yVelocity += this.speed;
      this.onGround = false;
    }
    this.y += this.yVelocity;
  };
  void jump () {
    this.yVelocity = -(this.radius * 0.7);
  };
  void display () {
    fill(#999999);
    stroke(255);
    strokeWeight(2);
    image(img, this.x, this.y, this.radius*2, this.radius*2);
  };
}

float horizon;
float obstacleSpeed;
float score;
ArrayList<Obstacle> obstacles;
TRex dino;



void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  horizon = height - 40;
  obstacleSpeed = 6;
  init();
  textSize(20);
  img=loadImage("kl.png");
}
void init() {
  float size = 20;
  dino = new TRex(size * 2, height - horizon, size);
  obstacles=new ArrayList<Obstacle>();
  score = 0;
  flag=true;
}

void startPage() {
  if (start)return ;
  background(255);
  fill(255);
  stroke(0);
  circle(width/2, height/2, 100);
  fill(0);
  text("START", width/2, height/2);
  if (mousePressed&&dist(mouseX, mouseY, width/2, height/2)<100) {
    start=true;
  }
}

void draw() {
  background(255);
  startPage();
  if (!start)return ;
  drawHUD();
  handleLevel(frameCount);
  dino.update(horizon);
  handleObstacles();
  noStroke();
  endGame();
  button(width/2, 100, 30);
}

void button(float x, float y, float r) {
  if (dist(mouseX, mouseY, x, y)<r&&dino.onGround) {
    if (mousePressed)
    {
      fill(0, 200, 0, 200);
    } else
    {
      fill(170);
    }
  } else
  {
    fill(255);
  }
  stroke(0);
  circle(x, y, r*2);
  textSize(r-10);
  fill(0);
  text("jump", x, y);
  if (mousePressed&&dist(mouseX, mouseY, x, y)<r&&dino.onGround)dino.jump();
}
void  drawHUD() {
  stroke(0);
  strokeWeight(2);
  line(0, horizon, width, horizon);
  noStroke();
  text("Score: " + score, width / 2, 30);
  dino.display();
}

void handleObstacles() {

  for (int i = obstacles.size() - 1; i >= 0; i--) {
    if (flag) obstacles.get(i).update(obstacleSpeed);
    obstacles.get(i).display();
    if (obstacles.get(i).hits(dino))
      flag=false;
    if (!obstacles.get(i).onScreen)
      obstacles.remove(i);
  }
}

void handleLevel(int nn) {
  if (!flag)return ;
  if (nn % 30 == 0) {
    float n = noise(nn);
    if (n > 0.5)
      newObstacle(n);
    if (nn % 120 == 0)
      obstacleSpeed *= 1.05;
  }
  score++;
}

void  newObstacle(float n) {
  color col = color(random(255), random(255), random(255));
  float size = random(30) + 20;
  Obstacle obs = new Obstacle(width + size, size, horizon, col);
  obstacles.add(obs);
}
void keyPressed() {
  if (!flag)return ;
  if ((keyCode == UP || keyCode == 32) && dino.onGround)
    dino.jump();
}
void endGame() {
  if (score>=WIN_SCORE)flag=false;
  if (flag)return ;
  noStroke();
  textSize(40);
  if (score>=WIN_SCORE)text("YOU WIN", width/2, height/2);
  else text("GAME OVER", width / 2, height / 2);
  textSize(20);
  text("Press \'space\' to restart", width / 2, height / 2 + 20);
}
void keyReleased() {
  if ((keyCode == UP || keyCode == 32)&&!start) {
    start=true;
  }
  if ((keyCode == UP || keyCode == 32)&&!flag)init();
}

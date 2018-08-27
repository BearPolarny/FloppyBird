class Pole {
  
  float yTop, yBottom;
  float x;
  float xGap, wGap;
  final private int maxGap = 200;
  final private int minGap = 150;
  final private int margin = 10;
  int[] colour;
  boolean scored = false;
  final static private float SPEED = 4;
  final static private float w = 16;
  
  Pole() {
    this.x = width;
    wGap = random(minGap, maxGap);
    xGap = random(wGap/2 + margin, height - wGap/2 - margin);
    yTop = xGap - wGap/2;
    yBottom = xGap + wGap/2;
    colour = new int[3];
    colour[0] = int(random(0, 256));
    colour[1] = int(random(0, 256));
    colour[2] = int(random(0, 256));
  }
  
  void show() {
    // Upper pole
    fill(colour[0], colour[1], colour[2]);
    noStroke();
    rect(x, 0, w, yTop);
    fill(colour[0], colour[1], colour[2]);
    noStroke();
    ellipse(x + w/2, yTop, w, w);
    // Lower pole
    fill(colour[0], colour[1], colour[2]);
    noStroke();
    rect(x, yBottom, w, height);
    fill(colour[0], colour[1], colour[2]);
    noStroke();
    ellipse(x + w/2, yBottom, w, w);
  }
  
  void update() {
    if (gameStarted && !gameLost)  x -= SPEED;
    checkCollision(bird);
  }
  
  boolean offscreen(){
    return this.x <= -(w/2);
  }
  
  void checkCollision(Bird bird) {
    if (bird.x + bird.d/2> this.x && bird.x - bird.d/2 < this.x + w) {
      if (bird.y + (bird.d / 2) - 2 > this.yBottom - w/2 + 2 || 
          bird.y - (bird.d / 2) + 2 < this.yTop + w/2 - 2) {
        gameLost = true;
      } else if (!scored) {
          score+=1;
          scored = true;
      }
    }
  }
}

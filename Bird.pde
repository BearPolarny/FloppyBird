class Bird {
  float x,y;
  float vel = 0;
  final static private float G = 1.5;
  final static float UP_FORCE = -25;
  final int d = 32;
  
  boolean started = false;
  
  Bird() {
    x = 64;
    y = height/2;
  }
  
  void show() {
    fill(255,0,0);
    noStroke();
    ellipse(x, y, d, d);
  }
  
  void update() {
    if (gameStarted && !gameLost) {
      vel += G;
      vel *= 0.9;  // Opór przyspieszania
      y += vel;
    }
    
    checkBoundries();
  }
  
  void checkBoundries() {
    if (y + d/2 > height) {
      gameLost = true;
    }
    if (y - d/2 < 0) {
      gameLost = true;
    }
  }
}

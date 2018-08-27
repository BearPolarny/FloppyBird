Bird bird;
ArrayList<Pole> poles;
int score;
boolean gameStarted = false;
boolean gameLost = false;
PFont text;

final static int SPACING = 45;   // Im większy tym rzadsze przeszkody

void setup() {
  score = 0;
  frameRate(60);
  size(600, 600);
  bird = new Bird();
  poles = new ArrayList();
  text = createFont("Arial",16,true);
  
}
  int z = 0;
void draw(){
  background(0);

  if((frameCount % SPACING == 0) && gameStarted && !gameLost) {
    poles.add(new Pole());
    z++;
    System.out.println("pole: " + z);
  }
  for(int i = poles.size()-1; i>=0; i--) {
    poles.get(i).update();
    poles.get(i).show();
    if (poles.get(i).offscreen()) {
      poles.remove(i);
    }
  }
  
  bird.update();
  bird.show();
  
  textFont(text, 32);
  fill(0,255,0);
  textAlign(CENTER);
  text("Score: " + score, width/2, height - 100);
  
  if(gameLost) {
    // TODO: Restart??
  }
}

void keyPressed(){
    if (key == ' ' && gameStarted) {
      bird.vel += Bird.UP_FORCE;
    }
    
    if (key == ENTER){ 
      gameStarted = true;
    }
    
  }

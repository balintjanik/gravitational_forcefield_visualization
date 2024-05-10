int num;
Particle[] p;

Vector[][] v;
int gridSize = 15; // size of grid in pixels (advised: 10, 15 or 20)
float border = 1.4; // maximum length of lines are gridSize-gridSize/border (advised: 1.4)
int n, m;

float animPace = 3;
boolean colored = true;
boolean orbitTest = false;

void setup(){
  size(1000, 1000);
  frameRate(1000);
  colorMode(RGB);
  scale(2);
  
  n = width/gridSize;
  m = height/gridSize;
  v = new Vector[n][m];
  
  twoPlanetSetup(); // 2 planets orbiting each other
  // orbitTestSetup(); // a sun, with planets around it, only sun's gravity affects planets
  
  for (int i = 0; i < n; i++){
    for (int j = 0; j < m; j++){
      v[i][j] = new Vector(new PVector((gridSize/2)+i*gridSize,(gridSize/2)+j*gridSize), new PVector(0,0), 2, 1000);
    }
  }

}

void draw(){
  background(0);
  
  if (!orbitTest){
    for (int i = 0; i < n; i++){
      for (int j = 0; j < m; j++){
        v[i][j].update(i, j);
      }
    }
  }
  
  
  if (orbitTest){
    noStroke();
    fill (255,255,255);
    ellipse(width/2+0.5, height/2+0.5, 25,25);
    for (int i = 30; i < width; i+=10){
      noFill();
      stroke(255,255,255,50);
      ellipse(width/2, height/2, i*2, i*2);
    }
    for (int i = 1; i < num; i++){
      p[i].update(i);
    }
  } else {
    for (int i = 0; i < num; i++){
      p[i].update(i);
    }
  }
  
  saveFrame("frame-#####.png");
  
}

void orbitTestSetup(){
  orbitTest = true;
  colored = false;
  num = 17;
  p = new Particle[num];
  p[0] = new Particle(new PVector(width/2, height/2), new PVector(0, 0), 30, 30000, 255, 255, 255);
  p[1] = new Particle(new PVector(width/2+180,     height/2), new PVector(0, 0.4086), 6, 500, 0, 0, 255);
  p[2] = new Particle(new PVector(width/2+170,     height/2), new PVector(0, 0.4203), 6, 500, 0, 45, 210);
  p[3] = new Particle(new PVector(width/2+160,     height/2), new PVector(0, 0.433), 6, 500, 0, 75, 180);
  p[4] = new Particle(new PVector(width/2+150,     height/2), new PVector(0, 0.4474), 6, 500, 0, 105, 150);
  p[5] = new Particle(new PVector(width/2+140,     height/2), new PVector(0, 0.463), 6, 500, 0, 135, 120);
  p[6] = new Particle(new PVector(width/2+130,     height/2), new PVector(0, 0.4805), 6, 500, 0, 165, 90);
  p[7] = new Particle(new PVector(width/2+120,     height/2), new PVector(0, 0.5), 6, 500, 0, 195, 60);
  p[8] = new Particle(new PVector(width/2+110,     height/2), new PVector(0, 0.522), 6, 500, 0, 225, 30);
  p[9] = new Particle(new PVector(width/2+100,     height/2), new PVector(0, 0.548), 6, 500, 0, 255, 0);
  p[10] = new Particle(new PVector(width/2+90,     height/2), new PVector(0, 0.578), 6, 500, 45, 210, 0);
  p[11] = new Particle(new PVector(width/2+80,     height/2), new PVector(0, 0.612), 6, 500, 75, 180, 0);
  p[12] = new Particle(new PVector(width/2+70,     height/2), new PVector(0, 0.654), 6, 500, 105, 150, 0);
  p[13] = new Particle(new PVector(width/2+60,     height/2), new PVector(0, 0.708), 6, 500, 135, 120, 0);
  p[14] = new Particle(new PVector(width/2+50,     height/2), new PVector(0, 0.774), 6, 500, 165, 90, 0);
  p[15] = new Particle(new PVector(width/2+40,     height/2), new PVector(0, 0.866), 6, 500, 195, 60, 0);
  p[16] = new Particle(new PVector(width/2+30,     height/2), new PVector(0, 0.995), 6, 500, 225, 30, 0);
  //p[17] = new Particle(new PVector(width/2+20,     height/2), new PVector(0, 1), 6, 500, 255, 0, 0);
  
}

void twoPlanetSetup(){
  colored = true;
  num = 2;
  p = new Particle[num];
  p[0] = new Particle(new PVector(width/2-100, height/2), new PVector(0, 0.3), 30, 10000, 0, 0, 0);
  p[1] = new Particle(new PVector(width/2+100, height/2), new PVector(0, -0.3), 30, 10000, 0, 0, 0);
}

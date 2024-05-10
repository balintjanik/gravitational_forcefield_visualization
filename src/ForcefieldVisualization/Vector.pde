class Vector {
  PVector pos, vel;
  float size, mass;
  
  Vector(PVector pos, PVector vel, float size, float mass){
    this.pos = pos;
    this.vel = vel;
    this.size = size;
    this.mass = mass;
  }
  
  void update(int i, int k){  
    vel.x = 0;
    vel.y = 0;
    float allForce = 0;
    for (int j = 0; j < num; j++){
      float ang = atan2(pos.y - p[j].pos.y, pos.x - p[j].pos.x);
      float dist = pos.dist(p[j].pos);
      float g = 6.6743 * pow(10, -11) * p[j].mass/dist;
      float force = g * v[i][k].mass * p[j].mass/dist;
      allForce += force;
      vel.x -= force*cos(ang)*animPace;
      vel.y -= force*sin(ang)*animPace;
    }

    if (Float.isNaN(vel.x)) vel.x = 1;
    if (Float.isNaN(vel.y)) vel.y = 1;
    if (vel.x == Float.POSITIVE_INFINITY) vel.x = 0;
    if (vel.x == Float.NEGATIVE_INFINITY) vel.x = 0;
    if (vel.y == Float.POSITIVE_INFINITY) vel.y = 1;
    if (vel.y == Float.NEGATIVE_INFINITY) vel.y = 0;
    
    float forceX = map(vel.x, -0.001, 0.001, -gridSize+(gridSize/border), gridSize-(gridSize/border));
    float forceY = map(vel.y, -0.001, 0.001, -gridSize+(gridSize/border), gridSize-(gridSize/border));
    if (forceX > gridSize-(gridSize/border)) forceX = gridSize-(gridSize/border);
    if (forceY > gridSize-(gridSize/border)) forceY = gridSize-(gridSize/border);
    if (forceX < -gridSize+(gridSize/border)) forceX = -gridSize+(gridSize/border);
    if (forceY < -gridSize+(gridSize/border)) forceY = -gridSize+(gridSize/border);
    
    float len = map (allForce, 0, 0.001, 0, gridSize-gridSize/border);//sqrt(pow(forceX,2)+pow(forceY, 2));  // length of the line
    if (colored){
    float r,g,b;
    float check1 = (float)gridSize/30;
    float check2 = (float)gridSize-(float)gridSize/1.2;
    if (len < check1){
      r = 0;
      g = 0;
      b = map (len,   0, check1, 150, 255);
    } else if (len < check2){
      r = 0;
      g = map (len, check1, check2, 0, 255);
      b = map (len, check2, check1, 0, 255);
    } else {
      r = map (len, check2, gridSize, 0, 255);
      g = map (len, gridSize, check2, 0, 255);
      b = 0;
    }
    stroke(r,g,b);
    } else {
      stroke(255,255,255);
    }
    line(pos.x, pos.y, pos.x+forceX, pos.y+forceY);
  }
}

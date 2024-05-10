class Particle {
  PVector pos, vel;
  float size, mass;
  float angCent, distCent;
  float cr,cg,cb;
  
  Particle(PVector pos, PVector vel, float size, float mass, float r, float g, float b){
    this.pos = pos;
    this.vel = vel;
    this.size = size;
    this.mass = mass;
    this.cr = r;
    this.cg = g;
    this.cb = b;
  }
  
  void update(int i){
    pos.add(vel.x*animPace, vel.y*animPace);
    
    float allForce = 0; // all the force affecting p[i] particle
    
    
    if (orbitTest){
      float ang = atan2(pos.y - p[0].pos.y, pos.x - p[0].pos.x);
        float dist = pos.dist(p[0].pos);
        float g = 6.6743 * pow(10, -11) * p[0].mass/dist;
        float force = g * p[i].mass * p[0].mass/dist;
        
        if (dist > p[0].size/1.5){
          vel.x -= force*cos(ang)*animPace;
          vel.y -= force*sin(ang)*animPace;
          allForce += force;
        }
    } else {
      for (int j = 0; j < num; j++){
        if (i != j){
          float ang = atan2(pos.y - p[j].pos.y, pos.x - p[j].pos.x);
          float dist = pos.dist(p[j].pos);
          float g = 6.6743 * pow(10, -11) * p[j].mass/dist;
          float force = g * p[i].mass * p[j].mass/dist;
          
          if (dist > p[j].size/1.5){
            vel.x -= force*cos(ang)*animPace;
            vel.y -= force*sin(ang)*animPace;
            allForce += force;
          }
        }
      }
    }
    
    noStroke();
    if (colored) fill (255,255,255);
    else fill (0,255,100);
    if (orbitTest) fill (cr,cg,cb);
    ellipse(pos.x, pos.y, size, size);
  }
}

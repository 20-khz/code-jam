class Particle 
{
  float x, y;
  float vx, vy;
  float ax, ay; 
  int r;
  
  public Particle() 
  {
    x = random(width);
    y = random(height);
    vx = random(-1, 1);
    vy = random(-1, 1);
    ax = ay = 0.0; 
    r = 10;
  }
  
  void move(float dt){
    vx = vx+dt*ax;
    vy = vy+dt*ay;
    x = (width + x+dt*vx)%width;
    y = (height + y+dt*vy)%height;
  }
}

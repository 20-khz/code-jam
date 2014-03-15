class Particle 
{
  float x, y;
  float vx, vy;
  int r;
  
  public Particle() 
  {
    x = random(800);
    y = random(600);
    vx = random(-1, 1);
    vy = random(-1, 1);
    r = 10;
  }
  
  void move(float dt){
    x = (x+dt*vx)%800;
    y = (y+dt*vy)%600;
  }
}

class Particle 
{
  float x, y;
  float vx, vy;
  
  public Particle() 
  {
    x = random(800);
    y = random(800);
    vx = random(-10, 10);
    vy = random(-10, 10)
  }
}

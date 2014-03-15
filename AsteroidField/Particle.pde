class Particle 
{
  float x, y;
  float vx, vy;
  float ax, ay; 
  float r;

  public Particle() 
  {
    x = random(width);
    y = random(height);
    float r_angle = random(TAU);
    float r_speed = random(0.0, 2.0);
    vx = r_speed  * cos(r_angle);
    vy = r_speed * sin(r_angle);
    ax = ay = 0.0; 
    r = random(2, 5);
  }
  void draw() {
    stroke(255);
    noFill();
    ellipse(x, y, r, r);
  }

  void move(float dt) {
    vx = vx+dt*ax;
    vy = vy+dt*ay;
    x = (width + x+dt*vx)%width;
    y = (height + y+dt*vy)%height;
  }
}


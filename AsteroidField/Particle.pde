class Particle 
{
  float x, y;
  float vx, vy;
  float ax, ay;
  float mass; 
  float r;

  public Particle() 
  {
    x = random(width);
    y = random(height);
    mass = 1.0;
    float r_angle = random(TAU);
    float r_speed = random(0.1, 0.2);
    vx = r_speed  * cos(r_angle);
    vy = r_speed * sin(r_angle);
    ax = ay = 0.0; 
    r = random(2, 5);
  }
  
  void add_force(float fx, float fy) {
    ax = ax + fx/mass;
    ay = ay + fy/mass;
  }
  
  void draw() {
    stroke(255);
    noFill();
    ellipse(x, y, r, r);
  }

  void move(float dt) {
    vx = (vx+dt*ax);
    vy = (vy+dt*ay);
    float v2 = vx*vx + vy*vy;
    float vmax2 = 0.3;
    float scale = sqrt(v2/vmax2);
    if (scale>1.0) {
      vx = vx / scale ;
      vy = vy / scale;
    }
    x = (width + x+dt*vx)%width;
    y = (height + y+dt*vy)%height;
    println(ax);
    ax = ay = 0.0;
  }
}


class Particle 
{
  float x, y;
  float vx, vy;
  float ax, ay;
  float mass; 
  float r;
  
  ParticlePoint[] points;

  public Particle() 
  {
    x = random(width);
    y = random(height);
    mass = 1.0;
    float r_angle = random(TAU);
    float r_speed = random(0.2, 1.0);
    vx = r_speed  * cos(r_angle);
    vy = r_speed * sin(r_angle);
    ax = ay = 0.0; 
    r = random(2, 5);
    
    // Build the particle co-ordinates
    createParticle();
  }
   
  void add_force(float fx, float fy) {
    ax = ax + fx/mass;
    ay = ay + fy/mass;
  }
  
    
  
  void createParticle() {
   points = new ParticlePoint[int(random(3, 7))];
  
   int angle = 0;
   int angleIncrement = 360/points.length;
     
   for(int i = 0; i < points.length; i++) {
     
     float x = sin(radians(angle)) * (r * random(5));
     float y = cos(radians(angle)) * (r * random(5));
     angle += angleIncrement;
     points[i] = new ParticlePoint(x, y);
   }
  }
  
  void draw() {
    stroke(255);
    noFill();
    
 pushMatrix();
    beginShape();
    for(int i = 0; i < points.length; i++) {
      vertex(points[i].x + this.x, points[i].y + this.y);
    }
    endShape(CLOSE);
    popMatrix();   
    //ellipse(x, y, r, r);
  }

  void move(float dt) {
    vx = vx+dt*ax;
    vy = vy+dt*ay;
    x = (width + x+dt*vx)%width;
    y = (height + y+dt*vy)%height;
    ax = ay = 0.0;
  }
}
